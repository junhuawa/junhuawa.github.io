---
layout: post
title: "Set SSH Tunnel"
date: 2017-05-04
category: "linux" 
tags: [linux]
---

### Env Setup

    MyPC <--->   (10.69.6.133) PC133 <--->  Test Device(192.168.255.33)

I want to create a ssh tunnel, so I can login and ssh the Test Device automatically from my personal Linux PC, 
don't need to visit the PC133 first, and then login the Test device by ssh.

### 免密登陆 Test Device 的设置步骤

1. 创建公私钥, 并将公钥通过`ssh-copy-id` 上传至PC133,
   在MyPC侧的 ~/.ssh/config 配置免密登陆, 主机名为 pc133.

```sh
Host pc133
HostName 10.69.6.133
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null
IdentityFile ~/.ssh/id_rsa_root
User root
```

```sh
15:09 junhuawa@Tesla:~ $ ssh pc133
Warning: Permanently added '10.69.6.133' (ECDSA) to the list of known hosts.
Last login: Fri Jun 30 03:06:59 2017 from 10.140.24.210
[root@localhost ~]# 
```

2. 在 MyPC 端创建连接 Test Device 的 SSH 隧道

将本地port 2222上的数据全部转发到远端的IP(192.168.255.33), 端口22上.

    ssh -L 2222:192.168.255.33:22 pc133

3. 使用正确的 user name ssh 连接本地的 2222 端口, 即可以登陆远端的 Test Device

```sh
    15:38 junhuawa@Tesla:~/junhuawa.github.io/_posts/linux $ ssh -p 2222 root@localhost
    You are about to access a private system. This system is for the use
    of authorized users only. All connections are logged to the extent and
    by means acceptable by the local legislation. Any unauthorized access
    or access attempts may be punished to the fullest extent possible
    under the applicable local legislation.
    root@localhost's password: 
    root@FSPC:~ >mount
    rootfs on / type rootfs (rw,size=117244k,nr_inodes=29311)
    proc on /proc type proc (rw,relatime)
```
4. 也可以设置 ssh config 文件实现免密登陆 Test Device

注意，此时的 HostName 应是 `localhost`, 因为监听的端口2222是在本地PC上的.

```sh
Host testdevice 
HostName localhost
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null
IdentityFile ~/.ssh/id_rsa_root
User root
Port 2222
```

```sh
15:43 junhuawa@Tesla:~/junhuawa.github.io/_posts/linux $ ssh testdevice
Warning: Permanently added '[localhost]:2222' (RSA) to the list of known hosts.
You are about to access a private system. This system is for the use
of authorized users only. All connections are logged to the extent and
by means acceptable by the local legislation. Any unauthorized access
or access attempts may be punished to the fullest extent possible
under the applicable local legislation.
root@FSPC:~ >exit
logout
```

#### Setup IP Tunnel in the Server

    ssh -L 2222:192.168.255.5:22 root@10.69.6.133 -fN

    [junhuawa@Tesla sfn]$ ps -ef |grep junhuawa
    junhuawa 26972     1  0 May03 ?        00:00:01 ssh -L 2222:192.168.255.5:22 root@10.69.6.133 -fN

#### Example

    ssh -i /path/to/sshkey -l username -f -N -T -L 8088:idc2-server2:80 idc1-server1

    -L: local port forwarding

    -L 8088:idc2-server2:80 idc1-server1

    将本地的某个端口转发到远端指定机器的指定端口。工作原理是：本地机器上分配了一个socket侦听port端口，一旦这个端口上有了连接, 该连接就经过安全隧道(idc1-server1)转发出去，即

        localhost:8088 -> (idc1-server1) -> idc2-server2:80；

    -i: set identity file(private key) for public authentication.

    -l: login name

    -f: run in background

SSH的的Port
Forward，中文可以称为端口转发，是SSH的一项非常重要的功能。它可以建立一条安全的SSH通道，并把任意的TCP连接放到这条通道中。

SSH Tunnel有三种，分别是本地Local（ssh -NfL），远程Remote（ssh
-NfR），动态Dynamic（ssh -NfD）。（含义参考man ssh）

[ssh port forwarding](http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html)
