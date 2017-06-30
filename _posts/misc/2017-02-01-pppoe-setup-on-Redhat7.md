---
layout: post
title: "PPPOE Setup on Redhat 7"
date: 2017-02-01
category: "misc" 
tags: [pppoe]
---

[root@Tesla junhuawa]# pppoe-setup 
[root@Tesla junhuawa]# pppoe-setup 
E client setup.  First, I will run some checks on
your system to make sure the PPPoE client is installed properly...


LOGIN NAME

Enter your Login Name (default junhuawa): test

INTERFACE

Enter the Ethernet interface connected to the PPPoE modem
For Solaris, this is likely to be something like /dev/hme0.
For Linux, it will be ethX, where 'X' is a number.
(default eth0): enp0s25

Do you want the link to come up on demand, or stay up continuously?
If you want it to come up on demand, enter the idle time in seconds
after which the link should be dropped.  If you want the link to
stay up permanently, enter 'no' (two letters, lower-case.)
NOTE: Demand-activated links do not interact well with dynamic IP
addresses.  You may have some problems with demand-activated links.
Enter the demand value (default no): no

DNS

Please enter the IP address of your ISP's primary DNS server.
If your ISP claims that 'the server will provide dynamic DNS addresses',
enter 'server' (all lower-case) here.
If you just press enter, I will assume you know what you are
doing and not modify your DNS setup.
Enter the DNS information here: 8.8.8.8
Please enter the IP address of your ISP's secondary DNS server.
If you just press enter, I will assume there is only one DNS server.
Enter the secondary DNS server address here: 4.2.2.2

PASSWORD

Please enter your Password: 
Please re-enter your Password: 

USERCTRL

Please enter 'yes' (three letters, lower-case.) if you want to allow
normal user to start or stop DSL connection (default yes): yes

FIREWALLING

Please choose the firewall rules to use.  Note that these rules are
very basic.  You are strongly encouraged to use a more sophisticated
firewall setup; however, these will provide basic security.  If you
are running any servers on your machine, you must choose 'NONE' and
set up firewalling yourself.  Otherwise, the firewall rules will deny
access to all standard servers like Web, e-mail, ftp, etc.  If you
are using SSH, the rules will block outgoing SSH connections which
allocate a privileged source port.

The firewall choices are:
0 - NONE: This script will not set any firewall rules.  You are responsible
          for ensuring the security of your machine.  You are STRONGLY
          recommended to use some kind of firewall rules.
1 - STANDALONE: Appropriate for a basic stand-alone web-surfing workstation
2 - MASQUERADE: Appropriate for a machine acting as an Internet gateway
                for a LAN
Choose a type of firewall (0-2): 0

Start this connection at boot time

Do you want to start this connection at boot time?
Please enter no or yes (default no):no

** Summary of what you entered **

Ethernet Interface: enp0s25
User name:          test
Activate-on-demand: No
Primary DNS:        8.8.8.8
Secondary DNS:      4.2.2.2
Firewalling:        NONE
User Control:       yes
Accept these settings and adjust configuration files (y/n)? y
Adjusting /etc/sysconfig/network-scripts/ifcfg-ppp0
Adjusting /etc/resolv.conf
  (But first backing it up to /etc/resolv.conf.bak)
Adjusting /etc/ppp/chap-secrets and /etc/ppp/pap-secrets
  (But first backing it up to /etc/ppp/chap-secrets.bak)
  (But first backing it up to /etc/ppp/pap-secrets.bak)



Congratulations, it should be all set up!

Type '/sbin/ifup ppp0' to bring up your xDSL link and '/sbin/ifdown ppp0'
to bring it down.
Type '/sbin/pppoe-status /etc/sysconfig/network-scripts/ifcfg-ppp0'
to see the link status.

[root@Tesla junhuawa]# 
[root@Tesla junhuawa]# pppoe-setup 
[root@Tesla junhuawa]# pppoe-setup 

