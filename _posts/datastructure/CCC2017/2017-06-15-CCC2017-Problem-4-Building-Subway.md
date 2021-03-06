---
layout: post
title: "Problem 4 Building Subway"
date: 2017-06-15
category: "datastructure" 
tags: [data structure]
---
#### Problem 4

杭州市有N个区，他们的编号从1到N。杭州市规划任意两个区都可以地铁联通。我们说两个区A和B是联通的，当且仅当A和B之间有直接的地铁线连接，或者存在另外一个地区C使得A和C之间、C和B之间联通。例如： A和C有直达地铁线，A与B也有直达地铁线，则B与C是联通的。 再例如：A和B有直达连线，B与C有直达连线，C与D有直达连线，D与E有直达连线，则A与E是联通的。

我们知道已经有一些铁路存在于一些地区之间了，你的工作是建造另一些铁路使得所有的地区都是联通的，并且所建造铁路的长度最小。 

There are N districts in HangZhou City, number from 1 to N. The government plan to build up the subway to make any of two districts connected. It defines that connection relationship between A and B with the only condition:

    District A and B has the direct connection, or
    A and C has connection relationship, B and C has connection relationship.

i.g A directly connect to B, B directly connect to C, C directly connect to D, D directly connect to E, then A and E has the connection relationship.

Currently several subway lines were already constructed to connect part of the districts in Hangzhou, your aim is to design the rest of subway lines to make any of two districts with connection relationship and the total subway lines shortest.
Input

第一行是杭州地区的个数N（3<=N<=100）。对于之后的N行来说，第i行包含N个整数，其中的第j个数代表地区i和地区j之间的距离d（1<=d<=1000）。

再之后的输入行是整数Q（0<=Q<=N*(N+1)/2）。然后的Q行中，每行都包含两个整数a和b（1<=a<b<=N），代表地区a和地区b之间的铁路已经存在了。 


    The first row: N (total number of the districts in Hangzhou).(3<=N<=100).
    The second row: a(1,1),a(1,2),a(1,3)………a(1,N)
    The third row: a(2,1),a(2,2),a(2,3)………a(2,N)
    …………………………………………….
    The Nth row: a(N,1),a(N,2),a(N,3)………a(N,N)
    Note: a(i,j): the distance between district i and j

    The (N+1) row: M (total number of already available connection,0<=M<=N*(N+1)/2)
    The (N+2) row: b(1,1),b(1,2)
    The (N+3) row: b(2,1),b(2,2)
    …………………………..
    The (N+M+1):   b(M,1),b(M,2)

Note: b(i,1),b(i,2): the i connection between district b(i,1) and district b(i,2) 

(1<=b(i,1)< b(i,2)<=N)

##### Output

要求输出一个整数，即需要修建的铁路总长度的最小值。这些新建道路可以保证所有地区都是联通的。 

The output result is one number – the shortest total length of subway line.

Condition: make any two of districts with connection relationship.

##### Sample Input

    Case #1:
    3
    0 990 692
    990 0 179
    692 179 0
    1
    1 2 

##### Sample Output

    Case #1: 179

#### Solution

这个问题可以用最小生长树解决。
