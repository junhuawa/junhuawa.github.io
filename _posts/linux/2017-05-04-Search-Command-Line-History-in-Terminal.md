---
layout: post
title: "Search Command-Line history in Linux Terminal"
date: 2017-05-04
category: "linux" 
tags: [linux]
---

#### This history command

Show Bash's log of the commands you have typed

    hisotry

List last n commands:
    
    history n 

Execute command in number n:
    
    !n

Execute the last command you typed:
    
    !!


#### Search through the Comamnd History(**Ctrl-R**)

For example, if you want to use the command you used last time you used make,
you could type:

**Ctrl-R** then type "make".
Then, use the **Ctrl-R** key combination to scroll backward through the
history.

Once you've found the cmd you're looking for, use [Enter] to execute it. 
Or, using the right or left arrow keys will place the cmd on an actual
cmd-line so you can edit it.

[Links](http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/x1712.htm)
