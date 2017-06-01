---
layout: post
title:  "Welcome to Jekyll!"
date: 2014-08-12
category: demo
tags: [test, jekyll, welcome]
---

# 这是 h1

## 这是 h2

### 这是 h3

#### 这是 h4

##### 这是 h5

###### 这是 h6

**这是粗体**

*这是斜体*

<!-- more -->

>这是引用

分割线

- - -

`这是一个代码块`

段落代码

    /* hello world demo */
    #include <stdio.h>
    int main(int argc, char **argv)
    {
        printf("Hello, World!\n");
        return 0;
    }

高亮段落代码

```ruby
/* hello world demo */
#include <stdio.h>
int main(int argc, char **argv)
{
    printf("Hello, World!\n");
    return 0;
}
```
if we have images, we need to put the md file in category's directory, 
and use relative path to refer the image, so ReText can see the whole html file.

if not, the image can't be refered by ReText.

下面是表格

|head1|head2|head3|head4|
|---|:---|---:|:---:|
|row1text1|row1text2|row1text3|row1text4|
|row2text1|row2text2|row2text3|row2text4|
|row3text1|row3text2|row3text3|row3text4|
|row4text1|row4text2|row4text3|row4text4|

### Strike through the line
Use ~~tildes around the words~~.

I just used the following syntax <del> ... </del> successfully on GitHub in an issue description.

### Lists

1. First ordered list item
2. Another item
⋅⋅* Unordered sub-list. 
1. Actual numbers don't matter, just that it's a number
⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅You can have properly indented paragraphs within list items. Notice the
blank line above, and the leading spaces (at least one, but we'll use three
here to also align the raw Markdown).

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing
spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing
spaces are not required.)

* Unordered list can use asterisks
* - Or minuses
* + Or pluses

    In a world without walls and fences, who needs DOORS, WINDOWS and GATES?

#### How to get a vertical pipe in the table
You need to use the &#124; entity code to get a vertical pipe. It appears as
"|" in the rendered table.

| parameters | desc |
| :--------- | :-------- |
| -w &#124; --word | Parameter for word |

[Keyword for Code Highlight in Markdown](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)
[Lists in Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lists)
