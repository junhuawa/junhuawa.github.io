---
layout: post
title: "R language Study Notes"
date: 2016-08-16
category: "misc"
tags: [R]
---

List installed packages;  
library()   

list the args of a function:  
args(lm)  
show an example:  
example(lm)  

import a data frame from a text file:  
read.table()  
read.csv()  

Write a data set to a text file:  
write.table(test.data, file="test.txt", sep=" ")  
write.csv(): use comma as the default delimiter.  

Get the working directory:  
getwd()  



anova: Analysis of Variance(方差分析), created by R.A.Fisher.   
方差分析是从观测变量的方差入手，研究诸多控制变量中哪些变量是对观测变量有显著影响的变量。  
