/*************/
/**
 *      NSN Nokia Flexi driver
 *      Copyright (C) Nokia 2014
 *
 * @file        mddg_sfn.c
 *
 *
 * @author      Rade Bozic,		NSN, rade.bozic.ext@nsn.com
 * @author      Thomas Moll,	NSN, thomas.moll.ext@nsn.com
 *
 * @brief   SFN (Serial Frame Number) Kernel driver to provide system frame
 *          number for FCM and FSP.
 *
 *
 *    Licence:
 *    This program is free software. You can redistribute it and/or modify
 *    it under the terms of the GNU General Public License version 2 as
 *    published by the Free Software Foundation.
 *
 *    Derived from:
 *
 * @version     0.2
 *
 * @date       08.02.2008
 *
 *
 * \par History:
 *
 * \verbatim
 * Version: | Date:      | Author: | Changes:
 *----------+------------+---------+--------------------------------------------
 * 01.00    | 06.02.2008 |  RB     |    First Version (only FSPC)
 *----------+------------+---------+--------------------------------------------
 *          | 15.2.2008  |  RB     |    SFN Version for FCMD
 *----------+------------+---------+--------------------------------------------
 *          | 21.2.2008  |  RB     |    Change u64 Timestamp to struct timespac
 *----------+------------+---------+--------------------------------------------
 *          | 05.3.2008  |  RB     |    Integration for poll and select
 *----------+------------+---------+--------------------------------------------
 *          | 10.3.2008  |  RB     |    Changed for dynamic MINOR
 *----------+------------+---------+--------------------------------------------
 *          | 14.3.2008  |  RB     |    Rename file from ddal_sfn_mod.c to mddg_sfn.c
 *          |            |         |    Include version string
 *----------+------------+---------+--------------------------------------------
 *          | 1.4.2008   |  RB     |    BUG: Changes between SFN_WAIT_SPECIFIC too
 *          |            |         |    SFN_WAIT_PERIODICC, and reverse
 *----------+------------+---------+--------------------------------------------
 *          | 30.09.2008 |  TM     |    BUG PR 44759ESPE04: set new SFN direct into CASA
 *          |            |         |    register. Casa takes care about the new sfn frame.
 *----------+------------+---------+--------------------------------------------
 *          | 09.02.2009 |  RB     |    Change the documentation for Doxygen
 *----------+------------+---------+--------------------------------------------
 *          | 06.05.2010 |  RB     |    Remove atomic_read by SFN wait next
 *----------+------------+---------+--------------------------------------------
 *          | 06.04.2017 |  WJJ    |    LTE3567 A-a feature, support extended DRX
 *----------+------------+---------+--------------------------------------------
 * \endverbatim
 *
 *
 *
 *
 */

#include <linux/time.h>
#include <linux/errno.h>
#include <linux/miscdevice.h>
#include <linux/platform_device.h>
#include <linux/poll.h>
#include <asm/atomic.h>
#include <linux/interrupt.h>
#include <asm/io.h>
#include <asm/div64.h>

#include "../include/mddg_system_driver.h"
#include "../include/mddg_defs.h"
#include "../include/mddg_irq.h"

#ifdef CONFIG_FCMD
#include "../include/mddg_clk.h"
#endif

#define MAX_N1_COUNTER_VALUE 0xFFFFFFFFFFULL /*!< 40bit number */
#define SFN_MAX   ((1<<20)-1)               /* Maximum value of SFN which contains 20bits. */
#define SFN_USR_VAL 0xFFFFF                 /*!< Use to extract 20bit SFN from higher range values */
#define BCN_UPPER_28_BITS_MASK 0xFFFFFFF000ULL /*!< Use to extract upper 28bits from 40bit BCN (lower 12bits are SFN) */
#define DEVICE_DRIVER_NAME_SFN "sfn"  /*!<  Driver Name: create a device node -> (dev/sfn   */

#ifdef CONFIG_FSPC
#if LINUX_VERSION_CODE == KERNEL_VERSION(2,6,19)
#define SFN_IRQ 48
#else
#define SFN_IRQ   irq_find_mapping(NULL, 0)
#endif
#endif

#ifdef CONFIG_FCMD
#define CFG_CASA2_BASE				0xD0100000  /*!< Base adress for CASA FPGA */
#define CASA2_FRAME_NR_REG			0x0007      /*!< Offset for SFN register*/
static u16 *sfn_number;         /*!< Pointer for iomap the SFN Register */
#endif

#ifdef CONFIG_FSPC
static u32 *sfn_number;         /*!< Pointer for iomap the SFN Register */
#endif

static u32 sfn_user_sync;       /*!< Needed by set SFN*/
static u32 sfn_user_value;      /*!< Needed by set SFN*/
static u32 local_hsfn;

static uint64_t bcn_n1;              /*!< BCN N1 counter */
static uint32_t bcn_n2;              /*!< BCN N2 counter */
static uint32_t bcn_n1_user_sync;    /*!< Sync BCN N1 with next inperrupt */
static uint64_t bcn_n1_user_value;   /*!< BCN N1 counter value set by user */

static struct sfn_data bts_rtc_value;       /*!< Current {BTS RTC, BCN N1} pair */
static uint32_t bts_rtc_sync;               /*!< Triggers BTS RCT sync */
static struct sfn_data bts_rtc_user_value;  /*!< New {BTS RTC, BCN N1} pair from user */
static uint32_t osutc_bts_rtc_sync;         /*!< Triggers OS UTC and BTS RCT sync */

#ifdef CONFIG_FSPC
#define SFN_WRITE(addr,value) out_be32(addr, value)
#define SFN_READ(addr)        in_be32(addr)
#endif

#ifdef CONFIG_FCMD
#define SFN_WRITE(addr,value) CASA_WRITE(addr,value)
#define SFN_READ(addr) CASA_READ(addr)
#endif


struct sfn_data                 /*!< Interface between the User and Kernel Space*/
{
    uint32_t sfn;               /*!< Currently SFN*/
    uint64_t bcn_n1;            /*!< Current BCN N1 */
    struct timespec timestamp;  /*!< Timestamp for the current SFN*/
};

#define SFN_IOCTL_BASE  0xF9  /*!< Base value for IOCTL calls*/
#define SFN_GET             _IOR( SFN_IOCTL_BASE, 1 , struct sfn_data)      /*!< Reads the current SFN and timestamp from the driver into the given data structure.*/
#define SFN_SET             _IOW( SFN_IOCTL_BASE, 2 , u32)                  /*!< Writes the SFN into the driver.*/
#define SFN_WAIT_NEXT       _IOR( SFN_IOCTL_BASE, 3 , struct sfn_data)      /*!< Waits for the next SFN interrupt to occur and delivers the current SFN and timestamp back to the application.*/
#define SFN_WAIT_SPECIFIC   _IOWR( SFN_IOCTL_BASE, 4 , struct sfn_data)     /*!< Waits for the specific SFN given in the data structure and then delivers the current SFN and timestamp back to the application.*/
#define SFN_WAIT_PERIODIC   _IOWR( SFN_IOCTL_BASE, 5 , struct sfn_data)     /*!< Waits for the periodic SFN ( SFN % periodic_SFN ). "periodic_SFN" is given in the data structure and then delivers the current SFN and timestamp back to the application.*/
#define SFN_SET_BCN                     _IOW( SFN_IOCTL_BASE, 6 , uint64_t)             /*!< Writes BCN N1 into the driver */
#define SFN_SET_BTSRTC_BCN              _IOW( SFN_IOCTL_BASE, 7 , struct sfn_data)      /*!< Writes {BTS, RTC} pair to the driver */
#define SFN_GET_BCN                     _IOR( SFN_IOCTL_BASE, 8 , uint64_t)             /*!< Reads current BCN N1 from the driver */
#define SFN_GET_BTSRTC_BCN              _IOWR( SFN_IOCTL_BASE, 9 , struct sfn_data)     /*!< Reads {BTS, RTC} pair from the driver */
#define SFN_WAIT_BTSRTC_BCN             _IOWR( SFN_IOCTL_BASE, 10 , struct sfn_data)    /*!< Waits for next SFN interrupt and delivers {BTSRTC, BCN} pair of that moment */
#define SFN_SYNC_BTSRTC_WITH_OSUTC      _IOWR( SFN_IOCTL_BASE, 11 , struct sfn_data)    /*!< Synchronize BTS RTC (BCN with timestamp) with OS time */
#define HSFN_SET                        _IOW( SFN_IOCTL_BASE, 12 , u32)                 /*!Writes the extended SFN into the driver */

struct struct_poll_sfn   /*!<Used by sfn_poll*/
{
    struct file *sfn_file;      /*!< File descriptor will be set in sfn_open*/
    u32 sync;                   /*!< sync will be set in sfn_interrupt. Needed to sincronize between ISR and sfn_poll */
    u32 sfn_tmp;                /*!< sfn_tmp will be set in sfn_interrupt */
    u32 sfn_specific;           /*!< Used for sfn_poll.This value set the User with IOCTL -> SFN_WAIT_SPECIFIC*/
    u32 sfn_periodic;           /*!< Used for sfn_poll.This value set the User with IOCTL -> SFN_WAIT_PERIODIC*/
    wait_queue_head_t irq_wait; /*!< This ist the wait queue for the own file descriptor*/
    struct list_head poll_list; /*!< This is entry to the global list for the own file descriptor*/
};

struct struct_poll_sfn global_poll_struct;      /*!< Used by sfn_poll,sfn_interrupt and sfn_ioctl  (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/

static DECLARE_WAIT_QUEUE_HEAD(sfn_next_queue); /*!< Used by SFN_WAIT_NEXT*/
struct timespec timestamp;

int poll_interrupt_sync = 0;                /*!< Syncronisation between ISR and sfn_poll*/

static void local_hsfn_update(u32 hsfn)
{
    u16 low_12bits_sfn = hsfn & 0xFFF;
    u16 casa_sfn = SFN_READ(sfn_number) & 0x0FFF;
    if (casa_sfn < low_12bits_sfn)
        local_hsfn = (hsfn & 0xFF000) | casa_sfn + 0x1000;
    else
        local_hsfn = (hsfn & 0xFF000) | casa_sfn;
}

/**
 *       SFN interrupt service routine
 *
 * \retval      0           IRQ_HANDLED
 *
 */
static irqreturn_t sfn_interrupt(int irq, void *dev_id)
{
    struct struct_poll_sfn *sfn_interrupt_tmp;
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
    test
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
    {   /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
        list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list,
                            poll_list)
        {
            printk("got sfn interrupt_tmp\n");
            if (sfn_interrupt_tmp->sfn_periodic)
            {
#ifdef CONFIG_FSPC
                if (!(SFN_READ(sfn_number) % sfn_interrupt_tmp->sfn_periodic)
                        && SFN_READ(sfn_number))
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
                    sfn_interrupt_tmp->sfn_tmp = SFN_READ(sfn_number);
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
#ifdef CONFIG_FCMD
                if (!(local_hsfn % sfn_interrupt_tmp->sfn_periodic)
                        && local_hsfn)
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
                    sfn_interrupt_tmp->sfn_tmp = local_hsfn;
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
            }
            else
            {
#ifdef CONFIG_FSPC
                if ((SFN_READ(sfn_number) % 4096) == (sfn_interrupt_tmp->sfn_specific % 4096))
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
                    sfn_interrupt_tmp->sfn_tmp = SFN_READ(sfn_number);
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
#ifdef CONFIG_FCMD
                if ((local_hsfn % 4096) == (sfn_interrupt_tmp->sfn_specific % 4096))
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
                    sfn_interrupt_tmp->sfn_tmp = local_hsfn;
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
            }
        }
    }

    return IRQ_HANDLED;         /* handled */
}

/**
 *       Calculate current BTS RTC from current BCN N1 and earlier stored reference BTS RTC, BCN value pair
 *
 */
static void calculate_current_bts_rtc(struct sfn_data * bts_rtc_bcn_pair)
{
    u64 bcn_delta_n1, bcn_delta_ns, bcn_delta_sec;
    struct timespec bts_rtc_time = {0,0};

    // Sanity checks
    if (bcn_n1 < bts_rtc_value.bcn_n1)
    {
        printk(KERN_WARNING "Current BCN smaller than BTS RTC BCN; resync needed\n");
        bts_rtc_bcn_pair->bcn_n1 = 0ULL;
        bts_rtc_bcn_pair->timestamp = bts_rtc_time;
        return;
    }

    bts_rtc_time = bts_rtc_value.timestamp; // Take BTS RTC reference point as a starting point

    bcn_delta_n1 = bcn_n1 - bts_rtc_value.bcn_n1; // delta in BCN N1 values
    bcn_delta_sec = bcn_delta_n1;
    do_div(bcn_delta_sec, 100); // delta in full seconds
    bcn_delta_ns = (bcn_delta_n1 - (bcn_delta_sec * 100)) * 10000000L; // remaining delta N1 in nanoseconds

    // Add BCN delta as nanoseconds to BTS RTC starting time.
    // We add whole seconds beforehand since othervice we give
    // big value to timespec_add_ns which makes it slow.
    bts_rtc_time.tv_sec += bcn_delta_sec; // Add full seconds to destination
    timespec_add_ns(&bts_rtc_time, bcn_delta_ns);

    bts_rtc_bcn_pair->bcn_n1 = bcn_n1;
    bts_rtc_bcn_pair->timestamp = bts_rtc_time;
}

/**
 *       IOCTL and Interface for the User Space.
 *
 *
 * \retval      EFAULT      error
 * \retval      0           ok
 *
*/
static int sfn_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
                     unsigned long arg)
{
    struct sfn_data sfn_param;
    struct struct_poll_sfn *pp = file->private_data;
    u32 value_tmp;

    switch (cmd)
    {
    case HSFN_SET:    //User set the extended sfn value(20 bits)
        if (copy_from_user(&sfn_user_value, (u32 *) arg, sizeof(u32)))  //sfn_user_value is global variable (set SFN in ISR)
            return -EFAULT;
        if (sfn_user_value > SFN_MAX || sfn_user_value < 0)
            return -EFAULT;
        local_hsfn_update(sfn_user_value);
        break;

    case SFN_SET:   //user set the sfn value(12 bits)
        if (copy_from_user(&sfn_user_value, (u32 *) arg, sizeof(u32)))  //sfn_user_value is global variable (set SFN in ISR)
            return -EFAULT;
        if (sfn_user_value > SFN_MAX || sfn_user_value < 0)
            return -EFAULT;
#ifdef CONFIG_FSPC
        sfn_user_sync = 1;      //Syncronisation with ISR
#endif
#ifdef CONFIG_FCMD
        SFN_WRITE(sfn_number, sfn_user_value);
#endif
        break;

    case SFN_SET_BCN:
        if (copy_from_user(&bcn_n1_user_value, (u64 __user*)arg, sizeof(u64)))
            return -EFAULT;
        if (bcn_n1_user_value > MAX_N1_COUNTER_VALUE)
            return -EFAULT;
        sfn_user_value = (u32)bcn_n1_user_value & SFN_USR_VAL;
#ifdef CONFIG_FCMD
        local_hsfn_update(sfn_user_value);
#endif
        bcn_n1_user_sync = 1;   //Syncronisation with ISR
        break;

    case SFN_SET_BTSRTC_BCN:
        if (copy_from_user(&sfn_param, (struct sfn_data *) arg, sizeof(struct sfn_data)))
            return -EFAULT;
        if (sfn_param.bcn_n1 > MAX_N1_COUNTER_VALUE)
            return -EFAULT;
        bts_rtc_user_value = sfn_param; /* bts_rtc_value is global variable (set BTS RTC in ISR) */
        bcn_n1_user_value = sfn_param.bcn_n1;
        sfn_user_value = (u32)bcn_n1_user_value & SFN_USR_VAL;
#ifdef CONFIG_FCMD
        local_hsfn_update(sfn_user_value);
#endif
        bcn_n1_user_sync = 1;   //Syncronisation with ISR
        bts_rtc_sync = 1;       //Trigger syncronisation in ISR
        break;

    case SFN_GET:
#ifdef CONFIG_FCMD
        local_hsfn_update(local_hsfn);
#endif
        sfn_param.sfn = local_hsfn;             //write SFN
        sfn_param.timestamp = timestamp;        //write system time
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
            return -EFAULT;
        break;

    case SFN_GET_BCN:
        if (copy_to_user((uint64_t *)arg, &bcn_n1, sizeof(uint64_t)))
            return -EFAULT;
        break;

    case SFN_GET_BTSRTC_BCN:
        calculate_current_bts_rtc(&bts_rtc_value);
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
            return -EFAULT;
        break;

    case SFN_WAIT_NEXT:
        interruptible_sleep_on(&sfn_next_queue);        //Wakeup by ISR
#ifdef CONFIG_FCMD
        local_hsfn_update(local_hsfn);
#endif
        sfn_param.sfn = local_hsfn;             //write current SFN
        sfn_param.timestamp = timestamp;        //write current system time
        sfn_param.bcn_n1 = bcn_n1;              //write current BCN N1
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
            return -EFAULT;
        break;

    case SFN_WAIT_BTSRTC_BCN:
        interruptible_sleep_on(&sfn_next_queue);    //Wakeup by ISR
        calculate_current_bts_rtc(&bts_rtc_value);
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
            return -EFAULT;
        break;

    case SFN_WAIT_SPECIFIC:
        if (copy_from_user(&value_tmp, (u32 *) arg, sizeof(u32)))        //Copy from user the SFN
            return -EFAULT;
        if (value_tmp > SFN_MAX || value_tmp < 0)
            return -EFAULT;
        if((pp->sfn_specific == -1) && (pp->sfn_periodic == 0)) {
            init_waitqueue_head(&pp->irq_wait);     //to initialise the wait queue for the SFN
            pp->sfn_specific=value_tmp;
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
        }
        else
        {
            pp->sfn_periodic = 0;
            pp->sfn_specific=value_tmp;
        }
        break;

    case SFN_WAIT_PERIODIC:
        if (copy_from_user(&value_tmp, (u32 *) arg, sizeof(u32)))        //Copy from user the SFN
            return -EFAULT;     //to initialise the wait queue for the SFN
        if (value_tmp > SFN_MAX || value_tmp < 1)
            return -EFAULT;

        if((pp->sfn_specific == -1) && (pp->sfn_periodic == 0)) {
            init_waitqueue_head(&pp->irq_wait);
            pp->sfn_periodic = value_tmp;
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
        }
        else
        {
            pp->sfn_specific = -1;
            pp->sfn_periodic= value_tmp;
        }
        break;

    case SFN_SYNC_BTSRTC_WITH_OSUTC:
        osutc_bts_rtc_sync = 1;
        break;

    default:
        pr_err("SFN IOCTL: Unknown command: %u\n", cmd);
        return -ENOTTY;
    }

    return 0;
}

/**
 *       By close the File descriptor, this function will be called.
 *
 * \retval      0           ok
 *
 */
static int sfn_close(struct inode *inode, struct file *file)
{

    struct struct_poll_sfn *pp = file->private_data;
    struct struct_poll_sfn *poll_tmp;
    int list_elements = 0;

    if ((pp->sfn_specific < 4096 && pp->sfn_specific >= 0) || pp->sfn_periodic)
    {
        list_for_each_entry(poll_tmp, &global_poll_struct.poll_list, poll_list)
        {
            list_elements++;
            if (poll_tmp->sfn_file == file)
            {
                list_del(&pp->poll_list);
                printk("Delete pp\n");
                break;
            }
        }

        if (list_elements == 1) { /*By last list element set poll_interrupt_sync 0 =>*/
            poll_interrupt_sync = 0;    /* none syncronisation more between ISR and sfn_poll*/
        }
    }

    kfree(pp);
    printk("sfn_close called\n");

    return 0;
}

/**
 *   By open new File descriptor, this function will be called.
 *   1. Allocate memory for private data
 *   2. Set the values in the private data
 *   3. Set file->private_data to allocate memory
 *
 * \retval      ENOMEM      Can not allocate the memory
 * \retval      0           ok
 *
 */
static int sfn_open(struct inode *inode, struct file *file)
{
    struct struct_poll_sfn *pp;
    pp = kmalloc(sizeof(struct struct_poll_sfn), GFP_KERNEL);
    if (!pp)
        return -ENOMEM;

    pp->sfn_file = file;
    pp->sfn_specific = -1;
    pp->sfn_periodic = 0;
    file->private_data = pp;
    printk("sfn_open called\n");
    return 0;

}

/**
 * For the select or poll function in the User Space.
 *
 * \retval      0           Time out by select
 * \retval      POLLIN      Wake up the File descriptor by select
 *
 */
static unsigned int sfn_poll(struct file *file,
                             struct poll_table_struct *sfn_pool_table)
{
    struct struct_poll_sfn *pp = file->private_data;

    poll_interrupt_sync = 1;

    poll_wait(file, &pp->irq_wait, sfn_pool_table);

    if (pp->sync)
    {
        if (pp->sfn_periodic)
        {
            if (!(pp->sfn_tmp % pp->sfn_periodic) && pp->sfn_tmp)
            {
                pp->sync = 0;   /* pp->sync is set by ISR*/
                return POLLIN | POLLRDNORM | POLLHUP;
            }
        }
        else
        {
            if (pp->sfn_tmp == pp->sfn_specific)
            {
                pp->sync = 0;   /*pp->sync is set by ISR*/
                return POLLIN | POLLRDNORM | POLLHUP;
            }
        }
    }
    return 0;
}

static const struct file_operations sfn_fops = {
    .owner = THIS_MODULE,
    .open = sfn_open,
    .ioctl = sfn_ioctl,
    .poll = sfn_poll,
    .release = sfn_close,
};

static struct miscdevice sfn_dev =
    { MISC_DYNAMIC_MINOR, DEVICE_DRIVER_NAME_SFN, &sfn_fops };


/**
 *      Hardware init.
 *
 * \retval      0           ok
 * \retval      < 0      error
 *
 */
static int __init sfn_init(void)
{
    int ret;

    bcn_n1 = 0;
    bcn_n2 = 0;
    bcn_n1_user_sync = 0;
    bcn_n1_user_value = 0;
    bts_rtc_sync = 0;
    local_hsfn = 0;
    memset((void*)&bts_rtc_value, 0, sizeof(bts_rtc_value));
    memset((void*)&bts_rtc_user_value, 0, sizeof(bts_rtc_user_value));

    printk(KERN_INFO "Initializing sfn_mod\n");
#ifdef CONFIG_FCMD              //By FCMD is Frame Register on CASA2
    if (!(sfn_number = ioremap(CFG_CASA2_BASE + (CASA2_FRAME_NR_REG * 2), 2)))
    {
        printk(KERN_ERR "CASA2: unable to map FRAME_REG\n");
        return -ENOMEM;
    }
#endif
#ifdef CONFIG_FSPC              //By FSPC we simulate the Frame Register
    sfn_number = &local_hsfn;
#endif

    bcn_n1 = SFN_READ(sfn_number);
    local_hsfn = *sfn_number;

    ret = misc_register(&sfn_dev);
    if (ret)
    {
        printk(KERN_ERR "Unable to register sfn_mod device.\n");
        return ret;
    }
    memset(&global_poll_struct, 0, sizeof(struct struct_poll_sfn));

#ifdef CONFIG_FCMD
    ret = mddg_request_irq(SFN_INTERRUPT, (irq_isr_t) sfn_interrupt, IRQF_DISABLED,DEVICE_DRIVER_NAME_SFN,  NULL);
#else
    ret = request_irq(SFN_IRQ, sfn_interrupt, IRQF_DISABLED,DEVICE_DRIVER_NAME_SFN, NULL);
#endif
    if (ret)
    {
        misc_deregister(&sfn_dev);
        printk(KERN_ERR "SFN: Unable to set IRQ .\n");
        return ret;
    }

    INIT_LIST_HEAD(&global_poll_struct.poll_list);
    init_waitqueue_head(&sfn_next_queue);

    return ret;
}

/**
 *      Used after removed the SFN modul.
 *
 */
static void __exit sfn_exit(void)
{
#ifdef CONFIG_FCMD
    mddg_free_irq(SFN_INTERRUPT,NULL);
    iounmap(sfn_number);
#else
    free_irq(SFN_IRQ, NULL);
#endif
    misc_deregister(&sfn_dev);
}

module_exit(sfn_exit);
module_init(sfn_init);

MODULE_AUTHOR("Rade Bozic <rade.bozic.ext@nsn.com>");
MODULE_DESCRIPTION("SFN (System Frame Number) Device Driver ");
MODULE_LICENSE("GPL");
MDDG_MODULE_VERSION;


