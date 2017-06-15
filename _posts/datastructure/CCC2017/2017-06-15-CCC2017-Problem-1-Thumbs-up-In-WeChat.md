---
layout: post
title: "Problem 1 Thumbs-up in WeChat"
date: 2017-06-15
category: "datastructure" 
tags: [data structure]
---

#### Problem 1 Thumbs-up in WeChat

One day, you received a chat message from a friend in WeChat. He just published a message in WeChat's Circles, and wanted you to help him to get thumbs-up as much as possible. You decide to encourage all of your friends in WeChat.

Initially, all of your friends don’t give any thumbs-up. Everyone has a follow level. A friend with follow level Fi will wait until at least Fi other friends have already give a thumbs-up, and if so, he will immediately give a thumbs-up. If Fi = 0, then the friend will always give a thumbs-up immediately, regardless of what anyone else does. For example, a friend with Fi = 2 will hold on at the beginning, but will give a thumbs-up after he sees at least two other thumbs-ups.

You know the follow level of your WeChat friends, and you are prepared to invite additional friends to be in the WeChat groups to ensure that everyone in WeChat give thumbs-up in the end. Each of these friends may have any follow value that you wish, not necessarily the same. What is the minimum number of friends that you need to invite to guarantee all thumbs-up?

某天，一位朋友在微信上请求你帮忙给他的某个微信文章点赞，而且越多越好。于是，你就想让你所有的微信好友都能帮忙点。

假设，开始的时候你的所有朋友都没有去点过赞。他们都很善良，而且每个人都有从众心理，以及一个从众阈值Fi，只有当文章至少有Fi个赞之后，阈值为Fi的朋友才会而且一定会去点赞。例如小明的阈值Fi为0，那么他就会立刻去点赞，而不管文章现在是否有赞。如果小白阈值Fi为2，那么只有在文章集到2个赞之时，他在会去点赞。你现在知道所有的微信好友的从众阈值，同时为了让大家都能去点赞，还准备收买水军以保证所有的朋友都会去点赞。而你可以完全控制水军的点赞行为。

请计算出在微信好友给定的情况下，需要收买的最少水军数量。

##### Input

The first line of the input gives the number of test cases, T. T test cases follow. Each consists of one line with Fmax, the maximum follow level of the stubbornest person in friends, followed by a string of Fmax + 1 single digits. The kth digit of this string (counting starting from 0) represents how many people in friends have follow level k. For example, the string "409" would mean that there were four friends with Fi = 0 and nine friends with Fi = 2 (and none with Fi = 1 or any other value). Note that there will initially always be between 0 and 9 people with each follow level. The string will never end in a 0. Note that this implies that there will always be at least one friend.

第一行表示测试用例的总数T，后面的所有行每行对应一个测试用例。每个测试用例分两个部分Fmax和一串数。Fmax表示微信好友中最能坚持己见的朋友的从众阈值，后面的一串数由Fmax+1个独立数字组成。第k个数表示微信好友中从众阈值为k的人有几个。例如数串‘409’ 说明阈值为0的有4个人，阈值为1的没有，阈值为2的有9个人。

请注意人数只能是数字0到9，而且数串不会以数字0结尾，这就意味着所有的测试用例中最少会有一位微信好友。

##### Output

For each test case, output one line containing "Case #x: y", where x is the test case number (starting from 1) and y is the minimum number of additional friends you must invite.

对应每个测试用例，要求输出一行形如：“Case #x:y”，其中x表示测试用例的序号（从1开始），y表示你所需要购买的水军最少人数

##### Limits

    1 ≤ T ≤ 100.

Small dataset

    0 ≤ Smax ≤ 6.

Large dataset

    0 ≤ Smax ≤ 1000.

##### Sample

Input 

    4
    4 11111
    1 09
    5 110011
    0 1

Output 

    Case #1: 0
    Case #2: 1
    Case #3: 2
    Case #4: 0

In Case #1, the friends will eventually give all humbs-up on its own, without you needing to add anyone -- first the friend with Fi = 0 will give a thumbs-up, then the friend with Fi = 1 will give another thumbs-up, etc.

In Case #2, a friend with Fi = 0 must be invited, but that is enough to get the entire friends to give thumbs-up.

In Case #3, one optimal solution is to add two additional friends with Fi = 2.

In Case #4, there is only one friend and he will give a thumbs-up immediately. No friends need to be invited.
