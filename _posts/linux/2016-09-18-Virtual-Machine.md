---
layout: post
title: "Virtual Machine in Linux"
date: 2016-08-16
category: "linux" 
tags: [Virtual Machine in Linux]
---

Linux VM(Redhat 7.1) in Virtualbox

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

NAT (Network Address Translation)

    VM visit network through host IP, external PC don't know the VM. 
    One direction access, VM can visit host by network, host can't visit VM.
    IP: 10.0.2.15
    Gateway：10.0.2.2
    DNS：10.0.2.3 

Bridged Adapter

    VM's NIC card bridged to external network, it can get IP from external
    network, network functionality is the same to a real PC in the external
    network.
    VM and host can visit each other. 
    VM stay on the same network as the host. 

Internal Network

    VM's network is not same to the external network, Host can't visit VM, VM
    can't visit host.

Host Only Adapter
    就是说只有主机和VM之间的一个网络，需要先在主机上配置一张虚拟网卡,
    再在VM的setting里配置Host Only Network, 这样即使没有连接网络,
    host和VM之间也可以互相访问. 
    complicated

#### Can not connect USB Stick to VM

    Change the USB controller setting to USB 3.0 (xHCI) in your VM's settings. 

#### VM配置Host Only Adapter

#### VM 网络配置
在安装VM时(尤其安装公司windows时), 需要用Bridged Network,
通过cable连接到外部网络, 使虚拟机得到一个外部的IP地址. 


安装好后, 一般给VM配置2张网卡, 一张网卡设置成NAT, 另一张设置成采用Host Only
Adapter. 


#### 安装CentOS虚拟机问题
安装好后, 再安装GNOME Desktop, 重启后进不了Desktop, 直接黑屏， 查原因,
是因为开了3D Acceleration, 将其Disable就好了. 
