---
layout: post
title: "Virtual Machine in Linux"
date: 2016-08-16
category: "vm" 
tags: [Virtual Machine in Linux]
---

### virbr0

virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:06:43:11  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        
        
virbr0 是一种虚拟网络接口，这是由于安装和启用了 libvirt 服务后生成的，libvirt 在服务器（host）上生成一个 virtual network switch (virbr0)，
host 上所有的虚拟机（guests）通过这个 virbr0 连起来。默认情况下 virbr0 使用的是 NAT 模式（采用 IP Masquerade），
所以这种情况下 guest 通过 host 才能访问外部。

### Virtualbox Network Settings
NAT
    *. Bridged Network
    VM stay on the same network as the host. 

Internal Network
Host Only Adapter
