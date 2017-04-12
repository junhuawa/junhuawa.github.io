---
layout: post
title: "Preemption"
date: 2017-01-07
category: "kernel" 
tags: [kernel]
---

### Kernel Preemption

In the linux kernel 2.4, there is no preemption. A process can call schedule()
to provide the CPU for other processes. 
The scheduler will schedule the processes passively. 


In the kernel 2.6 and later, kernel add preempt mechanism.
内核抢占指用户程序在执行系统调用期间可以被抢占，该进程暂时挂起，使新唤醒的高优先
级进程能够运行。

内核抢占导致内核中所有的共享变量和数据结构都需要互斥机制加以保护，或者说都要放在临界区中。
在抢占式内核中，认为如果内 核不是在一个中断处理程序中，并且不在被
spinlock等互斥机制保护的临界代码中，就认为可以"安全"地进行进程切换。

Linux内核抢占只有在内核正在执行例外处理程序（通常指系统调用, 中断处理程序结束时）并且允许内核抢占时，才能进行抢占内核。

内核抢占意味着当一个进程正在内核中运行时，即使它在内核中的处理还没有完成，另一个进程也可以抢占它并运行。
比如当进程A正在内核中执行时，高优先级的进程B被一个中断唤醒了，这时，虽然进程A即没有被阻塞也没有完成它在内核中的处理，
内核还是会抢占进程A并将处理器分配给进程B。

In order to support preemption, kernel add preempt_count in the thread_info
structure, 0 means preeptable.

    struct thread_info {
        struct task_struct  *task;      /* main task structure */
        struct exec_domain  *exec_domain;   /* execution domain */
        __u32           flags;      /* low level flags */
        __u32           status;     /* thread synchronous flags */
        __u32           cpu;        /* current CPU */
        int         preempt_count;  /* 0 => preemptable,
                            <0 => BUG */
        int         preempt_lazy_count; /* 0 => lazy preemptable,
                                <0 => BUG */
        mm_segment_t        addr_limit;
        struct restart_block    restart_block;
        void __user     *sysenter_return;
    #ifdef CONFIG_X86_32
        unsigned long           previous_esp;   /* ESP of the previous stack in
                            case of nested (IRQ) stacks
                            */
        __u8            supervisor_stack[0];
    #endif
        unsigned int        sig_on_uaccess_error:1;
        unsigned int        uaccess_err:1;  /* uaccess failed */
    };


[Linux内核抢占机制(preempt)](http://blog.sina.com.cn/s/blog_640531380101dlg9.html)

#### Soft RealTime(软实时)
Means have operation time limition, if operation exceed the time, the service
experience quality will be impacted, but there is no vital damage. 
for example, mp3 player.

#### Hard RealTime(硬实时)
Means if time exceed, it will have serious damage, have disaster. For example,
OS in airplane. 错过了时限就是失败的！


#### Linux Kernel Preemption Mode

| PREEMPT_NONE | No Forced Preemption ( Server ) |
| PREEMPT_VOLUNATRY | Voluntary Kernel Preemption (Desktop) |
| PREEMPT_DESKTOP | Preemptible Kernel (Low-Latency Desktop) |
| PREEMPT_RT | Complete Preemption (Real-Time) |
