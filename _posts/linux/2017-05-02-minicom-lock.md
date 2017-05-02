---
layout: post
title: "minicom is locked"
date: 2017-05-02
category: "linux" 
tags: [linux]
---

### Problem

    [root@localhost ~]# minicom 
    Device /dev/ttyMUE0 is locked.

### Solution

    Remove the lock in /var/lock directory.
