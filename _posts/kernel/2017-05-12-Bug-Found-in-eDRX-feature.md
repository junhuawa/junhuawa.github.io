---
layout: post
title: "HSFN value is wrong in the critical area"
date: 2017-05-12
category: "eDRX feature" 
tags: [hsfn]
---

#### Code of mddg_sfn.c

```
    static u32 local_hsfn;
    static void local_hsfn_update(u32 hsfn)
    {
        u16 low_12bits_sfn = hsfn & 0xFFF;
        u16 casa_sfn = SFN_READ(sfn_number) & 0x0FFF;
        if (casa_sfn < low_12bits_sfn)
            local_hsfn = ((hsfn & 0xFF000) | casa_sfn) + 0x1000;
        else
            local_hsfn = (hsfn & 0xFF000) | casa_sfn;
    }

    static irqreturn_t sfn_interrupt(int irq, void *dev_id)
    {
        struct timeval osUtc;

        ktime_get_ts(&timestamp);   /*Set current time for SFN   */

    #ifdef CONFIG_FCMD
        mddg_clk_frame_notifier();
        local_hsfn_update(local_hsfn);
    #endif

        if (bcn_n1 >= MAX_N1_COUNTER_VALUE)
        {
            bcn_n1 = 0;
        }
        else
        {
            bcn_n1 = bcn_n1 + 1; // BCN is SW counter
        }

        if(bcn_n1_user_sync)     // sync bcn to fspc board
        {
    #ifdef CONFIG_FSPC
            SFN_WRITE(sfn_number, sfn_user_value);
    #endif
            bcn_n1 = bcn_n1_user_value;
            bcn_n1_user_sync = 0;
        }
        else if (sfn_user_sync)
        {   /*By sfn_ioctl => User set the SFN (SFN_SET)*/
            SFN_WRITE(sfn_number, sfn_user_value);
            sfn_user_sync = 0;
        }
    #ifdef CONFIG_FCMD
        else if (local_hsfn >= SFN_MAX)
        {
            local_hsfn_update(0);
        }
    #endif
    #ifdef CONFIG_FSPC
        else if (SFN_READ(sfn_number) >= SFN_MAX)
        {   /*MAX SFN is 1048575 (range 0...1048575)*/
            SFN_WRITE(sfn_number, 0);        /*SFN begins again from zero*/
        }
        else
        {
            SFN_WRITE(sfn_number, SFN_READ(sfn_number)+1); /*By FSPC we simulate the Frame Register*/
        }
    #endif

        if (bts_rtc_sync)
        { /* By sfn_ioctl => User set the BTS RTC and BCN pair */
            bts_rtc_value = bts_rtc_user_value;
            bts_rtc_sync = 0;
        }
        if (osutc_bts_rtc_sync)
        {
            do_gettimeofday(&osUtc);
            bts_rtc_value.bcn_n1 = bcn_n1;
            bts_rtc_value.timestamp.tv_sec = osUtc.tv_sec;
            bts_rtc_value.timestamp.tv_nsec = osUtc.tv_usec * 1000;
            osutc_bts_rtc_sync = 0;
        }
        wake_up_interruptible(&sfn_next_queue); /*By sfn_ioctl => User wait next SFN (SFN_WAIT_NEXT)*/

        if (poll_interrupt_sync)
        {
            /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
            sfn_sync_between_isr_and_sfn_poll();
        }

        return IRQ_HANDLED;         /* handled */
    }
```

From the code, there is a isr handler which will be run every 10ms (SFN
interrupt), and the local_hsfn value will be incremented 1, and round if it's
value is 0xFFFFF.

In the isr handler, and in FCMD board, we will update the hsfn value first,
then later check if local_hsfn value == 0xFFFFFF, it will be set to 0. So, it
means the local_hsfn value will increment like below:

    0xFFFFD -> 0xFFFFE -> 0xFFF

This is not what we expect. 

    ok 750 - sfn prev: 0xFFFFA, current: 0xFFFFB
    ok 751 - sfn prev: 0xFFFFB, current: 0xFFFFC
    ok 752 - sfn prev: 0xFFFFC, current: 0xFFFFD
    ok 753 - sfn prev: 0xFFFFD, current: 0xFFFFE
    not ok 754 - sfn prev: 0xFFFFE, current: 0xFFF
    #     Failed test in 013-hsfn-critical-value-set-get.c at line 91
    #     Condition: sfn_current == (sfn_prev + 1)%(DDAL_MAX_HSFN + 1)
    ok 755 - sfn prev: 0xFFF, current: 0x1000
    ok 756 - sfn prev: 0x1000, current: 0x1001

So, the correction is to change the order of local_hsfn update and check if
it's out of range. 
Correct order in the isr handler:

```c
    #ifdef CONFIG_FCMD
        else if (local_hsfn >= SFN_MAX)
        {
            local_hsfn_update(0);
        }
        local_hsfn_update(local_hsfn);
    #endif
```

`local_hsfn_update(local_hsfn)` used to correct the hsfn value, because we
afraid in some cases, the isr handler will be lost to run in every 10ms, but
the SFN value got from Casa register is right.
