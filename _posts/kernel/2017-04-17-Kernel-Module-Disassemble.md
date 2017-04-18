---
layout: post
title: "Disassemble Code fore debugging"
date: 2017-04-17
category: "linux" 
tags: [linux]
---

### Add debug info to the Kernel module when do compilation
    
    make -C /KDIR modules EXTRA_CFLAGS="-g"

### Dump the disassemble of the module

    [junhuawa@hzling42 sfn]$ powerpc-e500-linux-gnu-objdump -S mddg_sfn.o > /tmp/test
    cat /tmp/test

        printk(KERN_INFO "Initializing sfn_mod\n");
    #ifdef CONFIG_FCMD              //By FCMD is Frame Register on CASA2
        if (!(sfn_number = ioremap(CFG_CASA2_BASE + (CASA2_FRAME_NR_REG * 2), 2)))
        {
            printk(KERN_ERR "CASA2: unable to map FRAME_REG\n");
    94:   38 63 00 00     addi    r3,r3,0
    98:   4c c6 31 82     crclr   4*cr1+eq
    9c:   48 00 00 01     bl      9c <init_module+0x9c>
            return -ENOMEM;
    a0:   48 00 00 dc     b       17c <init_module+0x17c>
    a4:   7c 00 04 ac     sync    
    a8:   a1 23 00 00     lhz     r9,0(r3)
    ac:   0c 09 00 00     twi     0,r9,0
    b0:   4c 00 01 2c     isync
        sfn_number = &sfn_fspc;
    #endif

### Makefile for kernel module compilation

    MODULE=mddg_sfn

    KDIR  := /dev/shm/junhuawa/mREC/src-fsmbos/src/kernel/build/fcmd/kernel 
    PWD   := $(shell pwd)

    default:
        $(MAKE) -C $(KDIR)  SUBDIRS=$(PWD) modules ARCH=powerpc CROSS_COMPILE=/build/home/SC_LFS/sdk/tags/PS_LFS_SDK_3_28/bld-tools/x86_64-pc-linux-gnu/bin/powerpc-e500-linux-gnu- EXTRA_CFLAGS="-g"

    clean:
        rm -rf $(MODULE).o *~ core .depend .*.cmd *.ko *.mod.[co] .tmp_versions Module.symvers

### Links

https://www.linux.com/learn/kernel-newbie-corner-kernel-and-module-debugging-gdb

http://www.thegeekstuff.com/2012/09/objdump-examples/?utm_source=feedburner
