---
layout: post
title: "Set IP Tunnel"
date: 2017-05-04
category: "linux" 
tags: [linux]
---

#### Env Setup

    Test Device(192.168.255.5) --- (192.168.255.254) PC133 (10.69.6.133) --- Ling42(Server)
I want to create a IP tunnel, so I can login and ssh the Test Device automatically, don't need to visit the PC133.

#### Setup IP Tunnel in Ling42

    ssh -L 2222:192.168.255.5:22 root@10.69.6.133 -fN

    [junhuawa@hzling42 sfn]$ ps -ef |grep junhuawa
    junhuawa 26972     1  0 May03 ?        00:00:01 ssh -L 2222:192.168.255.5:22 root@10.69.6.133 -fN

#### ~/.ssh/config

    Host fcmd
    HostName localhost
    User root
    UserKnownHostsFile=/dev/null
    StrictHostKeyChecking no


#### Test Results

    [junhuawa@ling42 sfn]$ ssh -p 2222 fcmd
    Warning: Permanently added '[localhost]:2222' (RSA) to the list of known hosts.
    You are about to access a private system. This system is for the use
    of authorized users only. All connections are logged to the extent and
    by means acceptable by the local legislation. Any unauthorized access
    or access attempts may be punished to the fullest extent possible
    under the applicable local legislation.
    root@FCMD:~ >

Also, we need to set login 192.168.255.5 without password in the PC133. 
