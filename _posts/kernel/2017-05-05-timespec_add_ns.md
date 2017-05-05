---
layout: post
title: "timespec_add_ns() Kernel API"
date: 2017-05-05
category: "kernel" 
tags: [linux]
---

### Code found from mddg_sfn.c

    timespec_add_ns(&bts_rtc_time, bcn_delta_ns);

### timespec_add_ns() definition

include/linux/time.h

```c
    /**
    * timespec_add_ns - Adds nanoseconds to a timespec
    * @a:      pointer to timespec to be incremented
    * @ns:     unsigned nanoseconds value to be added
    *
    * This must always be inlined because its used from the x86-64 vdso,
    * which cannot call other kernel functions.
    */
    static __always_inline void timespec_add_ns(struct timespec *a, u64 ns)
    {
        a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, NSEC_PER_SEC, &ns);
        a->tv_nsec = ns;
    }
```


include/linux/math64.h

```c
    u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

    static __always_inline u32
    __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
    {
        u32 ret = 0;

        while (dividend >= divisor) {
            /* The following asm() prevents the compiler from
            optimising this loop into a modulo operation.  */
            asm("" : "+rm"(dividend));

            dividend -= divisor;
            ret++;
        }

        *remainder = dividend;

        return ret;
    }
```
