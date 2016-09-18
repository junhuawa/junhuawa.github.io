---
layout: post
title: "Red-Black Tree VS AVL Tree"
date: 2016-09-02
category: "datastructure" 
tags: [data structure]
---

### Red-Black Tree VS AVL Tree

Both are popular Balanced Binary Search Tree, Both offers O(lg N) search time. 

** But the hidden constant behind Big O makes AVL Tree more suitable for search and Red-Black Tree for insertion-deletion.** 

Insertion-deletion takes less time in Red-Black Tree than AVL Tree. 

That's Red-Black Tree are more popular than AVL Tree although implementing Red-Black is very complicated task.

### Red-Black Tree use cases

* Completely Fair Scheduler in Linux Kernel - the process virtual runtimes serve as the key.
* To keep track of the virtual memory segments for a process - the start address of the range serves as the key. 
* In various implementations of Associative Data structures (for e.g C++ STL uses RB tree internally to implement Set and Map)
* HashMap in java 8 uses RB tree instead of linked list to store key value pair in the bucket corresponding to hash of key.
