---
layout: post
title: "Notes recorded when using linux"
date: 2016-09-02
category: "linux" 
tags: [linux]
---
### How to return terminal from a ssh connection?

Normal keys are forwarded over the ssh session, so none of those will work. Instead, use the escape sequences. 
To kill the current session hit subsequently Enter ~,..  
Note that escapes are only recognized immediately after newline.

### Tool to manipulate pictures

GIMP: GNU Image manipulation program

Pinta: A very simple image editor. Pinta is a drawing/editing program modeled on Paint.NET. 
Its goal is to provide a simplified alternative to the GIMP for casual users. 

### bittorrent client
    yum search torrent
    yum install qbittorrent

### Get a rpm package's content

rpm -ql package

-l, --list
List files in package.

    [junhuawa@Tesla docomo-ps]$ rpm -ql qbittorrent
    /usr/bin/qbittorrent
    /usr/share/appdata/qBittorrent.appdata.xml
    /usr/share/applications/qBittorrent.desktop
    /usr/share/doc/qbittorrent-3.3.5
    /usr/share/doc/qbittorrent-3.3.5/AUTHORS
    ...
    /usr/share/pixmaps/qbittorrent.png
    [junhuawa@Tesla docomo-ps]$ 

### Convert an rpm package to cpio archive package

    rpm2cpio *.rpm|cpio -itmv

### Query rpm package owning file "/etc/environment"

    rpm -qf /etc/environment

    [junhuawa@Tesla docomo-ps]$ rpm -qf /etc/environment 
    setup-2.8.71-6.el7.noarch

### Create a terminal in linux terminal
    gnome-terminal -e "ssh root@10.69.120.13"

### Tool to manage ssh sessions in Linux
    pac-4.5.5.7-2.x86_64

fcitx，ibus是输入法的一种框架，具体的输入法一般都有google pinyin,sogou pinyin等；不要将输入法框架和输入法本身搞混淆；

### Use Jabra UC VOICE 750 Duo Drk in Redhat and windows VM

After plug-in the Jabra, select Jabra UC VOICE 750a as the device for sound output/input in System Tools -> Settings -> Sound.
In the virtual box's Audio settings, select Pulse Audio for Host Audio Driver, Intel HD Audio for Audio Controller. It's sound is a little not synced with the video.

