---
layout: post
title: "Set Static IP for Ethernet Port"
date: 2017-04-27
category: "linux" 
tags: [linux]
---

### Do change in the port script
/etc/sysconfig/network-scripts/ifcfg-enp0s25

    TYPE="Ethernet"
    BOOTPROTO="dhcp"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s25"
    UUID="8fcd6330-cacb-4097-bb86-c34891f68c43"
    DEVICE="enp0s25"
    ONBOOT="yes"
    PEERDNS=yes
    PEERROUTES=yes
    IPV6_PEERDNS=yes
    IPV6_PEERROUTES=yes
    IPV6_PRIVACY=no

### Restart the network and NetworkManager service
NetworkManager is the service which used when GUI is enabled, also need to be
restarted. 

    systemctl restart network
    systemctl status NetworkManager


