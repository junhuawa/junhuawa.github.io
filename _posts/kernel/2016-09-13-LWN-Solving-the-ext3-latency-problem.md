---
layout: post
title: "fsync() stall in ext3 filesystem"
category: "filesystem"
tags: [LWN]
---

### ext3 FS 在data=ordered模式下有性能问题, 已经在2.6.30上解决

[Solving the ext3 latency problem](http://lwn.net/Articles/328363/)

some performance problems remain in ext3, especially in places where the fsync() system call is used.
The problem, in short, is this: the ext3 filesystem, when running in the default data=ordered mode, can exhibit lengthy stalls when some process calls fsync() to flush data to disk. 

 When Ted Ts'o looked into the problem, he noticed an obvious problem: data sent to the disk via fsync() is put at the back of the I/O scheduler's queue, behind all other outstanding requests. If processes on the system are writing a lot of data, that queue could be quite long. So it takes a long time for fsync() to complete. While that is happening, other parts of the filesystem can stall, eventually bringing much of the system to a halt. 

#### Fix of the problem:

    *. Mark WRITE_SYNC operation bit when calling fsync(), mark them as synchronous requests. The CFQ I/O scheduler 在执行异步请求（没有进程在等待）之前执行所有同步请求，因为同步请求有进程在实时等待。通常读被认为是同步的，写是异步的。一旦fsync()相关的请求被置成同步调用，他们就会在普通I/O请求前被执行。 这样会导致fsync()被很快执行，但是I/O密集的任务退后执行。 这是一种较优的策略。
    *. WRITE_SYNC会做2件事，将请求放到更高优先级的同部队列, unplugging the queue. Plugging是block layer使用的一种技术，用于在load爆发的情况下，向下层的disk driver发出请求的技术。在2次爆发之间，队列是插入的(plugged), 这时请求会被累积。这种累积使得I/Oscheduler可以merge连续的请求，并以最优的顺序发出这些请求。谨慎的使用plugging极大的改进了block子系统的性能。 
    *. 碰到同步请求就unplugging在有些时候是合理的，因为通常他们不会有连续的请求加入到队列，所以继续等待没有意义。但是fsync()这种情况不适用。因为当fsync()被调用时，通常会有连续的一系列的多个request，因为每一次同步请求就unplugging会导致性能下降。 Jens提出一系列patch修复这个问题，其中一个是增加了WRITE_SYNC_PLUG操作，即如果有同步写，先不unplugging，而是产生一个queue。这样就是等fsync()创建一系列操作，然后最终unplug这个queue。
    *. CFQ scheduler使用**预测**逻辑处理同步请求，即当执行完一个这样的同步请求，它会停下来到queue里去看是否有连续的request出现。 这样做的目的在于让disk head处在满足下面请求的理想位置，通过不移动disk head来取得最佳性能。 这个logic对于同步读处理非常好，但是处理由fsync()产生的写操作就不理想了。 因此现在新加的WRITE_SYNC_PLUG操作就是一个阻止预测的内部标志。 

**要想提高fsync()执行的速度，还需要做一个重要的改变**

    *. 文件系统必须用data=writeback 模式mount。这个模式消除了数据块必须先于metadata写到disk的要求。 在data=ordered模式，相反，被写的数据的数量保证fsync()总是更忙。 采用data=writeback, 消除了这些写， 但是同时，他也关掉了EXT3比EXT4 更robust的feature。 通过在EXT3中加EXT4所用的同样的safeguard， Ted Ts减轻了这个问题。 在一些情况下，比如将一个新的文件重命名成已经存在的文件， 数据将先于metadata写入disk，结果，系统crash导致的数据丢失将很少发生。 
    
    *. 用data=writeback的另一个潜在的问题是在某些情况下， 一个crash导致一个文件有一个还没有写的被分配的块。 这个块可能包含某个人的老的数据，是一个潜在的安全问题。 但是因为大部分linux系统都给单用户使用，因此crash时潜在的信息泄露看起来非常小。

    因此，Ted建议，应该将data=writeback设置为default。 但是有不同意见, 不是每个人都认可ext3在这个生命周期（2009）时候， 做一个大的option的改变。但是Linus不为所动，将一个带有默认设置data=writeback的patch加到主线上。 
    
    值得注意的是：
    
    1. data mode可以在mount文件系统的时候明确设置；
    2. 也可以通过tune2fs改变data mode。 
