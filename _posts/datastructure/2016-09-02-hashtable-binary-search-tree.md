---
layout: post
title: "Hash table vs Balanced binary tree"
date: 2016-09-02
category: "datastructure" 
tags: [data structure]
---
### Hash table vs Balanced binary tree

This question cannot be answered, in general, I fear.

The issue is that there are many types of hash tables and balanced binary trees, and their performances vary widely.

So, the naive answer is: it depends on the functionality you need. Use a hash table if you do not need ordering and a balanced binary tree otherwise.

For a more elaborate answer, let's consider some alternatives.

#### Hash Table (see Wikipedia's entry for some basics)

    Not all hash tables use a linked-list as a bucket. A popular alternative is to use a "better" bucket, for example a binary tree, or another hash table (with another hash function), ...
    Some hash tables do not use buckets at all: see Open Addressing (they come with other issues, obviously)
    There is something called Linear re-hashing (it's a quality of implementation detail), which avoids the "stop-the-world-and-rehash" pitfall. Basically during the migration phase you only insert in the "new" table, and also move one "old" entry into the "new" table. Of course, migration phase means double look-up etc...

#### Binary Tree

    Re-balancing is costly, you may consider a Skip-List (also better for multi-threaded accesses) or a Splay Tree.
    A good allocator can "pack" nodes together in memory (better caching behavior), even though this does not alleviate the pointer-look-up issue.
    B-Tree and variants also offer "packing"

Let's not forget that O(1) is an asymptotic complexity. For few elements, the coefficient is usually more important (performance-wise). Which is especially true if your hash function is slow...

Finally, for sets, you may also wish to consider probabilistic data structures, like Bloom Filters.
