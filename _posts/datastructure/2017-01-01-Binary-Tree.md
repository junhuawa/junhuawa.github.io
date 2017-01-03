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

*The height(or depth) of a binary tree is the number of levels in it.*

**Property 2**
A binary tree of height h, h >= 0, have at least h and at most $$2^h - 1$$ elements in it.

**Property 3**
The height of a binary tree that contains n, n >= 0, elements is at most
n and at least $$log_2^{(n+1)}$$.

#### Full binary tree
A binary tree of height h that contains exactly $$2^h -1$$ elements.

#### Complete binary tree

We number the elements in a full binary tree of height h using the numbers 1
through $$2^h - 1$$.

Suppose we delete the element k, k >=0, elelents numbered $$2^h - i$$, $$1 \leq i \leq k$$ for
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


### AVL TREES (严格平衡的二叉树)

#### Definition

An empty binary tree is an AVL tree. If T is a nonempty binary tree with 
$$T_L$$ and $$T_R$$ as its left and right subtrees. then T is an AVL tree iff

1. $$T_L$$ and $$T_R$$ are AVL trees;

2. $$\vert h_L - h_R\vert \leq 1$$ where $$h_L$$ and $$h_R$$ are the heights of $$T_L$$ and $$T_L$$, respectively.

#### AVL Tree representation
Usually, use the linked representation scheme for binary trees. To facilitate
insertion and deletion, a balance factor *bf* is associated with each node. 
    
    bf(x) = height of left subtree of x - height of right subtree of x

The permissible balance factors are -1, 0, and 1.

#### Height of an AVL Tree

Let $$ N_h $$ be the minimum number of nodes in an AVL tree of height h. In the worst
case the height of one of the subtrees is $$ h - 1$$, and the height of the other is
$$ h-2$$. Both these subtrees are also AVL trees. Hence

$$N_h = N_{h-1} + N_{h-2} +1, N_0 = 0,\hbox{ and } N_1 = 1$$

This is similar to Fibonacci numbers.

$$F_n = F_{n-1} + F_{n-2}, F_0 = 0,\hbox{ and } F_1 = 1$$

$$N_h = F_{h+2} - 1 \hbox{ for } h \geq 0$$. From Fibonacci number theory we know that Fh = h/ where

### RED-BLACK TREES(黑平衡的二叉树)

A red-black tree is a binary search tree in which every node is colored either
red or black. The remaining properties satisfied by a red-black tree are best
stated in terms of the corresponding extended binary tree. The additional
properties are:

RB1. The root and all external nodes are colored black. 

RB2. No root-to-external-node path has 2 consecutive(连续的) red nodes.

RB3. All root-to-external-node paths have the same number of black nodes.

#### rank

The rank of a node in a red-black tree be the number of black pointers on any
path from the node to any external node in its subtree. 

#### Lemma 1

Let the lenght of a root-to-external-node path be the number of pointers on
the path. If P and Q are 2 root-to-external-node paths in a red-black tree,
then *Length(P) <= 2Length(Q)*. 

红黑树是平衡二叉树，通过对任何一条从根到叶子的简单路径上各个节点的颜色进行约束，确保没有一条路径会比其他路径长2倍，因而是近似平衡的。

#### Lemma 2

Let h be the height of a red-black tree (excluding the external nodes), let n
be the number of internal nodes in the tree, and let r be the rank of the
root. 

a. *h <= 2r*

b. *n >= 2r -1*

c. *$$h \leq 2log_2^{(n+1)}$$*

### AVL VS RBTREE
The worst-case height of an AVL Tree is least, so AVL trees have the best
worst-case performance in applications where search is the dominant operation. 

Inserion and deletion in Red-Black tree is more simple to AVL tree, **at most**it only
need 1 time rotation. While in AVL tree, 
at most 1 single rotation is needed for insertion, 
But to deletion, 1 rotation may not suffice to restore balance, the number of
rotations needed is O( *logn* ).


[Chinese version](https://www.zhihu.com/question/30527705/answer/52919336)

AVL树：平衡二叉树，一般是用平衡因子差值决定并通过旋转来实现，左右子树树高差不超过1，那么和红黑树比较它是严格的平衡二叉树，
平衡条件非常严格（树高差只有1），只要插入或删除不满足上面的条件就要通过旋转来保持平衡。
由于旋转是非常耗费时间的。我们可以推出AVL树适合用于插入删除次数比较少，但查找多的情况。

红黑树：平衡二叉树，通过对任何一条从根到叶子的简单路径上各个节点的颜色进行约束，确保没有一条路径会比其他路径长2倍，因而是近似平衡的。
所以相对于严格要求平衡的AVL树来说，它的旋转保持平衡次数较少。用于搜索时，插入删除次数多的情况下我们就用红黑树来取代AVL。



