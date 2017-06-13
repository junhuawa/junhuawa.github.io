---
layout: post
title:  "C++ Language"
date: 2017-06-12
category: language
tags: [shell]
---

### Is it possible to use `free()` to destroy objects created by new? 

For memory obtained using new you must use delete and use free for those obtained from malloc. new and malloc may use different data structures internally to keep track of what and where it has allocated memory. So in order to free memmory, you have to call that corresponding function that knows about those data structures. It is however generally a bad idea to mix these two types of memory allocation in a piece of code.

no guarantee that new and free operate on the same heap.
