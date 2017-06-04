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

一旦执行，该模块生成如下的Oops:


[Understanding a Kernel Oops!](http://www.opensourceforu.com/2011/01/understanding-a-kernel-oops/)
