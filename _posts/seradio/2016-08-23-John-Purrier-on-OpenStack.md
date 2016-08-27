---
layout: post
title: "John-Purrier-on-OpenStack"
date: 2016-08-27
category: "seradio" 
tags: [distributed system]
---
### OpenStack:
    Open source cloud os.
    John Purrier is founder of OpenStack, and CTO of otomic software, drive the organization's automation strategy.
more than 20years IT industry leadership experience.
CTO of centroy link innovation lab.
multicloud interoperability and devops.
microsoft exchange server
lead R&D of Rackspace cloud

### Openstack is an opensource infrastructure as a platform(IAAS).
    original founder: Rackspace and Nasa
    2 original project: compute project and object storage project.
    In last 6 years, the scope and number of projects have grown well beyond that vision.

Instead of going out and buy your own computers, finding a building, getting a lease, hooking a power and running a datacenter. 

Public cloud: Amazon, Azure and Google cloud
Renting servers from somebody else.

### Why we need any open source version of any priperatary implementations
1. Good for industry and ecosystem
2. Cloud is very collabative. Many companys come together to collabatively build a project is very powerful.
Very few companies in the world today could launch and sustain a project as large as openstack today.
over 30,000  members of openstack foundtation contribute to bettlements of the software.

### Several hundreds of companies use openstack in one form and another 
Walmart in their datacenter to build their e-commerce system
CERN: the research laboratory,  the large scale collider over swissland
they show their usecases in the openstack design summit, demonstrated how they doing large scale deployment of Openstack.

>The name CERN is derived from the acronym for the French "Conseil Européen pour la Recherche Nucléaire", or European Council for Nucle
>ar Research, a provisional body founded in 1952 with the mandate of establishing a world-class fundamental physics research organization 
>in Europe. At that time, pure physics research concentrated on understanding the inside of the atom, hence the word "nuclear".

About 15 years ago, this idea of virtualizing servers grow, A single PC, a hyperviser on it, abstracts the underlying hardware, presents the ability to run multiple stacks of software, run OSs independently.

What's the relationship of hypervisor and the hardware on top of it. 
    Hypervisor knows the CPU, storage system, network, essentially, creates driver level end points, can be accessed by a variety of virtual machines.
    VM looks and act like virtual machines. have virtualized drivers, provides the same services the physical machine will do in terms of access to cpus, data storage and networks, etc.
    **A translation layer between the virtualized environment and physical hardware.**

Openstack takes a collections of hypervisors that spared across a data center, or multiple data centers. Ant it turns the collection of hypervisors into a shared pool of resources.
**Cloud is a automation layer of virtual machines.**

## Cloud history
20 years ago, client-server architectures,
15 years ago, rise of virtualization
10 years, most serious competition shops have virtualized. But that didn't solve the problem of delivering to the organization.
developer request a VM, a group of VMs, have to go to submitted a ticket, go to console or cmd line, create the resources, send a email back, this could take several days.

10 years ago, Amazon started Amazon webservices, key services at the time was EC2.
EC2 was automated way to get the VMs instantly. this was very revolusionary
Openstack and cloud software provide that level of automation over the top of virtualization.


The real world is messy. Openstack provides a abstracted interface over the top of the messiness, and manages the complexity underneath.

Bare mental box is a box without hypervisor.

### What would keep me from running a openstack cross a huge cluster of REST api? 
hot of docker and container, containers much lightweight than VM. 
Openshift, cloud foundary, all of the systems run containerized systems. 

Docker and containerized system: platform as a service. 
rebuild the tools: monitoring system, health check, etc. 

schedulers are more intelligent as well.

### 2 main goal of openstack is scalability and elastisity.
What's the difference: 
   scale: get the resouces on demand.  Add the resources on demand.  Massively scalable
   elastisity: you want to grow, you also want the shrink them. very key part of cloud, scale up and down

## What's the feature that need to be optional, because it will limit the scalability and elastisity of Openstack:
    original networking option we have
    flat networking, a variety of different modes of networking you could choose. 
    software defined network: defined by Nicira which was acquired by VMware

    2 different networking systems we have.

### Everything in the openstack should be asynchoronous according to design tenants. why asynchronsity so important?

synchronous -> contension -> blockage -> performance goes down. It's all about throughput, maintaining performace uptime, and scale

### Openstack also emphasis a shared nothing archtecture, 
    a trunk a memory, a trunk of disk to maintain the state. That's become problematic when you have VMs that called phymarial
    VM can disappear, it can go away at any time though you have to architecture your system such that it's okay if VM go away. 
    If you using shared state, and depend on this VM to maintain the view of the world, ant it goes away, that's a problem. 
    To get around of this, you use things like message buses. Everybody communicate through a message bus.  You can subscribe to a certain events, you see state changes and things like that, each VM have his own view of the world. It operate on that view independently to everybody else's view.

### Why shared state would be dangerous? example of application bug

    Object storage system internal, 
    They have a centralized database, distress, your scale was impacted, the more people talk to your system, the more contension to the shared resources, the worse you going to be.
    rebuild the system, now it's called swift. 

### Eventual Consistency:
    Key concept for large scale distributed systems. 
    A storage system, 10,000 distress, some object storage systems do redundant copies, if a drive go away, 2 other copies can recover it. 
    We have latencies in the system, have delays in the system, a program looking at a particular storage, another program might be geographically disverse, but on the other side of the replication topology in the storage system, at any of the time, they both think they are looking at the file through, but at some amount of time before the replication occurs is not the same on both side. 
    we need to accept the fact, in some time windows, program A and B will be in different results quering what they think it's the same storage object. 

### Openstack has some degree of unable consistency.

    The tighter you bring the consistency requirement, you are tradeoff the resilliency, you can make a system entirely consistent, 

### How openstack community works?
    Version control, code review, test automation, 
    if you don't play by the rules, you just can't affect the community. 
    a very high level of communication, and the ability to get your voice heard. 
Testing:
    Have to start up with a policy, a set of process rules, when you checkin code, you checkin tests with it. you will not pass the code review, you there is no tests. 


## 在这一集中，John Purrier回答了很多问题:
1. 为什么需要一个开源的云计算系统，对行业和生态系统有好处，同时cloud需要合作，许多公司一起合作构建一个项目。当今世界很少有公司能够管理维护Openstack这种大项目。目前有超过30，000个成员为Openstack贡献代码。
2. 运用Openstack的例子，沃尔玛在其电子商务数字中心用Openstack，CERN，大规模原子碰撞中心也用Openstack。他们都在最近的Openstack summit上演示了他们的案例。
3. Hypervisor和硬件之间的关系， Hypervisor管理着CPU，存储资源和网络，本质上，它创建虚拟机可以访问的驱动级实例；虚拟机有虚拟的驱动，和物理机器一样，提供同样的服务（CPU，存储和网络）。
总之，Hypervisor是虚拟环境和物理硬件之间的翻译layer。Openstack利用在一个数据中心，或者多个数据中心之上的hypervisor来将所有的资源当作一个资源池来管理。 Cloud是虚拟机之上的自动化层。

4. Cloud历史
20年以前出现client-server架构，15年之前出现虚拟化，10年以前，虚拟机已经非常普遍，开发者如果需要VM，需要提交一个ticket，然后通过终端或者命令行分配资源，收到一封email，说明VM创建成功，这个过程可能需要几天时间。 10年以前，Amazon开始了Amazon webservice，当初关键的服务是EC2，EC2的功能是能够通过自动化的方式立即提供VM资源，这种方式具有颠覆性。Openstack和Cloud software都是在虚拟化的基础上提供这种自动化服务。
5. Docker和containerized system是一种PAAS。
6.解释一下openstack的scalability和elasticity：Scalability意思是能够根据需求获得资源，需要多少就能得到多少。elasticity意思是你不仅要能scale，而且还要能够收缩，能伸能缩。
7. 有没有一个feature，因为会影响到scalability和elasiticity，需要使其optional，而不是默认的配置：flat networking和software defined network。openstack 的SDN由Nicira提出，这个公司被Vmware收购。
8. Openstack采用异步通信，因为同步导致竞争，阻塞，性能下降。
9. Openstack同时强调一种shared nothing architecture
因为虚拟机会消亡，所以不能将全局数据存放在VM里，所以采用message-bus，每个组件都通过message bus通信，如果你对某一事件感兴趣，可以注册。每一个VM有自己的view，每一个VM根据自己的view独立操作。
10. 为什么共享状态危险，举个例子：以前对象存储系统采用centralized database，当你scale的时候就会有问题，越多人尝试访问，共享资源越多的产生contension，系统越遭，后来重构了系统，取名swift。
11. **Eventual Consisitency(最终一致性)**：分布式系统的重要概念，比如一个存储系统，对象存储系统要做多个备份。如果一个磁盘坏了，另外2个可以重新恢复它。但是在系统中有延时，比如一个程序在访问一个特定的存储，另一个在地理上不同的地方访问这个数据的备份，他们都认为自己在访问同一个文件，但是在某一个时刻，因为replication不是在同一时刻在几个备份的地方同时发生，所以在某一个时间窗口，程序A和B读到的数据可能不一样，但是他们都认为是从同一个文件读出来的。

## 名词定义
>最终一致性实际上是一种弱一致性，为了提高高可用性而引入。这种方式非正式保证：如果对数据没有新的更新，最终，所有对这个数据的访问将返回最后更新过的值。一个达到最终一致性的系统通常被称为是converged(收敛)或者达到replica convergence(副本收敛).
>   最终一致性通常用BASE区分（Basically Available, Soft state, Eventual Consistency), 可以跟ACID(Atomic, Consistency, Isolation, Durability)做比较。
>
>Linearizability(严格一致性 strict/atomic Consistency）：读出的数据始终为最近写入的数据。这种一致性只有全局时钟存在时才有可能，在分布式网络环境不可能实现。

