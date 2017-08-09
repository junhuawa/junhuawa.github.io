---
layout: post
title:  "Tools to download files in Linux!"
date: 2017-07-23
category: tool
tags: [tools]
---

### Linux/Unix/Windows 下的P2P 客户端
http://mldonkey.sourceforge.net/Quickstart_guide

### eMule 下载链接格式(ed2k)

    ed2k://|file|The_Two_Towers-The_Purist_Edit-Trailer.avi|14997504|965c013e991ee246d63d45ea71954c4d|/

ed2k://|file|file name|file size|hash value|/

ed2k 链接还可以包含共享这个文件的IP address和端口号. 

    ed2k://|file|The_Two_Towers-The_Purist_Edit-Trailer.avi|14997504|965c013e991ee246d63d45ea71954c4d|/|sources,202.89.123.6:4662|/

在eMule, 链接还通常包含一个 `AICH top hash`, 比如
`|h=H52BRVWPBBTAED5NXQDH2RJDDAKRUWST|`, 这个hash值用于帮助修复传输中损坏的文件. 

#### AICH

Advanced Intelligent Corruption Handling, a corruption handling method used in eMule.

高级智慧型损坏处理

### 磁力链接 (Magnet URI scheme)

磁力链接 (Magnet URI scheme), 确切的说：“磁力链接”的主要作用是识别能够通过“点对点技术（即：P2P）”下载的文件.

这种链接是通过不同文件内容的Hash结果生成一个纯文本的“数字指纹”，来识别文件的。而不是基于文件的位置或者名称。

#### URN 
Unified Resource Name (统一资源名称)

P2P下载中使用的磁力链接是URN的一种实现，它可以持久化的标识一个BT资源，资源分布式的存储在P2P网络中，无需中心服务器用户即可找到并下载它。
