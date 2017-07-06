---
layout: post
title: "Bootstrap"
date: 2017-06-17
category: "bootstrap"
tags: [bootstrap]
---
### Bootstrap

[Bootstrap](http://v3.bootcss.com/)

Bootstrap 是最受欢迎的 HTML、CSS 和 JS 框架，用于开发响应式布局、移动设备优先的 WEB 项目。
Bootstrap
让前端开发更快速、简单。所有开发者都能快速上手、所有设备都可以适配、所有项目都适用。

Bootstrap 是完全开源的。它的代码托管、开发、维护都依赖 GitHub 平台。
Bootstrap was developed by Mark Otto and Jacob Thornton at Twitter. It was
released as an open source product in August 2011 on GitHub.

CSS预处理脚本: Less & Sass

[Bootstrap](http://getbootstrap.com/getting-started/#download)

    [root@Tesla junhuawa]# npm  install bootstrap@3
    npm http GET https://registry.npmjs.org/bootstrap
    npm http 200 https://registry.npmjs.org/bootstrap
    npm http GET https://registry.npmjs.org/bootstrap/-/bootstrap-3.3.7.tgz
    npm http 200 https://registry.npmjs.org/bootstrap/-/bootstrap-3.3.7.tgz
    bootstrap@3.3.7 node_modules/bootstrap
    [root@Tesla junhuawa]# 

### HTML

超文本标记语言（英语：HyperText Markup
Language，简称：HTML）是一种用于创建网页的标准标记语言。
您可以使用 HTML 来建立自己的 WEB 站点，HTML 运行在浏览器上，由浏览器来解析。

    HTML 不是一种编程语言，而是一种标记语言
    标记语言是一套标记标签 (markup tag)
    HTML 使用标记标签来描述网页
    HTML 文档包含了HTML 标签及文本内容
    HTML文档也叫做 web 页面

#### HTML 标签

HTML 标记标签通常被称为 HTML 标签 (HTML tag)。

    HTML 标签是由尖括号包围的关键词，比如 <html>
    HTML 标签通常是成对出现的，比如 <b> 和 </b>
    标签对中的第一个标签是开始标签，第二个标签是结束标签
    开始和结束标签也被称为开放标签和闭合标签

#### Web 浏览器

Web浏览器（如谷歌浏览器，Internet Explorer，Firefox，Safari）是用于读取HTML文件，并将其作为网页显示。

浏览器并不是直接显示HTML标签，但可以使用标签来决定如何展现HTML页面的内容给用户：

#### HTML example

    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>页面标题</title>
    </head>
    <body>
    
    <h1>我的第一个标题</h1>
    
    <p>我的第一个段落。</p>
    
    </body>
    </html>


对于中文网页需要使用 <meta charset="utf-8"> 声明编码，否则会出现乱码。
静态网页文件的扩展名: htm/html 

    <!DOCTYPE html>  声明为HTML5文档

title 与 heading 这两个单词在日常的英语中是可以通用的，在HTML中，<title>
指定整个网页的标题，并不显示在网页上，而显示在浏览器窗口的标题栏中。
而heading标签使一些文本突出显示在网页上。 

一个网页只能有一个\<title\>, 且只能出现在\<head\>和\<\/head\> 标签之间，而\<h1\>, 
\<h2\> 和\<h3\> 可以有任意多个，顺序也可以根据需要任意安排。

### Node.js

    Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境。
    Node.js 使用了一个事件驱动、非阻塞式 I/O 的模型，使其轻量又高效。
    Node.js 的包管理器 npm，是全球最大的开源库生态系统。 

    npm: node package manager


#### Container in Bootstrap

container is a container of row elements.

row elements are containers of columns (the docs call it grid system)

Also, container sets the content's margins dealing with the responsive behaviors of your layout.

Thus the container class is often used to create 'boxed' contents based on the style guidelines of the Bootstrap project.

If you want to go "out of the box" creating a full width grid you can use only row elements with columns inside (spanning the usual 12cols total).

https://stackoverflow.com/questions/19983857/when-should-i-use-container-and-row-in-twitter-bootstrap-3

[The Subtle Magic Behind Why the Bootstrap 3 Grid Works](http://www.helloerik.com/the-subtle-magic-behind-why-the-bootstrap-3-grid-works)

http://getbootstrap.com/css/

### Less

Less 是一门 CSS 预处理语言，它扩充了 CSS 语言，增加了诸如变量、混合（mixin）、函数等功能，让 CSS 更易维护、方便制作主题、扩充。

Less 可以运行在 Node、浏览器和 Rhino 平台上。网上有很多第三方工具帮助你编译 Less 源码。


### "jquery.min.css" vs "jquery.css"

The min version is minified, compressed. Functionally they should be identical. The minified version is smaller and downloads faster and should be used in production, but is unreadable and therefore bad during development.

#### Minification

Minification (also minimisation or minimization), in computer programming languages and especially JavaScript, is the process of removing all unnecessary characters from source code, without changing its functionality. These unnecessary characters usually include white space characters, new line characters, comments, and sometimes block delimiters, which are used to add readability to the code but are not required for it to execute.
