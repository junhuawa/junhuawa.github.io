---
layout: post
title: "Vim Setting"
date: 2016-10-08
category: "linux" 
tags: [vim]
---
## Vim setting for browse src code like sourceinsight in Windows

### Build cscope index and ctags index in linux kernel 

    ARCH=mips make cscope
    ARCH=mips make tags

### duplicate cscope database not added

    [junhuawa@Tesla linux-3.10]$ vim Kbuild 
    Error detected while processing /home/junhuawa/.vim/bundle/cscope-maps/plugin/cscope_maps.vim:
    line   42:
    E568: duplicate cscope database not added
    Press ENTER or type command to continue

Solution:

When the directory have cscope.out file, the error report, 
it's because there is already a setting that "cscope add cscope.out" in the vim's global setting. 

    Set "set nocscopeverbose" in ~/.vimrc file.

### cscope support in vim

|:help cscope| show help|
|:cs |is stand for :cscope|
|:scs| is stand for :scscope, it will split the window immediately.|
|:cs show| show cscope link|
|:cs reset| Reset cscope link|
|:cs f g printk|Jump to symbol or file|
|ctrl-]| Get ctags in vim to go to definition, not declaration|
|ctrl-t |Return to the previous place|

### out-of-kernel-tree modules development note

Load external cscope database:

:cs add /path/to/your/kernel/cscope.out

Load external ctags database:

:set tags=/path/to/your/kernel/tags


### cscope parameters definition

    -R 递归到子目录去搜索源文件；
    -b 只构建cross-reference
    -q 通过建立反向索引建立快速搜索，对大项目提高搜索效率非常有用。除了创建普通数据库(cscope.out文件)之外，
    还将建立2个文件(cscope.in.out, cscope.po.out), 这将为大项目提高搜索性能。 

    cscope 在构建数据库时，如果头文件在当前目录找不到，则自动到/usr/include目录下搜索，
    禁止到/usr/bin目录下搜索，使用"-k"(kernel mode).

cscope -Rbq


### 设置使用哪一个cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

csto: 
    set the order of find between cscope and ctags.
    0 means find in cscope first;
    1 means find in tags first.

### 在vim中使用cscope分2步

1.  'cscope add' Add a new cscope database/connection

    cscope add cscope.out

2. Use 'cscope find' Query cscope. It have 8 types. 

    USAGE   :cs find {querto find what you wantytype} {name}
    {querytype} corresponds to the actual cscope line
    interface numbers as well as default nvi commands:

        0 or s: Find this C symbol
        1 or g: Find this definition
        2 or d: Find functions called by this function
        3 or c: Find functions calling this function
        4 or t: Find this text string
        6 or e: Find this egrep pattern
        7 or f: Find this file
        8 or i: Find files #including this file

### Create ctags index database

    ctags -L cscope.files

cscope.files was created by below command:

    find . -name "*.[ch]" |grep -v testsuite > cscope.files

