---
layout: post
title:  "HTML & CSS!"
date: 2017-06-19
category: html 
tags: [html]
---

The HTML DOM document object is the owner of all other objects in your web page.
The document object represents your web page.

If you want to access any element in an HTML page, you always start with accessing the document object.

Below are some examples of how you can use the document object to access and manipulate HTML.

    document.getElementById(id)     Find an element by element id
    document.getElementsByTagName(name)     Find elements by tag name
    document.getElementsByClassName(name)   Find elements by class name

document 只能在客户端使用，在server端要输出测试log，可以用console.log().
在server端执行js程序:

    node random_quote.js

一个javascript函数是一段实现特定功能的代码。它在被调用时执行。

函数定义:
    
    function name(parameter1, parameter2, parameter3){
        code to be executed
        }


[javascript](https://www.w3schools.com/js/js_functions.asp)


```javascript

    <!DOCTYPE html>
    <html>
    <body>

    <p id="myP">I am a paragraph.</p>

    <p>Click the button get the HTML content of the p element.</p>

    <button onclick="myFunction()">Try it</button>

    <p id="demo"></p>

    <script>
    function myFunction() {
        var x = document.getElementById("myP").innerHTML;
        document.getElementById("demo").innerHTML = x;
    }
    </script>

    </body>
    </html>
```
The innerHTML property sets or returns the HTML content (inner HTML) of an
element.
