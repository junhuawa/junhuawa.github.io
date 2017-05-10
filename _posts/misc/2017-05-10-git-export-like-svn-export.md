---
layout: post
title: "Git export like svn export"
date: 2017-05-10
category: "misc" 
tags: [git]
---

Probably the simplest way to achieve this is with `git archive`. If you really
need just the expanded tree you can do something like this.

`git archive` will output a tar file to the stdout.

    git archive master | tar -x -C /somewhere/else

Most of the time that I need to **'export'** something from git, I want a
compressed archive in any case so I do something like this.

    git archive master | bzip2 >source-tree.tar.bz2

ZIP archive:

    git archive --format zip --output /full/path/to/zipfile.zip master 

`git help archive` for more details, it's quite flexible.

[git export like svn export](http://stackoverflow.com/questions/160608/do-a-git-export-like-svn-export)
