---
layout: post
title: "The Productive Programmer"
date: 2016-10-01
category: study 
tags: [books]
---
The Productive Programmer -- Neal Ford - 2009
----

我不要敏捷，我要致力于消除软件开发中的一切浪费！

在<<Porgramming Perl>> (O'Reilly出版) 一书中， Larry Wall说到"懒惰，傲慢和缺乏耐性"是程序员的三大美德。
懒惰，因为你一直致力于减少需要完成的工作总量；缺乏耐性，因为一旦让你浪费时间去做本该计算机做的事，你就会怒不可遏；
还有傲慢，因为被荣誉感冲昏头的你会把程序写得让谁都挑不出毛病来。本书不会使用这几个字眼(我已经用grep检查过了)，
但你会发现同样的理念在本书的内容中得到了继承和发扬。
我有没有让手边的(正在跑或在走的)这台电脑物尽其用？

预想开发(speculative development)会给软件造成伤害，因为他过早地给代码引入了复杂度。
正如Andrew Hunt和David Thomas在<<The programmatic Programmer>>(Addison-Wesley)一书中所说，熵会损害软件 -- 
"熵"是一个数学术语，用于度量系统中的复杂度。熵是软件的大敌，因为软件系统越复杂，理解代码，修改代码，添加代码就越困难。
在物理世界里，事物通常倾向于朝着简单的方向发展，除非外界对其注入能量。软件则正好相反: 由于创造软件是如此容易(
而且创造复杂的软件和简单的软件所需要的物理工作量没有太大区别), 因此软件倾向于朝复杂的方向发展。
将软件从复杂变回简单可能需要花很大力气。

如无必要，勿增复杂度。只做当下需要的。

#### 找出难找的目标

1. 查找扩展名之前两个字母为"Db"的所有Java源文件

    find . -regex ".*Db\.java"
    -regex pattern
        File  name matches regular expression pattern. 

2. find加上grep那就真是如虎添翼.

查找所有的.c文件，并对每个文件用grep搜索kmod，并显示出line number和file name。

    find . -name "*.c" -exec grep -n -H "kmod" {} \;
    grep parameters:
    -n: print line number with output lines
    -H: print the file name for each match 

### Find return error
[junhuawa@Tesla Downloads]$ find . -name *fuliba*
find: paths must precede expression: [fuliba.net]谭晓彤被封剪辑录像.mp4
Usage: find [-H] [-L] [-P] [-Olevel] [-D help|tree|search|stat|rates|opt|exec] [path...] [expression]
[junhuawa@Tesla Downloads]$ 

Solution:

    add single quote for pattern

#### How to add a list of new files to the svn repo

svn st|grep '^\?' |tr '^\?' ' '|sed 's/[ ]*//'|sed 's/[ ]/\\ /g'|xargs svn add

sed 's/[ ]/\\ /g': replace the space with '\ ', if not, svn add can't find the file name with space.

对于任何开发习惯，仅仅因为“我们一直是这样做的”而存在是站不住脚的。如果你明白为什么一直这样做，而且这样做确实有意义，
那么一定要继续。但你应该始终保持对任何假设的质疑，并验证他们的正确性。

