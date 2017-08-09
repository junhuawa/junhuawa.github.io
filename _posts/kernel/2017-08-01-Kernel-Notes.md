---
layout: post
title:  "bool in kernel!"
date: 2017-08-01
category: kernel
tags: [kernel]
---

#### bool used in kernel code

true & false was defined in /include/linux/stddef.h 
    ```c
    #undef NULL
    #define NULL ((void *)0)

    enum {
        false   = 0,
        true    = 1
    };
    ```

bool type was defined in /include/linux/types.h 

    ```c
    typedef _Bool           bool;
    ```

#### Is bool a native C type?

bool exists in the current C - C99, but not in C89/90.

In C99 the native type is actually called _Bool, while bool is a standard library macro defined in stdbool.h (which expectedly resolves to _Bool). Objects of type _Bool hold either 0 or 1, while true and false are also macros from stdbool.h.


