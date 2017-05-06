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

#### Example

ssh -i /path/to/sshkey -l username -f -N -T -L 8088:idc2-server2:80 idc1-server1

-L 8088:idc2-server2:80 idc1-server1

将本地的某个端口转发到远端指定机器的指定端口。工作原理是：本地机器上分配了一个socket侦听port端口，一旦这个端口上有了连接, 该连接就经过安全隧道(idc1-server1)转发出去，即

    localhost:8088 -> (idc1-server1) -> idc2-server2:80；

-i: set identity file(private key) for public authentication.

-l: login name

-f: run in background

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

SSH的的Port
Forward，中文可以称为端口转发，是SSH的一项非常重要的功能。它可以建立一条安全的SSH通道，并把任意的TCP连接放到这条通道中。

SSH Tunnel有三种，分别是本地Local（ssh -NfL），远程Remote（ssh
-NfR），动态Dynamic（ssh -NfD）。（含义参考man ssh）
