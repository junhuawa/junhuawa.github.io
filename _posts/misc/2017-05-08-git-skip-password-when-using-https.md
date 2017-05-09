---
layout: post
title: "Is there a way to skip password typing when using https:// on Github/Gitlab"
date: 2017-05-08
category: "misc" 
tags: [git]
---

### With Git version 1.7.9 and later

Since Git 1.7.9 (released in late January 2012), 
there is a neat mechanism in Git to avoid having to type your password all the time for HTTP / HTTPS, 
called **credential helpers**. 

    git config --global credential.helper cache

Which tells Git to keep your password cached in memory for (by default) 15 minutes. You can set a longer timeout with:

    git config --global credential.helper "cache --timeout=3600"

### With Git versions before 1.7.9

You'll need to change the URL that your origin remote uses to include the password in this fashion:

    https://you:password@github.com/you/example.git

in other words with :password after the username and before the @.

You can set a new URL for your origin remote with:

    git config remote.origin.url https://you:password@github.com/you/example.git

Make sure that you use https and you should be aware that if you do this, your GitHub password will be stored in plaintext in your .git directory, which is obviously undesirable.

### With any Git version(well, since version 0.99)

An alternative approach is to put your username and password in your ~/.netrc file, although, as with keeping the password in the remote URL, 
this means that your password will be stored on the disk in plain text and is thus less secure and not recommended. 
However, if you want to take this approach, add the following line to your ~/.netrc:

    machine <hostname> login <username> password <password>

replacing <hostname> with the server's hostname, and <username> and <password> with your username and password. 
Also remember to set restrictive file system permissions on that file:

    chmod 600 ~/.netrc

For example, github blog also use below machine name:
    
~/.netrc

```sh
    machine github.com
    login ***
    password ***
```
