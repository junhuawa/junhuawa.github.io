---
layout: post
title: "Oops: Kernel access of bad area, sig: 11"
date: 2017-04-17
category: "oops" 
tags: [linux]
---
### Problem Description
This problem was happened when we develop the eDRX feature, which need to
enlarge the sfn value from 12 bits to 20 bits, colleague have changed the
code, but found sometimes kernel complain oops when call the
ddal_sfn_wait_for() api.

This API will let the process wait after a certain period(certain sfn value).
When the API call, it will open the fd of /dev/sfn, set specific value to the
fd by ioctl, then poll the fd until POLLIN success, then get the sfn value,
then close the fd.

```sh
    (10:20:24 AM)test@Tesla: /var/fpwork1/jiajuwu/mREC/src-fcmdtest/tests/functional/ddal/sfn
    (10:21:00 AM)test@Tesla: make test TARGET_IP=10.69.6.16 TARGET_PORT=22
```

```c
    int ddal_sfn_wait_for(uint32_t *sfn, struct timespec *timestamp)

    ioctl(global_fd, SFN_WAIT_SPECIFIC, &sfn_for)

    while (running)
    {   
        ddal_poll_fd.fd = global_fd;
        ddal_poll_fd.events = POLLIN;

        poll(&ddal_poll_fd, 1, 1000);

        if (ddal_poll_fd.revents & POLLIN)
        {   
            ret = ddal_sfn_get(sfn, timestamp);
            break;
        }

        if (ddal_poll_fd.revents & POLLERR)
        {   
            return -errno;
        }
    }
```

So, in the driver, ioctl will add the process to a wait queue, when poll, it
will set poll_interrupt_sync = 1, when the specifice time is come, POLLIN will
be set, and the process get new sfn value, then call sfn_close() to close the
fd. 

When we do the testing, OOPS happen when complete the test.

### Logs for OOPS problem
a stack trace

    [  115.372701] Unable to handle kernel paging request for data at address 0x0000
    [  115.380176] Faulting instruction address: 0xd68fb520
    [  115.385137] Oops: Kernel access of bad area, sig: 11 [#1]
    [  115.390526] PREEMPT FCMD
    [  115.393053] Modules linked in: udpcp sctp crc32c libcrc32c mddg_muksu sfp mddddg_paniclog ipv6 deflate zlib_deflate cryptomgr pcompress aead crypto_hash cryp
    [  115.432543] NIP: d68fb520 LR: d68fb42c CTR: c01587d4
    [  115.437502] REGS: c7b79dd0 TRAP: 0300   Not tainted  (2.6.32.60-2-sampleversi
    [  115.445323] MSR: 00021000 <ME,CE>  CR: 44002024  XER: 20000000
    [  115.451165] DEAR: 00000000, ESR: 00000000
    [  115.455167] TASK = c7aef120[1473] 'mv' THREAD: c7b78000
    [  115.460209] GPR00: d68fb42c c7b79e80 c7aef120 00000028 0001efc2 ffffffff c015
    [  115.468581] GPR08: c02eeb28 ffffffe4 00000000 c7b79e40 c021dc0c 100cc28c 0eff
    [  115.476952] GPR16: 48018538 48018f6c 4802bf18 4802c850 00000001 100a50b0 0000
    [  115.485324] GPR24: c028cbe8 00000004 00000001 00000013 00000000 00000000 0000
    [  115.493885] NIP [d68fb520] sfn_interrupt+0x374/0x3d0 [mddg_sfn]
    [  115.499802] LR [d68fb42c] sfn_interrupt+0x280/0x3d0 [mddg_sfn]
    [  115.505626] Call Trace:
    [  115.508070] [c7b79e80] [d68fb42c] sfn_interrupt+0x280/0x3d0 [mddg_sfn] (unrel
    [  115.515741] [c7b79ec0] [d68067f8] cpu_isr+0x78/0xc4 [mddg_irq]
    [  115.521580] [c7b79ee0] [c0060288] handle_IRQ_event+0x54/0x10c
    [  115.527328] [c7b79f10] [c0062794] handle_fasteoi_irq+0xcc/0x154
    [  115.533249] [c7b79f30] [c0003ea8] do_IRQ+0x5c/0x90
    [  115.538044] [c7b79f40] [c000e668] ret_from_except+0x0/0x18
    [  115.543523] Instruction dump:
    [  115.546484] 7d234b78 38800001 38a00001 38c00000 48001811 81210008 8129001c 91
    [  115.554248] 81210010 3929ffe4 91210008 81210008 <8129001c> 91210024 81210024
    [  115.562190] Kernel panic - not syncing: Fatal exception in interrupt
    [  115.568673] Rebooting in 180 seconds..

### Add debug info to the Kernel module when do compilation
    
    make -C /KDIR modules EXTRA_CFLAGS="-g -DDEBUG"

### Makefile for kernel module compilation

```makefile
    MODULE=mddg_sfn

    KDIR  := /dev/shm/junhuawa/mREC/src-fsmbos/src/kernel/build/fcmd/kernel 
    PWD   := $(shell pwd)

    default:
        $(MAKE) -C $(KDIR)  SUBDIRS=$(PWD) modules ARCH=powerpc CROSS_COMPILE=/build/home/SC_LFS/sdk/tags/PS_LFS_SDK_3_28/bld-tools/x86_64-pc-linux-gnu/bin/powerpc-e500-linux-gnu- EXTRA_CFLAGS="-g -DDEBUG"

    clean:
        rm -rf $(MODULE).o *~ core .depend .*.cmd *.ko *.mod.[co] .tmp_versions Module.symvers
```

### Disassemble the sfn_interrupt function(kernel module)

    powerpc-e500-linux-gnu-objdump -S mddg_sfn.ko > /tmp/mddg_sfn.s
    -S --source Display source code intermixed with disassembly, if possible.  Implies -d.

### Bug in the code 

Here **4096** should be (2^20) or (SFN_MAX + 1), because sfn value range is (0 ~ 2^20 -1), instead of previous 4096.

```c
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
                    break;
                }
            }

            if (list_elements == 1) { /*By last list element set poll_interrupt_sync 0 =>*/
                poll_interrupt_sync = 0;    /* none syncronisation more between ISR and sfn_poll*/
            }
        }

        kfree(pp);

        return 0;
    }
```

#### Code where Instruction is located
    0x374 = 884(decimal)

    if (poll_interrupt_sync)
    {   /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
        list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list,
     504:   81 21 00 08     lwz     r9,8(r1)
     508:   81 29 00 1c     lwz     r9,28(r9)
     50c:   91 21 00 10     stw     r9,16(r1)
     510:   81 21 00 10     lwz     r9,16(r1)
     514:   39 29 ff e4     addi    r9,r9,-28
     518:   91 21 00 08     stw     r9,8(r1)
     51c:   81 21 00 08     lwz     r9,8(r1)
     520:   81 29 00 1c     lwz     r9,28(r9)
     524:   91 21 00 24     stw     r9,36(r1)
    #define ARCH_HAS_PREFETCHW
    #define ARCH_HAS_SPINLOCK_PREFETCH

#### Code Where NIP shows

    [junhuawa@Tesla build]$ powerpc-e500-linux-gnu-gdb fcmd/kernel/extra/sfn/mddg_sfn.ko
    GNU gdb (GDB) 7.8.2.20150113-cvs
    Copyright (C) 2014 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=x86_64-build_pc-linux-gnu --target=powerpc-e500-linux-gnu".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from fcmd/kernel/extra/sfn/mddg_sfn.ko...done.
    (gdb) 
    (gdb) disassemble sfn_interrupt
    Dump of assembler code for function sfn_interrupt:
    0x000001d0 <+0>: stwu    r1,-64(r1)
    0x000001d4 <+4>: mflr    r0
    0x000001d8 <+8>: stw     r0,68(r1)
    0x000001dc <+12>:    stw     r3,56(r1)
    0x000001e0 <+16>:    stw     r4,60(r1)
    0x000001e4 <+20>:    lis     r9,0
    0x000001e8 <+24>:    addi    r3,r9,0
    0x000001ec <+28>:    bl      0x1ec <sfn_interrupt+28>
    ......
    0x00000538 <+872>:   addi    r9,r9,-28
    0x0000053c <+876>:   stw     r9,8(r1)
    0x00000540 <+880>:   lwz     r9,8(r1)
    0x00000544 <+884>:   lwz     r9,28(r9)
    0x00000548 <+888>:   stw     r9,36(r1)
    0x0000054c <+892>:   lwz     r9,36(r1)
    0x00000550 <+896>:   cmpwi   cr7,r9,0
    0x00000554 <+900>:   li      r9,0
    0x00000558 <+904>:   li      r10,1
    0x0000055c <+908>:   isel    r9,r10,r9,30
    0x00000560 <+912>:   clrlwi  r9,r9,24
    0x00000564 <+916>:   cmpwi   cr7,r9,0
    0x00000568 <+920>:   bne     cr7,0x574 <sfn_interrupt+932>
    0x0000056c <+924>:   lwz     r9,36(r1)
    0x00000570 <+928>:   dcbt    0,r9
    0x00000574 <+932>:   lwz     r10,8(r1)
    0x00000578 <+936>:   lis     r9,0
    0x0000057c <+940>:   addi    r9,r9,0
    0x00000580 <+944>:   cmpw    cr7,r10,r9
    0x00000584 <+948>:   bne     cr7,0x440 <sfn_interrupt+624>
    0x00000588 <+952>:   li      r9,1
    0x0000058c <+956>:   mr      r3,r9
    0x00000590 <+960>:   lwz     r0,68(r1)
    0x00000594 <+964>:   mtlr    r0
    0x00000598 <+968>:   addi    r1,r1,64
    0x0000059c <+972>:   blr
    End of assembler dump.
    (gdb) list  *    0x00000544
    0x544 is in sfn_interrupt (/dev/shm/junhuawa/mREC/src-mddg/src/build/fcmd/linux/extra/sfn/mddg_sfn.c:256).
    251     }
    252     wake_up_interruptible(&sfn_next_queue); /*By sfn_ioctl => User wait next SFN (SFN_WAIT_NEXT)*/
    253 
    254     if (poll_interrupt_sync)
    255     {   /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
    256         list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list,
    257                             poll_list)
    258         {
    259             printk("got sfn interrupt_tmp\n");
    260             if (sfn_interrupt_tmp->sfn_periodic)
    (gdb) 

### list_for_each_entry()

include/linux/list.h

```c
    /**
    * list_for_each_entry	-	iterate over list of given type
    * @pos:	the type * to use as a loop cursor.
    * @head:	the head for your list.
    * @member:	the name of the list_struct within the struct.
    */
    #define list_for_each_entry(pos, head, member)				\
        for (pos = list_entry((head)->next, typeof(*pos), member);	\
            &pos->member != (head); 	\
            pos = list_entry(pos->member.next, typeof(*pos), member))
```

### Root Cause of the OOPS
Because the error in sfn_close(indoe, file) function, 
the private_data(poll_list of the file descriptor) was freeed,
although poll_interrupt_sync still = 1 when the sfn_close() called. 
So, everytime 10ms Interrupt comes, in isr, it
will go into the poll_interrrupt_sync part to check if the sfn == expected
sfn, if true, will call 
**list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list, poll_list)**
to find the poll waiting process. 
Because at this time, the private_data(poll_list of the file descriptor) already freeed, but it haven't delete from the 
global_poll_struct.poll_list, so, an invalid pointer was found from the
iteration,
Segmentation fault was happened.

### Kernel module example

[sfn.tar.gz](./oops/sfn.tar.gz)

### Links related to OOPS

https://www.linux.com/learn/kernel-newbie-corner-kernel-and-module-debugging-gdb

http://www.thegeekstuff.com/2012/09/objdump-examples/?utm_source=feedburner

http://stackoverflow.com/questions/316131/how-do-you-diagnose-a-kernel-oops

[Understanding a Kernel Oops!](http://opensourceforu.com/2011/01/understanding-a-kernel-oops/)

http://stackoverflow.com/questions/28298220/kernel-module-no-debugging-symbols-found

[OOPS on Powerpc Analysis]http://www.cnblogs.com/wahaha02/p/5363793.html

### Change the log print level to the serial terminal

Option 1: 

```sh
    root@FCMD:/ffs/run >cat /proc/sys/kernel/printk
    7       4       1       7
    root@FCMD:/ffs/run >dmesg -n 8
    root@FCMD:/ffs/run >cat /proc/sys/kernel/printk
    8       4       1       7
    root@FCMD:/ffs/run >
```

Option 1: 

    dmesg -n 8 // 8 is lowest level, it means all log higher then 8 will be printed to the console.

### How to detect if a elf's debug symbols are stripped

readelf --sections can show the sections in a elf file. 

readelf --sections binary_path | grep debug_info
readelf -S binary_path | grep debug

It is not trivial to say in general whether a binary was stripped or not,
because there are different ways to strip a file. Essentially stripping
removes some sections related to symbols and debugging. However, if you
replace "debug_info" with "debug", you can see that there are still some
debug-related sections left in standard binaries of Ubuntu distribution.

