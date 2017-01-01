---
layout: post
title: "Binary Tree"
date: 2017-01-01
category: "datastructure" 
tags: [data structure]
---

### Level
The tree root is at level 1; its children (if any) are at level 2; their
children (if any) are at level 3; and so on. 

### The degree of an element

The number of children it has. The degree of a leaf is zero. the degree of a
tree is the maximum of its element degrees.

### Binary tree t
Is a finite (possibly empty) collection of elements. When the binary tree is
not empty, it has a root element and the remaining elements(if any) are
partitioned into 2 binary trees, which are called the left and right subtees
of t.

#### Properties of binary trees
**Property 1**

    The drawing of every binary tree with n elements, n > 0, has exactly n-1
    edges. 


**The height(or depth) of a binary tree is the number of levels in it. **

**Property 2**
    A binary tree of height h, h >= 0, have at least h and at most
    ![equation](http://www.sciweavers.org/tex2img.php?eq=%20%202%5E%7Bh%7D-1&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
    elements in it.

**Property 3**
    The height of a binary tree that contains n, n >= 0, elements is at most
    n and at least log2(n+1).

#### Full binary tree
A binary tree of height h that contains exactly 2h -1 elements.

#### Complete binary tree

    We number the elements in a full binary tree of height h using the numbers 1
    through 2h-1.

    Suppose we delete the element k, k >=0, elelents numbered 2h-i, 1 \<\= i \<\=k for
    any k. The resuling binary tree is called a complete binary tree. 

    There is a very nice relationship among the numbers assigned to an element and
    its children in a complete binary tree.

#### Extended binary tree

Consider a binary tree in which a special node called an external node
replaces each empty subtree. The remaining nodes are called internal nodes. A
binary tree with external nodes added is called *an extended binary tree*.

#### Indexed Binary Search Tree
An indexed binary search tree is derived from an ordinary binary search tree
by adding the field LeftSize to each tree node. This field gives the number of
elements in the node's left subtree plus one. 

Note, the LeftSize also gives the rank of an element with respect to the
elements in its subtree.


### AVL TREES

#### Definition

An empty binary tree is an AVL tree. If T is a nonempty binary tree with 
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BL%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
and
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BR%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) as its left and right subtrees. then T is an AVL tree iff

1.
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BL%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) and 
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BR%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) are AVL trees;

2.
![equation](http://www.sciweavers.org/tex2img.php?eq=%20%5Cmid%20%20h_%7BL%7D%20-%20h_%7BR%7D%5Cmid%20%5Cleq%201%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
where
![equation](http://www.sciweavers.org/tex2img.php?eq=h_%7BL%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) and 
![equation](http://www.sciweavers.org/tex2img.php?eq=h_%7BR%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) are the heights of 
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BL%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) and 
![equation](http://www.sciweavers.org/tex2img.php?eq=%20T_%7BR%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0), respectively.
