---
layout: post
title: "iperf3 no sctp support"
date: 2017-06-05
category: "linux" 
tags: [sctp]
---

In our Lab env, there is no --sctp parameter in the iperf3 cmd. The iper3
version is below:

    -bash-4.3# iperf3 --version
    iperf 3.0.6
    Linux Test 3.10.64--sampleversion-lcpa #9 SMP PREEMPT Fri Dec 2 14:21:44 CST 2016 mips64 GNU/Linux
    -bash-4.3# 


    -bash-4.3# iperf3 --help   
    Usage: iperf [-s|-c host] [options]
        iperf [-h|--help] [-v|--version]
    ...
    Client specific:
    -c, --client    <host>    run in client mode, connecting to <host>
    -u, --udp                 use UDP rather than TCP
    ...

Download the newer version of iperf3, read the RELEASE_NOTES, we found the sctp support was added in the version 3.1.

    == iperf 3.1 2015-10-16 ==

    The release notes for iperf 3.1 describe changes and new
    functionality in iperf 3.1, but not present in 3.0.11 or any earlier
    3.0.x release.

    * Selected user-visible changes

    * SCTP support has been added (with the --sctp flag), on Linux,
        FreeBSD, and Solaris (issue #131).

    * Setting CPU affinity now works on FreeBSD.

    * Selection of TCP congestion now works on FreeBSD, and is now
        called --congestion (the old --linux-congestion option works
        but is now deprecated).

In my own Linux env, Run `configure` & `make`, the  new iperf3 still don't have `--sctp` parameter. 

Google from web, found it's because header file netinet/sctp.h can't find in
the env, so SCTP was not enabled during configure, install the sctp devel tool solve the
problem. 

    [root@Tesla iperf-3.1.3]# yum install lksctp-tools-devel.x86_64

    junhuawa@Tesla: $ rpm -ql lksctp-tools-devel.x86_64
    /usr/include/netinet
    /usr/include/netinet/sctp.h
    /usr/lib64/libsctp.so
    /usr/lib64/lksctp-tools/libwithsctp.so
    /usr/lib64/pkgconfig/libsctp.pc
    /usr/share/lksctp-tools
    /usr/share/lksctp-tools/checksctp.c
    /usr/share/lksctp-tools/sctp_bind.c
    /usr/share/lksctp-tools/sctp_darn.c
    /usr/share/lksctp-tools/sctp_darn.h




