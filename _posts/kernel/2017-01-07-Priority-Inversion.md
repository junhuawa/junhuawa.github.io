---
layout: post
title: "Priority Inversion"
date: 2017-01-07
category: "kernel" 
tags: [kernel]
---
[Mars Pathfinder: Priority Inversion Problem](http://www.cse.chalmers.se/~risat/Report_MarsPathFinder.pdf)

### Priority Inversion

在实时操作系统中发生， 在实时OS中，根据进程优先级调度程序，
假设有Pa, Pb, Pc 3 个process，Pri(a) > Pri(b) > Pri(c), 
但是Pa和Pc需要共享一个临界资源。
进程Pc先运行获得这个临界资源，在里面执行，但是这个时候，Pa也来获取临界资源，
因为资源被Pc占有，Pa只能休眠，时间片到时中间优先级的Pb抢占了CPU资源，
开始运行，这时，因为Pri(b) > Pri(c), Pc 无法运行，
同时最高优先级的Pa被阻塞在这个锁上，无法运行，反而中优先级的Pb可以运行。
这就是优先级倒置。

The famous bug of priority inversion is happend in Mars Path Finder, which
arrived Mars in 1997,  it uses vxWorks(provided by WindRiver) which is a
realtime OS.  The bug cause path finder system reset several times.  

The priority inheritance flag for the mutex was set to “off” in VxWorks
RTOS for performance reasons. The bug disappear after set flag to on. 

### Solution to Priority Inversion 

#### Priority Inheritance

When Pa access the mutex which was occupied by Pc, Pc get the high priority of
Pa immediately, by this way, the Pb will can't preempt the Pc. After Pc
release the mutex, it's priority restore to original priority immediately.

#### Priority Ceilling(优先级上限)

The process occupy the mutex have a high priority level. All the processes
will access the mutex have priority $$ \leq $$ the Ceilling priority, priority
inversion will not happen.

#### Disabling all interrupts to protect critical sections
    



### Kernel implementation for PI

[Priority inheritance in the kernel](https://lwn.net/Articles/178253/)

Add PI-futex patch to solve Priority Inversion

The PI-futex patch adds a couple of new operations to the futex() system call: FUTEX_LOCK_PI and FUTEX_UNLOCK_PI. In the uncontended case, a PI-futex can be taken without involving the kernel at all, just like an ordinary futex. When there is contention, instead, the FUTEX_LOCK_PI operation is requested from the kernel. The requesting process is put into a special queue, and, if necessary, that process lends its priority to the process actually holding the contended futex. The priority inheritance is chained, so that, if the holding process is blocked on a second futex, the boosted priority will propagate to the holder of that second futex. As soon as a futex is released, any associated priority boost is removed. 

### Why there is no Priority Inversion Problem in normal linux

In normal linux, it use CFS Scheduler, in RT-Linux, it use FIFO/(Round Robin)
scheduler. RT-linux have PI Problem. 

CFS Scheduler 是说大家公平的使用CPU。
每个process都有时间使用CPU，但是每个人得到的时间多少不一样，时间多少根据优先级。
比如大家到网吧上网， 每个人都分到10分钟，但是每个人的10分钟真正的大小是根据优先级来确定的，
因此低优先级的process实际上得到运行的CPU时间可能没有10分钟，只有9分钟，
高优先级的process得到的CPU时间可能是1个小时。

所以大家都可以得到运行，但是FIFO和Round
Robin就不一样，高优先级的process会占着CPU一直不放。 
