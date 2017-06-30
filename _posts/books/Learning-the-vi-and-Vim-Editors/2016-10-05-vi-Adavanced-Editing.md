---
layout: post
title: "vi Advanced Editing"
date: 2016-10-05
category: books
tags: [books]
---
1. [Change options of vi by using the ex command](#change-options-of-vi-by-using-the-ex-command)
1. [Word Abbreviation](#word-abbreviation)
1. [Using the map command](#using-the-map-command)
1. [Indentation Control](#indentation-control)
1. [Macro in Vim](#macro-in-vim)
1. [Add html anchor for markdown file](#add-html-anchor-for-markdown-file)

### Change options of vi by using the ex command

|:set ic|Pattern search should ignore case|
|:set noic|case-sensitive in searches|
|:set all|Display the complete list of options have set|
|:set option?|Show the current value of any individual opiton by name|
|:set |Show options that you have specifically changed, or set.|

An exclamation mark (!) tells *ex* to create a shell and to regard what follows as a Unix command:
    
    :!command

Read the results of a Unix command into your file.

    :r !date

![images](../../../images/books/Read-the-results-of-date-command.png)

|:96,99!sort|Pass lines 96 through 99 through the *sort* filter and replace those lines with the output of *sort*.|

### Word Abbreviation

|:ab abbr phrase|Define an abbreviation, abbr is an abbreviation for the specified *phrase*|

The sequence of characters that make up the abbreviation will be expanded in insert mode only 
if you type it as a full word; abbr will not be expanded within a word.

:ab imrc International Materials Research Center

|:ab|List your currently defined abbreviations|

#### Using the map command

Assign the command sequence to an unused key by using the map command.

|:map x sequence| Define character x as a sequence of editing commands|
|:unmap x |Disable the sequence defined for x|
|:map|List the characters that are currently mapped.|
|:s;.*;/* & */;|Place C/C++ comments around an entire line*|



### Indentation Control

When you are entering code with autoindent enabled, in insert mode

|CTRL+T|Give you another level of indentation|
|CTRL+D|Takes one away|

### Macro in Vim

You can record a series of commands, then repeat the commands if necessary.

Record commands:

    q{0-9a-zA-Z"}: Record typed characters into register {0-9a-zA-Z"}.
    q: Stop the recording
    @{0-9a-z".=*+} Execute the contents of register {0-9a-z".=*+} [count] times. 

#### Add html anchor for markdown file
For example:

    ## Setup new Test Line Main Steps  
    ## Detailed Steps  
    ## IP address and UART Console address  
    ## Config the IP address permanently in the Test  

Use below command can add anchor

ex command:

    :4,8s/\#\# \(.*[a-zA-Z]\)/1\. \[\1\]\(#\L\1\)/g

result: 

    1. [Setup new Test Line Main Steps](#setup new test line main steps)
    1. [Detailed Steps](#detailed steps)
    1. [IP address and UART Console address](#ip address and uart console address)
    1. [Config the IP address permanently in the Test](#config the ip address permanently in the lrc)

Use macro recording to replace ' ' with '-' in anchor:

    q a to start a recording, search '#', then Ctrl-v $ to select the string from # to end of the line,
':' to input ex command "'<,'>s/\([a-z]\) \([a-z]\)/\1-\2/g", then press q to stop recording.

To every line, press @a to execute the macro. 

Result is like this, still not work:

    1. [Setup new Test Line Main Steps](#setup-new-test-line-main-steps)
    1. [Detailed Steps](#detailed-steps)
    1. [IP address and UART Console address](#ip-address-and-uart-console-address)
    1. [Config the IP address permanently in the Test](#config-the-ip-address-permanently-in-the-lrc)

Finally, we can use command f to do the replace.

Record a macro to replace 1 '-' with ' ' in a line. Then repeat execute the macro.

    qaf-r' 'q

then execute to different line:

    1@a
    5@a
    7@a

    'f' means search forward a character in the line. 'F' means search backward.
    ';' means do the search again.

### How to make vim show ^M and substitute it

[How to make vim show ^M and substitute it](http://stackoverflow.com/questions/3852868/how-to-make-vim-show-m-and-substitute-it)

Vim does show ^M except in one case: if the fileformat=dos then it will not show a trailing crlf.

You can find out which format (unix or dos) you have by typing :set and you can get rid of the ^M in the crlf by just changing the format (:set fileformat=unix) and then writing out the file.

If you have a ^M in the middle of the line, then you should be able to see it, even in a fileformat=dos file, and you can pattern match it with \r. (Oddly, the syntax for subsituting a newline is a \r in the replacement part of the sub, so the way one changes ^M to ^N is by the not-at-all-a-noop :s/\r/\r/.)


### In VIM, how do I apply a macro to a set of lines?
Use the normal command in Ex mode to execute the macro on multiple/all lines:

Execute the macro stored in register a on lines 5 through 10.

:5,10norm! @a

Execute the macro stored in register a on lines 5 through the end of the file.

:5,$norm! @a

Execute the macro stored in register a on all lines.

:%norm! @a

Execute the macro store in register a on all lines matching pattern.

:g/pattern/norm! @a

To execute the macro on visually selected lines, press V and the j or k until the desired region is selected. Then type :norm! @a and observe the that following input line is shown.

:'<,'>norm! @a

Enter :help normal in vim to read more.

