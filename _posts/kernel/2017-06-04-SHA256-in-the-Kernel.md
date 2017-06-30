---
layout: post
title: "SHA256 in the Linux Kernel"
date: 2017-06-04
category: "kernel" 
tags: [kernel]
---

#### SHA256 in the linux kernel

SHA256 algorithm is implemented in the crypto/sha256_generic.c, it's included in a crypto shash architecture. 
It mainly have 3 functions:

```c
    static int sha256_init(struct shash_desc *desc); - initialize the 8 constant value;
    static int sha256_update(struct shash_desc *desc, const u8 *data, unsigned int len); - hash a block of the data to 256 bits hash value
    static int sha256_final(struct shash_desc *desc, u8 *out); - hash the last partial block of data, which need padding
```
#### SHA256

Hash a data block of 512 bits to a 256 bits hash value, if the data is only partial, we need pad with the data to form 512 bits data.

maximum data length SHA256 can be hashed is 64 bits. 

Padding strategy in the last partial data block:

    last 512 bits data block:  DATA         '1'         000...000     (data length saved in last 64 bits) 

Actually, the sha256 algorithm follow the http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf

Hash function need have below 3 security features:

     1) resistant to pre-image attack, 抗第一原像性（单向性），知道h(x), 但是没法知道x的内容；
     2) 抗第二原像性（或弱抗冲突性）, 即知道h(x1),  但是要找到x2, 使得h(x1) = h(x2) 是不可行的；
     3）抗冲突性(或强抗冲突性）, 即找到x1, x2,  使得h(x1) = h(x2) 是不可行的。

但是对于很多应用，hash函数不一定需要满足所有要求，比如密码衍生，只要满足第一原像性就可以了，但是如果是TLS/SSL应用场合，就必须要求同时支持抗第二原像性，否则，别人就可以伪装数据包攻击！
