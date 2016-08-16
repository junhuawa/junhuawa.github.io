---
layout: post
title: "The Least-square method"
date: 2016-08-16
category: "misc" 
tags: [The Least Square Method]
---

A mathematical procedure for finding the best-fitting curve to a given set of points by minimizing the sum of the squares of the offsets ("the residuals") of the points from the curve. The sum of the squares of the offsets is used instead of the offset absolute values because this allows the residuals to be treated as a continuous differentiable quantity. However, because squares of the offsets are used, outlying points can have a disproportionate effect on the fit, a property which may or may not be desirable depending on the problem at hand.   

The formulas for linear least squares fitting were independently derived by Gauss and Legendre.    

Using Least-square method to fit the data provided in the text, using octave:   

p = [36.9 46.7 63.7 77.8 84.0 87.5]   
theta=[181 197 235 270 283 292]   
the = 2.234*p + 95.35   
plot(p, the, "ro");   
hold on   
plot(p, the);  

![image](../screenshots/ordinaryleastsquarefit.png?raw=true)  
