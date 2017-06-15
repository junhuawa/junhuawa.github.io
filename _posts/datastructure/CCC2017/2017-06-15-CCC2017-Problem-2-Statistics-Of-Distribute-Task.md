---
layout: post
title: "Problem 2 Statistics of Distribute Task"
date: 2017-06-15
category: "datastructure" 
tags: [data structure]
---

#### Background

There is one distributed compute system. It allocates tasks across distribute compute nodes. Considering compute node potential issues, some tasks may not be executed successfully. To track tasks execution status, one monitor node is deployed to collect task information.

有一个分布式计算系统，将一些计算任务发到分布式的计算节点。考虑到可能发生的错误，一些分发到节点上的任务有可能失败。为了跟着任务执行结果的状态，部署了一个监控节点来收集任务执行情况。

The monitor node will receive allocated tasks and execution result. Base on these information, the node should output failure summary information.

监控节点会收到两种消息：任务分发消息和执行结果消息。根据这些消息，监控节点需要输出一个失败汇总信息。

To be noticed, each node has only one Source Node or no Source Node (first level node). Tasks can be assigned to direct sub-layer nodes only, no possible from sub-layer node.

需要注意的是，每个节点只会有零个或者一个源节点。任务分发只会从源节点到直接的子节点。
Requirement

Please develop the tracking tool for this monitor node. It should receive messages and output statistics report.To simplify it, the messages will be stored in one plain text file.

请为这个监控节点开发跟踪任务的程序。它应该能接受消息，并且输出统计信息。为了简化，消息会被保存在纯文本文件中。
Messages

Task allocation:

This message is used to tell monitor node the source node allocated some sub tasks, and target compute node will report the task result to monitor node.

这个消息是为了告诉监控节点：源节点分发了一些任务给子节点。

    {SOURCE_NODE_ID, TARGET_NODE_ID, List(SUB_TASK_ID_1, SUB_TASK_ID_2, ......) }

List(SUB_TASK_ID_1, SUB_TASK_ID_2, ......) is consider as one pack of sub tasks. SOURCE_NODE_ID, TARGET_NODE_ID, SUB_TASK_ID will be unique in whole distribution computing system.

List(SUB_TASK_ID_1, SUB_TASK_ID_2, ......) 被认为一个子任务的 pack 。 SOURCE_NODE_ID, TARGET_NODE_ID, SUB_TASK_ID 在整个分布式计算系统中是唯一的。

Task Result:

This message is used to tell monitor node task execution result.

这个消息是为了告诉监控节点：任务执行的结果。

    { TARGET_NODE_ID, SUB_TASK_ID, SUCCESS_OR_FAILURE }

Statistics Report

This report is used to show statistics information of failed source node.

这个消息是为了显示一个节点上失败任务的统计信息。

    { DEPTH_OF_SOURCE_NODE, SOURCE_NODE_ID, COUNT_OF_FAIL_TASK_PACK}

The DEPTH_OF_SOURCE_NODE means the distance from the source node to the top node, starts from 0. Top node is the node which has no parent assign task to it, depth for it is 0.

DEPTH_OF_SOURCE_NODE 是指源节点到根节点的层数，从 0 开始。根节点是指没有源节点给它分发任务的节点（DEPTH=0）。

The COUNT_OF_FAIL_TASK_PACK is used for counting the failed task pack. If one sub task fails, the whole sub task pack is considered as fail. The count will increase one.

COUNT_OF_FAIL_TASK_PACK 是指失败的 pack 的个数。一个 pack 中的任意一个子任务失败时，整个 pack 认为是失败的。这个 count 应该增加 1 。
Test Content
Input

One plain text file contains all messages which reach the monitor node, one line for one message.

一个纯文本文件包含了所有到达监控节点的信息，每行包含一条消息。

    {1, 2, List(1, 2, 3)}

    {2, 1, Success}

    {2, 2, Success}

    {2, 3, Fail}

    {3, 4, Success}

    {1, 3, List(4, 5)}

    {3, 5, Success}

    {3, 9, List(8)}

    {9, 8, Fail}

Output

One plain text file contains all statistics of failed node records. One line is for one node.

监控节点在解析完输入消息后，需要产生一个文本文件，这个文件包含了所有的统计信息。每行包含一个节点的记录。

    {0, 1, 1}

    {1, 3, 1}

Additional Information

    Task Result Message may be lost, can not reach the monitor node, consider that task as Fail.
    Task Result 消息有可能在传输过程中丢失，而无法到达监控节点，这种情况下，这个任务被当作失败的任务。
    One compute node may act as one source node to allocate new tasks, or act as compute node to do computing task only.
    一个计算节点可能会扮演父节点分发任务，也可能只作为计算节点执行计算任务。
