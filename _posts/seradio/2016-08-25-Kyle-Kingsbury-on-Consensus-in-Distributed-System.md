---
layout: post
title: "Kyle Kingsbury on Consensus in Distributed System"
date: 2016-09-02
category: "seradio" 
tags: [distributed system]
---
Database consistency

Become famous because his tendency to break databases, that is to use regression testing to show how they deal with various area senarioes. 
theory and practice of database handling failure. 

whether or not distributed systems caches databases, queues, that's type of thing. 

consistency problem:

they don't measure if the system is actually safe. 
oracle, DB2, Mysql, postgres

Test method:
Write a new record to a dataset, at the same time, make a query against the table. The query should see the new record, but it's not, because it's predict 


Qualify different levels of safety.

not sure which transactions, which patterns of access to the database, 

cap theorem:
    consistency: linearizability, 
    availability: every request to a nofailed node must succeed.
    partition tolerance: 
    you can only have 2 of 3. 



Read a value, write to a table, incrementing a number, set 3 fields once given a record. those all through transactions. 
In practice, different kinds of transactions work concurrently. 
Some read data, some write data at the same time. what we want is operations take place in some kind of order.
1 transaction take place first, there are lots ways those transactions can be ordered. 
consistency model is the class of ordering of those events, CAP tell us about a particular consistency model. 
just like SQL tell us certain allowed models like read committed, they prohibit certain classes of orders, 
for example: reading the result of another transaction right until your transaction is commited. 
you may get snapshot isolation where all your snapshot isolation take place at some atomic snapshot of the world that 
occurs at some logical time just before you commit. 

Those consistency class can only be achieved in certain availability models. 
Different theorems tell us about which classes are achieveable in which availability settings, 
CAP tell us one of the strongest class of consistency. The one which allows least number of orderings. 
not least, but we know a small number. 
CAP tells linearizability, which is a very strict ordering. linearized system can not made fully available.  

If you build linearized system, and experience network partition, a communication failure between nodes, 
it's possable for transactions to stall for ever, or transactions to be incomplete, 
you have to deadlock and give up certaion operations. 



Partition tolerance:

The system should be resilient/continue to function in the event of messages not delivered. 
which happens in production everytime, Microsoft report a paper in the syscom serveral years ago. 
they measured the database packet loss, they have lot of machines, lot of routers, 

A partition can occur because of many reasons, for example, a newwork is down, 
or some other problem along the way for some reason, the message doesn't arrive at the node it suppose to. 
is that what about? yeah, exactly. it could be a delay. 
If I can arbitrarily delay message, I can outweight you as a software system. 


If you have a partition, you must use AP or CP. There is no CA, because no system doesn't run partitions anytime. 

AP databases offer you availability first for most, you can make request in any node, 
you can make write, read, update, query, what ever you want do to any node is fine. 
how available in a single datacenter. Candidates for distributed systems geographical replicated. 
because you can write independently in any datacenter and low latency as a result. It's one of the property. 


consistency: writes follow reads, if you read a given value you write in is logicall successor of that. 
you get monotonic reads, if you reads 2 things in a session, they happen sequentially, 
monotonic writes, we write follow a write. you get recommited 


AP system: don't have 100% consistency, made some tradeoff of consistency. 
It's not fractional consistency, you system is completely safe if it's based on certain rules. 
CRDT: Convergent Replicated Data types

Cassandra: you might write a value, but somebody may not see it for a while until data replicated over. 
    you should be okay allowing more histories.  Wider windows of concurrency in your system. 

DynamoDB: paper dynamo from Amazon, voltDB


CP: majority of your systems and nodes connected. if you're in the minority island, single node, isolated, 
you give up the ability to do some or all operations, you may get reduced set of operations, read data, 
but not gurantee it's recent anymore. Common one: ZooKeeper, etcd, fundatation DB, 
sequential consistency: every process see the same ordering. that is not totally available. 


Let's add a bunch of numbers to the set, to read the set, and if all the data we inserted is good. 
which database you pick, how you build that? 
23 minutes


I want to build a experimental harness to measure whether those theorems have measurable real consequences.
how do the verification thing? 
Riak

MongoDB:
blog post
Postgress: subtle but not terrifically scary phenomenen. false negatives, not partition tolerant, it will stall forever. The transaction could fail, but it's succeed actually, the response got losted. 
Redis: completely disaster, numerous race condition and issues with safety. 
MongoDB: lost data every consistent 2 level. not save 
Riak: 
Zookeeper: datastore for particular purpose, semi-linearizable writes and possiblly stalll reads, distributed state machines. 
NuoDB:
    block forever, until memory is expoloded, fine if your volume is sufficiently low. but also stall all your clients. during partition.
Kafka:
    replication design document, zookeeper is a good choice keeping your cluster member state. 
    if the node crash, the cluster will have a election, and select another node. no knowledge of the single node. 
Cassandra:
    introduced transaction systems, it will deadlock, hard, lose data. 
RabbitMQ: 
consul
etcd:
    small in memory datasets. raft protocol. Consistent updates/reads did not check to make sure the leader they were talking to was still the 
    leader at the end of their operation. 
Elastic search:
    disaster, 

change engineering culture, more failure mode aware in the future, they need to get the database outdoor quickly to build atraction to the market. we gonna do less safe thing, people won't notice until later by the time we can fix it. 

40 minutes
    

none database is suitable for all problems. 
availability of expertises, can you afford license fees. 
zookeeper's api is complicated. complicated connection model. 
etcd have very good api. 


closure 
jabson

paxos
    agreements on certain decisions

    raft

    zap

    linearizability

    once operation complete, it is visible. every operation will take place between the time you send the message, starting it, and when you getresults, hey it's done. 

    sequencial consistency:
        you nolonger get realtime garantee. you get meesage said hey, it's done, but can logically take effect later. 
    recommited:
acm queue
