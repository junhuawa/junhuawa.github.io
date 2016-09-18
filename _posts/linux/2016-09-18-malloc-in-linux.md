---
layout: post
title: "malloc in glibc"
date: 2016-09-18
category: "linux" 
tags: [malloc]
---
dynamic memory allocator

### why need use dynamic memory allocator?

因为经常直到程序运行时，才知道某些数据结构的大小。 

Malloc in linux was done by Doug Lea originally. 

### dlmalloc: Doug Lea's Malloc, a general-purpose allocator, 始于1987.

在heap里的内存通过chunks来组织，chunks是8字节对齐的数据结构，
包含一个header，和可用的memory。 
被分配的内存包含8/16 byte的overhead，overhead包含the size of the chunk and usage flags. 
未分配的chunks也在可用的空闲区域存储指向其他空闲chunks的指针, 这样使得最小的chunk尺寸是24bytes。
未分配的内存根据尺寸大小分组，这个组叫bins， 通过double-linked list将chunks连接起来。

    *. 对于小于256bytes的分配请求(a "smallbin" request), 采用一个简单的two power best fit allocator(以2为底的最佳拟合分配器). 
如果在这个bin里没有合适的空闲块，会从下一个高阶的bin取出一块拆分成2块小的内存块。

    *. 对于大于256， < mmap阀值的分配请求，dlmalloc使用an in-place bitwise trie algorithm. 如果没有空闲内存满足请求，dlmalloc通过调用brk系统调用增加heap的尺寸。 

    *. 对于 > mmap阀值的分配请求(a largebin request), 所需内存总是通过mmap system call来分配。 The threshold 通常是256 KB。 

它有一个重要问题就是在并行处理时多个线程共享进程的内存空间，各线程可能并发请求内存，在这种情况下应该如何保证分配和回收的正确和有效

ptmalloc(used in glibc): an allocator based on dlmalloc, done by Wolfram Gloger, add support malloc in multi-pthread environment. 

mallopt - set memory allocation parameters


brk, sbrk - change data segment size


外部碎片是难以量化和不可预测的，所以分配器典型地采用启发式策略来试图维持少量的大空闲块，而不是维持大量的小空闲块.


#### 隐式空闲链表

    空闲块是通过头部中的大小字段隐含的连接着的。需要一个terminating header.

#### 放置分配的块

placement policy: 放置策略

    first fit: 首次适配
    next fit: 下一次适配, provided by Donald Knuth
    best fit: 最佳适配

#### fault fragmentation: 假碎片

    释放一个空闲块时，可能和其他空闲块相邻。必须合并(coalescing)相邻的空闲块。 

coalescing policy:

    immediate coalescing: 立即合并会产生一种形式的抖动, 块会反复的合并，然后马上分割。
    deferred coalescing: 推迟合并，在某个稍晚的时间再合并空闲块！例如，可以推迟合并，直到某个分配请求失败，然后扫描整个堆，合并所有的空闲块。 

#### 使用边界标记进行合并

给定一个带头部的隐式空闲链表，合并下一个空闲块很简单而且高效。但是如何合并前面的块呢？ Knuth提出了一种聪明而通用的技术，叫作边界标记(boundary tag), 允许
在常数时间内进行对前面块的合并, 是在每个块的结尾处添加一个脚部(footer 边界标记)，其中脚部就是头部的一个副本。用这种方式，合并可以在常数时间内完成。  

### 
