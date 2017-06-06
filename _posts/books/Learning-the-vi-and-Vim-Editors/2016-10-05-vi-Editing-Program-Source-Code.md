---
layout: post
title: "vi Editing Program Source Code"
date: 2016-10-05
category: books
tags: [books]
---

|:set list|display a tab appears as the control character^I and an end of line appears as a $|
|:5,20 l|displays lines 5 through 20, showing tab characters and end-of-line characters.|

![images](../../../images/books/set-list.png)

ctags create an information file that vi can use later to determine which files define which funcitions.

|:!ctags file.c|Create a file named tags in current directory that contains info on the functions defined in file.c|

|:tag name|looks at the tags file to find out which file contains the defination of the function name.|

#### Delete all spaces and tabs at the end of every line

In vim:

    :%s/\s\+$//

Explanation:

    : command
    % apply to entire file
    s search and replace
    /\s\+$/ regex for one or more whitespace characters followed by the end of a line
    // replacement value of an empty string


