---
layout: post
title: "Linux下中文字符乱码的处理"
date: 2016-09-01
category: "misc" 
tags: [misc]
---
### 中文文件名乱码

安装convmv工具，及语言包

    yum install convmv
    yum install perl-Encode-HanExtra

列出所有支持的字符集:

    convmv --list

转换一个文件名为UTF-8编码:

    convmv -f GBK -t UTF-8 filename

### 改变乱码文件名的文件名

    [junhuawa@Tesla Downloads]$ ls -li
    537267618 -rw-r--r--.  1 junhuawa everybody         0 Sep  1 16:24 ˫����...,,......��..,,,.��...��ȡ.txt
    [junhuawa@Tesla Downloads]$ find . -inum 537267618 -exec mv {} test.txt \;

### 删除乱码文件名

    find . -inum 2428 -exec rm {} +

### 文件中文内容乱码问题

使用iconv工具做内容转换

list所有支持的字符编码

    iconv -l

将文件内容转换成UTF-8编码

    conv -t GBK -t UTF-8 filename

    [root@Tesla Downloads]# cat 说明..txt
    ˫����...,,......��..,,,.��...��ȡ[root@Tesla Downloads]# 
    [root@Tesla Downloads]# iconv -f GB2312 -t UTF-8 说明..txt
    双击打开。...,,......。..,,,.。...获取[root@Tesla Downloads]# 
    [root@Tesla Downloads]#

### GB2312, GBK, UTF-8之间区别于联系

UTF8(Unicode Transformation Format-8bit
)是国际编码，是用以解决国际上字符的一种多字节编码，它对英文使用8位（即一个字节），中文使用24位（三个字节）来编码。对于英文字符较多的论坛则用UTF－8节省空间。UTF-8支持所有国家语言。 

GBK 是国家标准GB2312基础上扩容后兼容GB2312的标准。GBK的文字编码是用双字节来表示的，即不论中、英文字符均使用双字节来表示，为了区分中文，将其最高位都设定成1。

GBK包含全部中文字符，是国家编码，通用性比UTF8差.

GBK、GB2312等与UTF8之间都必须通过Unicode编码才能相互转换：

GBK、GB2312－－Unicode－－UTF8 

UTF8－－Unicode－－GBK、GB2312 

    gb2312是简体中文的码
    gbk支持简体中文及繁体中文
    big5支持繁体中文
    utf-8支持几乎所有字符

中国大陆最常用的就是GBK18030编码，除此之外还有GBK，GB2312，这几个编码的关系是这样的。最早制定的汉字编码是GB2312，包括6763个汉字和682个其它符号
95年重新修订了编码，命名GBK1.0，共收录了21886个符号。之后又推出了GBK18030编码，共收录了27484个汉字，同时还收录了藏文、蒙文、维吾尔
文等主要的少数民族文字，现在WINDOWS平台必需要支持GBK18030编码。

### vim中支持中文显示

config ~/.vimrc

    set fileencodings=utf-8,gb2312,gbk,gb18030
    set termencoding=utf-8
    set encoding=utf-8
