---
layout: post
title: "Problem 3 Voice-operated Switcher Chain"
date: 2017-06-15
category: "datastructure" 
tags: [data structure]
---

#### Problem

The Voice-Operated Switcher is a clever little device that, on one side, plugs its input plug into an output socket, and, on the other side, exposes an output socket for plugging in a light or other device.

When a Voice-Operated Switcher is in the ON state and is receiving power from its input plug, then the device connected to its output socket is receiving power as well. When you snap your fingers -- making a clicking sound -- any Voice-Operated Switcher receiving power at the time of the snap toggles between the ON and OFF states.

In hopes of destroying the universe by means of a singularity, I have purchased N Voice-Operated Switcher devices and chained them together by plugging the first one into a power socket, the second one into the first one, and so on. The light is plugged into the Nth Voice-Operated Switcher.

Initially, all the Voice-Operated Switchers are in the OFF state, so only the first one is receiving power from the socket, and the light is off. I snap my fingers once, which toggles the first Voice-Operated Switcher into the ON state and gives power to the second one. I snap my fingers again, which toggles both Voice-Operated Switchers and then promptly cuts power off from the second one, leaving it in the ON state, but with no power. I snap my fingers the third time, which toggles the first Voice-Operated Switcher again and gives power to the second one. Now both Voice-Operated Switchers are in the ON state, and if my light is plugged into the second Voice-Operated Switcher it will be on.

I keep doing this for hours. Will the light be on or off after I have snapped my fingers K times? The light is on if and only if it's receiving power from the Voice-Operated Switcher it's plugged into.


VOS声控开关是一种很灵活的小设备，它的一边是插头，可以插到插座里；另一边是一个插座可以插一盏灯或者另一个VOS开关。

当VOS开关接通之后，它从插头获取电能，同时可以输出到插座里。当你打响指的时候 – 发出嗒声-- 通了电的VOS开关会在‘接通’和‘关闭’之间切换。

抱着通过一个奇点来毁灭整个宇宙的希望，我买了 N 个VOS开关，把它串了起来，第一个开关插入插座，第二个开关插到第一个VOS开关的插座上，以此类推。另有一盏灯插在第 N 个VOS开关上。

刚开始的时候，所有的开关都是关闭状态，所以此时只有第一个开关是通电的，而灯是不亮的。我打了一个响指之后，第一个开关被接通，第二个开关通电了并保持关闭状态。再打一次响指，触发两个VOS开关，第二个开关失去了电能，但是它已是开通状态。第三次响指之后，第一个VOS开关接通，给第二个开关通电。此时，两个VOS开关都是开通状态，如果有一个灯插在第二个开关上，那么它就被点亮了。

我就这样做了几个小时之后，在打了 K 次响指之后，最后的灯是点亮的，还是不亮的？灯只在它插在通电的VOS开关上才会被点亮。
Input

The first line of the input gives the number of test cases, T. T lines follow. Each one contains two integers, N and K.

输入的第一行表示测试用例的个数 T。之后的T行，每一行都包括两个整数， N 和 K。
Output

For each test case, output one line containing "Case #x: y", where x is the case number (starting from 1) and y is either "ON" or "OFF", indicating the state of the light bulb.

针对每个测试用例，输出必须形如：'Case #x: y'，其中 x 表示用例的需要（从1开始计数），而 y 则要么是 ‘ON’ 要么是 ‘OFF’，表示电灯泡的状态。
Limits

    1 ≤ T ≤ 10,000.

Small dataset

    1 ≤ N ≤ 10;
    0 ≤ K ≤ 100;

Large dataset

    1 ≤ N ≤ 30;
    0 ≤ K ≤ 108;

##### Sample

| Input | Output |
| :--------- | :-------- |
| 4 ||
| 1 0 | Case #1: OFF |
| 1 1 | Case #2: ON |
| 4 0 | Case #3: OFF |
| 4 47 | Case #4: ON |
