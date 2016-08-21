---
layout: post
title: "Camille-Fournier-on-Real-World-Distributed-Systems"
date: 2016-08-20
category: "seradio" 
tags: [distributed system]
---
# Camille-Fournier-on-Real-World-Distributed-Systems

**Self introduction:**  
    Get bachelor degree from Carnegie Mellon University, Computer Science, and Math and CS from University of Wisconsin. 
She lives with her son and husband in New York.  She is a member of Apache Software Foundation.

**Distributed system definition:**   
    The failure of the computer you don't know exist can render your own computer machine unusable! (Lesile Lamport)        
    If you're talking to a Database through a network, it's a Distributed System. 

**3 layer:**  
    view layer,  
    application layer,  
    Database layer.   

Develop Distributed system, it does not mean you need to engage with the entire world's distributed system's complexity to make it usable!  
DS: It's a engineering problem and theory problem.   

**Challenges with DS:**  
    1. need to scale  
    2. problems not fit to single machine ( more data/more volumes of user/more computations)  
    3. Failure tolerance (system need to survive a certain amount of failure)  
    Scaling and failure tolerance make each other harder!  

**Real world: Face the conflict, need to balance the 2 things, which of them they care more!**  

**CAP theorem:**  
    P:  
    Consistency:  
        can you lose data? Can you clients read data at the same time and see different results?  
    Availability:  
        How many failures can you tolerate and still respond to clients?  
    **It's a balance**  
    Normal people faces it when build out service architecture.   

**Stateless application:**  
Service architecture is a thin way to think of distributed system arch.  

Now is easier to day because we have cloud.   
Don't buy complexity you don't need.   
ACID transactional db  
MongoDB, Cassandra  
Biggest cost of your sw is developer time.   
MongoDB: is easy to use, the start up cost of a Distributed system's storage system is really high.  
Usability of a Database if more important to tackle first than the correctness. 

stateless: web server application  

**Stateful part:**  
Stateful part: Need to consider the level of consistency you need for various part of your data.   
    where you comfortable having inconsistent state, where you need absolute consistency.  

cache state: stale data, lose data/reconstruct that data.   
    MongoDB, Redis  
CDN: Content delivery network.   

what data you have to be fresh, locked, only one writer, slightly stale, really stale, we don't care.   

Developers need to understand when you care losing data. never want to lose data, that's not true.   
Different application have different thresholds of losing data that we're willing to tolerate.   
    twitter lose post  vs give me money, and placing on the order.   


**Configuration data consistency**  
    She is a member of Apache Zookeeper.  
    Zookeeper: every update goes to a **consensus algorithm**.  
    etcd rely on raft.   
    they do key-value stores.  
    very useful for service orchestration type work.   
    Cluster management understanding who is around and available, and give those people information.  
Distributed locking: another huge use case for this type of system, to select a leader.  
   you don't want a system which can give you 2 different leader.  

Use DB to write a distributed lock is not a awesome way, even though DB are good at transactional actions. That's different for distributed locking.   
You probably don't want to poll a database to check if a lock state has changed.   
The consensus system have the ability to notify you when the state of the system changes.   

**All distributed system need consensus system?**  
    No,
    Distributed database, need to implement your own paxos, you own consensus state machine internally to do that kind of management.     
You don't need to do if unless it's a part of the large zookeeper ecosystem.   
**Zookeeper support a bunch of hadoop family products.  It's like kafka is from linkedin. **  

**Goldman Sachs:**  
    Joined in 2005, it's a financial institution, build by distributed system.   
    building sth be valuable for the business.   
    Finally, I attend a project to build a global service discovery system.  
    Goldman Sachs not do code review, but we do a lot of pair programming, a lot of tests, and validation.  
    In a large company like goldman, they lose their sense of what's important, valuable, and what needs to happen.   

**End:**  
   We made a lot of tradeoffs as a engineer. So, try to tackle the problem you really need to solve, where value lives in your business.   



**ACID:**  
        Atomicity  
        Consistency  
        Isolation  
        Durability  
In computer science, ACID (Atomicity, Consistency, Isolation, Durability) is a set of properties of database transactions. In the context of databases, a single logical   operation on the data is called a transaction. For example, a transfer of funds from one bank account to another, even involving multiple changes such as debiting one account and crediting another, is a single transaction.  


**CAP Theorem**  
In theoretical computer science, the CAP theorem, also named Brewer's theorem after computer scientist Eric Brewer, states that it is impossible for a distributed computer system to simultaneously provide all three of the following guarantees:
    1. Consistency (all nodes see the same data at the same time)  
    2. Availability (every request receives a response about whether it succeeded or failed)  
    3. Partition tolerance (the system continues to operate despite arbitrary partitioning due to network failures)  

**MongoDB** (from humongous) is a free and open-source cross-platform document-oriented database. Classified as a NoSQL database, MongoDB avoids the traditional table-based relational database structure in favor of JSON-like documents with dynamic schemas (MongoDB calls the format BSON), making the integration of data in certain types of applications easier and faster. As of July 2015, MongoDB was the fourth most widely mentioned database engine on the web, and the most popular for document stores.

**Apache Cassandra** is a free and open-source distributed database management system designed to handle large amounts of data across many commodity servers, providing high availability with no single point of failure. Cassandra offers robust support for clusters spanning multiple datacenters, with asynchronous masterless replication allowing low latency operations for all clients.

    Camille Fournier 在这个interview里介绍了各种分布式系统关注点的不同，及目前的应用。 首先提出了Lesile Lamport对分布式系统的定义：分布式系统就是一个你不知道的计算机出现的错误会导致你的计算机出错，崩溃。
    分布式系统目前面临着更多的挑战： 在cloud下要能够水平扩展，要解决更复杂的问题（更多的数据，更多的用户和计算），并且要有容错机制, 单个节点的错误不能影响整体的性能。
    根据应用场合可以将分布式系统分成不同的类别：
        1. 无状态的应用，比如web server， 他们对数据一致性要求不高，MySQL这种数据库支持事务，但是在这种应用中可以不需要，所以可以用更易用的数据库，比如MongoDB。
        2. 有状态的应用，开发者需要明白什么时候需要数据一致性，什么时候不需要。 不同的应用对数据有不同的要求和忍受力。比如twitter上一条post的丢失， 和电子商务网站一个订单的丢失是两个截然不同的结果。
        3. 配置数据的一致性，在大规模的应用中，需要有一致性算法去保证数据的一致性。 Zookeeper，raft就是为了解决这个问题。他们保存健值对，当有状态改变时，会通知所有的用户。分布式锁也会用到一致性算法。

        zookeeper 是hadoop家族的一员，正如libkafka始于Linkedin。
