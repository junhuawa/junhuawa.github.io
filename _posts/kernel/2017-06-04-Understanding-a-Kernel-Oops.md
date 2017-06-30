---
layout: post
title: "理解一个内核的Oops!"
date: 2017-06-04
category: "oops" 
tags: [linux]
---

作为一个黑客，理解内核恐慌，并且做一些跟踪是其职责。这是一个复杂的任务，
不仅要对你的代码的架构有所了解，并且要了解Linux 内核内部的机理.
根据内核检测到的错误类型，Linux内核恐慌可以分为Hard panics(Aiee!) 和
Soft panics (Oops!). 这篇文章解释了一个Linux kernel 'Oops':
生成一个Oops，并且debug它。本文主要的目标受众是Linux内核开发的入门者，他们会碰到调试kernel的问题。
本文假设读者具备Linux内核和C编程的知识。


一个Oops是当内核在内核代码中发现一些错误，或者一个异常时抛出的错误，有点像在用户空间的段错误(segfault).
一个Oops
dump总是将消息dump到终端，它包含错误发生时的处理器状态和CPU寄存器状态。引起错误的进程立即被杀死，
没有来得及释放锁或者清除内存。系统甚至不能恢复到正常操作状态，进入unstable状态。一旦一个Oops发生，系统即不再能认为是可靠的！


下面，让我们尝试用例子代码生成一次内核恐慌，并且去理解它抛出的信息。

#### 搭建获取Oops的机器及环境

被测机器内核编译时需要设置了CONFIG_DEBUG_INFO选项，syslogd需要运行。
为了测试，我们需要写一个简单的kernel module，oops.c:

```c
    #include <linux/kernel.h>
    #include <linux/module.h>
    #include <linux/init.h>

    static void create_oops(void) {
        unsigned long j;
        j = jiffies + 10*HZ;

        while(time_before(jiffies, j)) {
            cpu_relax();
        }
        *(int *)0 = 0;
    }

    static int __init my_oops_init(void) {
            printk("oops from the module\n");
            create_oops();
        return (0);
    }
    static void __exit my_oops_exit(void) {
            printk("Goodbye world\n");
    }

    module_init(my_oops_init);
    module_exit(my_oops_exit);
```

其Makefile如下:

```sh
    obj-m   := oops.o
    KDIR    := /lib/modules/$(shell uname -r)/build
    PWD     := $(shell pwd)
    SYM=$(PWD)

    all:
            $(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

    .PHONY: clean
    clean:
            rm -rf *.o *.ko *.order *.symvers *.mod.c
```

在一台MIPS的机器上，一旦执行，该模块生成如下的Oops:

    [ 9097.517831] oops from the module
    [ 9107.517558] CPU 26 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffffc0d5403c, ra == ffffffffc0d5401c
    [ 9107.530364] Oops[#1]:
    [ 9107.532646] CPU: 26 PID: 13400 Comm: insmod Tainted: P           O 3.10.64--sampleversion-lcpa #9
    [ 9107.541516] task: 800000016b502438 ti: 800000014af44000 task.ti: 800000014af44000
    [ 9107.548996] $ 0   : 0000000000000000 0000000010108ce1 0000000000000000 00000001002189eb
    [ 9107.557055] $ 4   : ffffffff807f0000 0000000000000000 800000008419f3c8 ffffffff80895c90
    [ 9107.565112] $ 8   : 0000000000000065 ffffffff808a0000 000000000000099e 0000000000000006
    [ 9107.573168] $12   : 0000000000000004 0000000000000009 ffffffff80930000 0000000000000000
    [ 9107.581225] $16   : ffffffff80920000 0000000000000000 ffffffffc0d54000 ffffffff808b0000
    [ 9107.589284] $20   : ffffffffc0d52160 0000000000000001 ffffffff808b0000 800000019d462980
    [ 9107.597341] $24   : 0000000000000038 0000000000000001                                  
    [ 9107.605394] $28   : 800000014af44000 800000014af47ca0 0000000000000001 ffffffffc0d5401c
    [ 9107.613453] Hi    : 00000000007e6c79
    [ 9107.617026] Lo    : db22d0e560d7aa08
    [ 9107.620607] epc   : ffffffffc0d5403c my_oops_init+0x3c/0x4c [oops]
    [ 9107.626786]     Tainted: P           O
    [ 9107.630537] ra    : ffffffffc0d5401c my_oops_init+0x1c/0x4c [oops]
    [ 9107.636715] Status: 10108ce3 KX SX UX KERNEL EXL IE 
    [ 9107.641754] Cause : 0080000c
    [ 9107.644633] BadVA : 0000000000000000
    [ 9107.648207] PrId  : 000d910a (Cavium Octeon II)
    [ 9107.652735] Modules linked in: oops(PO+) hdlc(O) axc(O) cpri_misc(O) harley_temperature(O) vrha_nor_update(O) vrha_norflash(O) sfp_i2c(O) sfp_gpio(O) vrha_gpio(O) i2c_mux_gpio sfp_gpio_irq(O) sfp(O) cpri(O) vrha_sfp_i2c(O) xt_nat iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack ip_tables x_tables gpio_pca953x rtc_ds1307 car1212dc(O) vrha_lbi_i2c(O) vrha_pmbus(O) fan(O) fault_mgmt_driver(O) vrha_alarm(O) tty_agusta(O) vrha_button(O) clk_vrha(O) port_inf(O) vrha_blackbox(O) vrha_fpga_dtb(O) led_driver_vrha_control(O) vrha_epcq(O) clk_pps(O) lm75 mcp3021 lm73 at24 clk_ninja(O) clk_netlinkif(O) ucd9000 watchdog(O) vespa_i2c(O) reset(O) payload(O) ninja_i2c(O) octeon_ethernet sfn_shp_driver(O) ethernet_mem pmbus pmbus_core i2c_octeon(O) mvPp(O) vespa(O) led_driver_init_control(O)
    [ 9107.724316]  vrha(O) ninja(O) dtbo_loader(O) firmware_class ptp_octeon_raw(O) fsmddg_mdio_access(O) ramoops reed_solomon cs4322(O) phram fsmddg_nbb(O) nfsd auth_rpcgss oid_registry ipv6
    [ 9107.739700] Process insmod (pid: 13400, threadinfo=800000014af44000, task=800000016b502438, tls=000000fff5b4d700)
    [ 9107.749957] Stack : 000000000000000b ffffffff801004e8 0000000000000001 ffffffff808b0000
        ffffffffc0d52128 ffffffffc0d52110 ffffffff808b0000 ffffffff801a1cf8
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        800000014af47df0 ffffffff80224cb8 80000001f6d45980 0000000000000000
        ffffffff807c88e8 ffffffff8019e8d8 ffffffffc0d522f0 ffffffff80895898
        0000000000000000 ffffffffc0d52128 0000000000000000 000000001001cd30
        800000019d462990 0000000000000124 ffffffff8019ecc8 0000000000000002
        0000000000000000 0000000000000003 000000001001cd30 0000000000000000
        000000001bb850d0 0000000000000000 000000001b2cb280 000000ffff6a0388
        ...
    [ 9107.815511] Call Trace:
    [ 9107.817960] [<ffffffffc0d5403c>] my_oops_init+0x3c/0x4c [oops]
    [ 9107.823799] [<ffffffff801004e8>] do_one_initcall+0xd0/0x158
    [ 9107.829374] [<ffffffff801a1cf8>] load_module+0x1938/0x2218
    [ 9107.834861] [<ffffffff801a27dc>] SyS_finit_module+0xbc/0x100
    [ 9107.840522] [<ffffffff801361a4>] handle_sys64+0x44/0x68

    [ 9107.847234] 
    Code: 0043102f  0440fffd  0000102d <ac000000> dfbf0008  03e00008  67bd0010  00000000  00000000 
    [ 9107.857306] watchdog: kernel crash happened
    [ 9107.857349] ---[ end trace 73eb7065e2d36cb8 ]---

#### 理解Oops转储

我们仔细看一下Oops的输出，里面包含了重要的信息.

    [ 9107.517558] CPU 26 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffffc0d5403c, ra == ffffffffc0d5401c

第一行表明一个指针指向了Null值.

    Oops[#1]

`[#1]` 这个值表示Oops发生的次数，某些错误可以同时产生多个叠加的Oops.

    [ 9107.532646] CPU: 26 PID: 13400 Comm: insmod Tainted: P           O 3.10.64--sampleversion-lcpa #9

`CPU： 1`表示出错时在哪个CPU上运行.
`Tainted`标志有几种不同的值，其含义可以在kernel/panic.c里找到：

    'P' - Proprietary module has been loaded.
    'F' - Module has been forcibly loaded.
    'S' - SMP with CPUs not designed for SMP.
    'R' - User forced a module unload.
    'M' - System experienced a machine check exception.
    'B' - System has hit bad_page.
    'U' - Userspace-defined naughtiness.
    'D' - Kernel has oopsed before
    'A' - ACPI table overridden.
    'W' - Taint on warning.
    'C' - modules from drivers/staging are loaded.
    'I' - Working around severe firmware bug.
    'O' - Out-of-tree module has been loaded.

EPC?
`my_oops_init+0x3c/0x4c`表示\<symbol\> + the offset/length.

    [ 9107.620607] epc   : ffffffffc0d5403c my_oops_init+0x3c/0x4c [oops]

栈数据:

    [ 9107.749957] Stack : 000000000000000b ffffffff801004e8 0000000000000001 ffffffff808b0000
        ffffffffc0d52128 ffffffffc0d52110 ffffffff808b0000 ffffffff801a1cf8
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        800000014af47df0 ffffffff80224cb8 80000001f6d45980 0000000000000000
        ffffffff807c88e8 ffffffff8019e8d8 ffffffffc0d522f0 ffffffff80895898
        0000000000000000 ffffffffc0d52128 0000000000000000 000000001001cd30
        800000019d462990 0000000000000124 ffffffff8019ecc8 0000000000000002
        0000000000000000 0000000000000003 000000001001cd30 0000000000000000
        000000001bb850d0 0000000000000000 000000001b2cb280 000000ffff6a0388

调用回溯， 在Oops发生之前函数调用的列表:

    [ 9107.815511] Call Trace:
    [ 9107.817960] [<ffffffffc0d5403c>] my_oops_init+0x3c/0x4c [oops]
    [ 9107.823799] [<ffffffff801004e8>] do_one_initcall+0xd0/0x158
    [ 9107.829374] [<ffffffff801a1cf8>] load_module+0x1938/0x2218
    [ 9107.834861] [<ffffffff801a27dc>] SyS_finit_module+0xbc/0x100
    [ 9107.840522] [<ffffffff801361a4>] handle_sys64+0x44/0x68

Oops发生时16进制指令码:

    Code: 0043102f  0440fffd  0000102d <ac000000> dfbf0008  03e00008  67bd0010  00000000  00000000 

#### 对一个Oops dump的调试

将怀疑的kernel module用gdb debugger加载:

    [junhuawa@Tesla src-lrcddg]$ mips64-octeon2-linux-gnu-gdb src/build/lcpa/modules/lib/modules/3.10.64--sampleversion-lcpa/extra/test/oops.ko
    GNU gdb (GDB) 7.8.2.20150113-cvs
    Copyright (C) 2014 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=x86_64-build_pc-linux-gnu --target=mips64-octeon2-linux-gnu".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from src/build/lcpa/modules/lib/modules/3.10.64--sampleversion-lcpa/extra/test/oops.ko...done.

从上面EPC指令行，可以得到出错的函数名，反汇编:

    (gdb) disassemble my_oops_init
    Dump of assembler code for function my_oops_init:
    0x0000000000000030 <+0>:     daddiu  sp,sp,-16
    0x0000000000000034 <+4>:     lui     a0,0x0
    0x0000000000000038 <+8>:     lui     v0,0x0
    0x000000000000003c <+12>:    sd      ra,8(sp)
    0x0000000000000040 <+16>:    daddiu  v0,v0,0
    0x0000000000000044 <+20>:    jalr    v0
    0x0000000000000048 <+24>:    daddiu  a0,a0,0
    0x000000000000004c <+28>:    lui     a0,0x0
    0x0000000000000050 <+0>:     ld      v1,0(a0)
    0x0000000000000054 <+4>:     j       0x0
    0x0000000000000058 <+8>:     daddiu  v1,v1,2500
    0x000000000000005c <+12>:    ld      v0,0(a0)
    0x0000000000000060 <+16>:    dsubu   v0,v0,v1
    0x0000000000000064 <+20>:    bltz    v0,0x5c <my_oops_init+12>
    0x0000000000000068 <+24>:    move    v0,zero
    0x000000000000006c <+28>:    sw      zero,0(zero)
    0x0000000000000070 <+32>:    ld      ra,8(sp)
    0x0000000000000074 <+36>:    jr      ra
    0x0000000000000078 <+40>:    daddiu  sp,sp,16
    End of assembler dump.

`0x1c`是出错函数里出错语句的偏移地址, 从上面的反汇编中可以看出，`my_oops_init`函数的起始地址是: 0x0000000000000030, 那么出错的指令对应的地址是:

    0x0000000000000030 + 0x3c = 0x000000000000006c. 

    (gdb) list * 0x0006c
    0x6c is in my_oops_init (/home/junhuawa/LCP/src-lrcddg/src/build/lcpa/linux/extra/test/oops.c:12).
    7           j = jiffies + 10*HZ;
    8
    9           while(time_before(jiffies, j)) {
    10              cpu_relax();
    11          }
    12          *(int *)0 = 0;
    13      }
    14       
    15      static int __init my_oops_init(void) {
    16              printk("oops from the module\n");
    (gdb)

#### No debugging symbols found when loading module by gdb

    Reading symbols from src/build.bak/lcpa/modules/lib/modules/3.10.64--sampleversion-lcpa/extra/test/oops.ko...(no debugging symbols found)...done.

这种情况一般是因为kernel module没有携带debug信息，需要编译时加参数 `-DDEBUG`.

    [junhuawa@Tesla src]$ git diff Makefile 
    diff --git a/src-lrcddg/src/Makefile b/src-lrcddg/src/Makefile
    index c33352b..a0ea0d4 100644
    --- a/src-lrcddg/src/Makefile
    +++ b/src-lrcddg/src/Makefile
    @@ -202,7 +202,7 @@ $(kernel-targets): check-env $(kernel-config) $(local-version)
                    KERNEL_DIR=$(if $(KBUILD_EXTMOD),$(linux-dir),$(KERNEL_DIR)) \
                    BUILD_DIR=$(kernel-build-dir) \
                    INSTALL_DIR=$(modules-dir) \
    -               EXTRA_CFLAGS="-I$(shell pwd)/include -I$(BUILD_WORKDIR)/src-lrcddgif/src/include -DMOD_VERS_STR=\"@(#)$(LABEL)-$(BOARD)\"" \
    +               EXTRA_CFLAGS="-I$(shell pwd)/include -I$(BUILD_WORKDIR)/src-lrcddgif/src/include -DMOD_VERS_STR=\"@(#)$(LABEL)-$(BOARD)\" -g -DDEBUG" \
                    JOBS=$(JOBS) \
                    $@

#### The address of the text section of the module

驱动模块安装到内核后，可以通过以下文件 `/sys/module/oops/section/.init.text` 读取文本段的地址.

    -bash-4.3# cat /sys/module/oops/sections/.init.text
    0xffffffffc0d54000
    -bash-4.3# 

用gdb调试时，也可以加载symbol file,
并将模块文本段的地址作为参数传进去，这样用gdb反汇编出来的函数的地址跟运行时的地址是一至的。 

    [junhuawa@Tesla src-lrcddg]$ mips64-octeon2-linux-gnu-gdb src/build/lcpa/modules/lib/modules/3.10.64--sampleversion-lcpa/extra/test/oops.ko
    GNU gdb (GDB) 7.8.2.20150113-cvs
    Copyright (C) 2014 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=x86_64-build_pc-linux-gnu --target=mips64-octeon2-linux-gnu".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from src/build/lcpa/modules/lib/modules/3.10.64--sampleversion-lcpa/extra/test/oops.ko...done.
    (gdb) add-symbol-file src/
    (gdb) add-symbol-file src/build/lcpa/kernel/extra/test/oops.o 0xffffffffc0d54000
    add symbol table from file "src/build/lcpa/kernel/extra/test/oops.o" at
            .text_addr = 0xffffffffc0d54000
    (y or n) y
    Reading symbols from src/build/lcpa/kernel/extra/test/oops.o...done.
    (gdb) 
    (gdb) disassemble my_oops_init
    Dump of assembler code for function my_oops_init:
    0x0000000000000030 <+0>:     daddiu  sp,sp,-16
    0x0000000000000034 <+4>:     lui     a0,0x0
    0x0000000000000038 <+8>:     lui     v0,0x0
    0x000000000000003c <+12>:    sd      ra,8(sp)
    0x0000000000000040 <+16>:    daddiu  v0,v0,0
    0x0000000000000044 <+20>:    jalr    v0
    0x0000000000000048 <+24>:    daddiu  a0,a0,0
    0x000000000000004c <+28>:    lui     a0,0x0
    0x0000000000000050 <+0>:     ld      v1,0(a0)
    0x0000000000000054 <+4>:     j       0x0
    0x0000000000000058 <+8>:     daddiu  v1,v1,2500
    0x000000000000005c <+12>:    ld      v0,0(a0)
    0x0000000000000060 <+16>:    dsubu   v0,v0,v1
    0x0000000000000064 <+20>:    bltz    v0,0x5c <my_oops_init+12>
    0x0000000000000068 <+24>:    move    v0,zero
    0x000000000000006c <+28>:    sw      zero,0(zero)
    0x0000000000000070 <+32>:    ld      ra,8(sp)
    0x0000000000000074 <+36>:    jr      ra
    0x0000000000000078 <+40>:    daddiu  sp,sp,16
    End of assembler dump.
    (gdb) list * 0x0006c
    0x6c is in my_oops_init (/home/junhuawa/LCP/src-lrcddg/src/build/lcpa/linux/extra/test/oops.c:12).
    7           j = jiffies + 10*HZ;
    8
    9           while(time_before(jiffies, j)) {
    10              cpu_relax();
    11          }
    12          *(int *)0 = 0;
    13      }
    14       
    15      static int __init my_oops_init(void) {
    16              printk("oops from the module\n");
    (gdb)

根据测试结果，加上symbol file，反汇编出来的函数的起始地址还是没有变化，不知道加symbol file的意义何在？ 

[Understanding a Kernel Oops!](http://www.opensourceforu.com/2011/01/understanding-a-kernel-oops/)

1. Check is their system is 100% free:

(check /proc/sys/kernel/tainted).

2. dmesg (“diagnostic message”)

Found in all systems, Displays the kernel log buffer

