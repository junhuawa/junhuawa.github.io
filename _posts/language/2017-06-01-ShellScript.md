---
layout: post
title:  "Shell Script Study Notes"
date: 2017-06-01
category: language
tags: [shell]
---

### Searching and Replacing Substrings within Strings

```sh
    #!/bin/sh
    R0="testtestTX_BCAST : 1234"
    R0=${R0/TX_BCAST : /ahhaa}
    echo "0 $R0"
```
Output:

```sh
    [junhuawa@Tesla shellscript]$ ~/./test.sh 
    0 testtestahhaa1234
```

Replace the first case of "TX BCAST : " with "1234", To replace all cases, not just the first, use below:

**R0=${R0//TX_BCAST : /ahhaa}**

#### More obscure but useful string operations:

    dd if=$fep_name of=$RAMDISK/${fep_name##*/} bs=64M &> /dev/null  

Enclosing a variable name in curly braces, then aplying a special operator to achieve a particular result.  

    * "#": delete from the left, to the first case of what follows.
    * "##": delete from the left, to the last case of what follows.
    * "%": delete from the right, to the first case of what follows
    * "%%": delete from the right, to the last case of what follows
    
[Searching and Replacing Substring](http://arachnoid.com/linux/shell_programming.html#Searching_and_Replacing_Substrings_within_Strings)

#### Remove sections of each line of files

    [junhuawa@Tesla Docomo]$ echo "DEVEL*.FEP:INFO," |cut -d ':' -f1  
    DEVEL*.FEP  

Use delimiter(分隔符) ':' to split the string, and only save the first string of the splited strings.  

    [junhuawa@Tesla ~]$ ls -l|cut -b 17-100  //select only those bytes
    > junhuawa everybody  4096 Aug 20 15:39 Blog  
    junhuawa everybody    95 Aug 11 11:12 certs  
    junhuawa everybody  4096 Jul 20 10:28 decisco  
    junhuawa everybody  4096 Aug 27 08:04 Desktop  


#### Translate or delete characters

    [junhuawa@Tesla Docomo]$ echo "LCP____AO*.FEP,LCP____SO*.FEP,LCP____SF*.FEP,*.OEP,LCP____AF*.FEP" |tr "," "\n"
    > LCP____AO*.FEP  
    LCP____SO*.FEP  
    LCP____SF*.FEP  
    *.OEP  
    LCP____AF*.FEP  

Translate the string "," to "\n".

#### Array in shell script

```sh
    [junhuawa@Tesla ~]$ list=("cricket" "frog" "cat" "dog")
    [junhuawa@Tesla ~]$ echo $list
    cricket
    [junhuawa@Tesla ~]$ echo ${#list[@]}
    4
    [junhuawa@Tesla ~]$ echo ${list[@]} //visit whole array
    cricket frog cat dog
    [junhuawa@Tesla ~]$ echo ${#list[3]} //show the lenght of the string of the 3rd element of the array
    3
    [junhuawa@Tesla ~]$ echo ${#list[2]}
    3
    [junhuawa@Tesla ~]$ echo ${#list[1]}
    4
    [junhuawa@Tesla ~]$ echo ${#list[0]}
    7
```

```sh
    test=(KA KB KC)
    for soc in ${test[@]}; do
        echo -n "$soc "
    done
```
Result:

    >> KA KB KC 

Number of strings in $fep_matching_list[@]

    if [ ${#fep_matching_list[@]} -gt 1 ]

#### while loop 
```sh
    #!/bin/sh
    c=1
    while [ $c -le 5 ]
    do
        echo "Welcome $c times!"
        (( c++ ))
    done
```

#### Command find

    [junhuawa@hzling30]$find . -type f -exec file '{}' \;

Find normal file, and use file cmd to show the results. 

Notice that the braces are enclosed in single quote marks to protect them from interpretation as shell script punctuation.   
The semicolon is similarly protected by the use of a  back-slash, though â;â could have been used in that case also.

### xargs - build and execute command lines from standard input

xargs:
       Because  Unix  filenames can contain blanks and newlines, this default behaviour is often problematic; filenames containing
       blanks and/or newlines are incorrectly processed by xargs.  In these situations it is better to use the -0 option,  which
       prevents  such  problems.    When  using  this option you will need to ensure that the program which produces the input for
       xargs also uses a null character as a separator.  If that program is GNU find for example, the -print0 option  does  this
       for you.

    find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f

Find files named core in or below the directory /tmp and delete them, processing filenames in  such  a  way  that  file  or
directory names containing spaces or newlines are correctly handled.

### $* is not equivalent to "$@"

**for variable in \$\***
not equivalent to 
**for variable in "$@"**

The symbol $* expands to $1, $2, $3, etc, but the 4-character sequence "$@" expands to 
"$1", "$2", "$3", etc. Quotation marks prevent further interpretation of special characters.

```sh
#!/bin/sh
for variable in "$@"
do
    echo $variable
done
```

```sh
    [junhuawa@Tesla books]$ git status |grep deleted|awk '{print $3}'|xargs git rm
    rm '_posts/books/2016-10-05-Learning-the-vi-and-Vim-Editors.md'
    rm '_posts/books/2016-10-05-vim-Global-Replacement.md'
```

#### 获取字符串的MD5值

字符串“hello”的MD5：

    $ echo -n 'hello'|md5sum|cut -d ' ' -f1

得到的MD5值：

    5d41402abc4b2a76b9719d911017c592

#### 命令解释：

md5sum: 显示或检查 MD5(128-bit) 校验和,若没有文件选项，或者文件处为"-"，则从标准输入读取。

echo -n : 不打印换行符。

cut:  cut用来从标准输入或文本文件中剪切列或域。剪切文本可以将之粘贴到一个文本文件。 
        -d 指定与空格和tab键不同的域分隔符。-f1 表示第一个域。

### OPTIND in getopts

${@:1:OPTIND-1}

${@} means the input parameter array, ${@:1:OPTIND-1} means get the slice from
1 to OPTIND-1 from the input array. 


#### Check cmd return value in shell

```shell
cmd
if [ $? -ne 0 ]; then
    brabra
fi
```

#### ${!var} meaning

    ${!var}
    用于返回以var变量的值命名的变量的值，这话很难理解，其实有些类似C里面的指针，看代码就明白了。
```sh
    tmp_path=/tmp
    path=tmp_path
    echo ${!path}
    >>> /tmp
```

    shell先将path解析出来，得到tmp_path，再取tmp_path的值，所以得到结果/tmp。
    使用eval的方法稍显麻烦：
    eval echo \$$path
    >>> /tmp

#### sed 替换

```sh
    10:41 junhuawa@Tesla:~ $ echo "powerpc__NEW_LINE__" |sed 's/__NEW_LINE__ */\x0/g'//替换成16进制的0
    powerpc
    10:41 junhuawa@Tesla:~ $ echo "powerpc__NEW_LINE__" |sed 's/__NEW_LINE__ *//g'
    powerpc
    10:41 junhuawa@Tesla:~ $
```


