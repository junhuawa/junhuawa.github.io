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
    

