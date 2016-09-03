---
layout: post
title: "Leslie Lamport"
date: 2016-09-04
category: "seradio" 
tags: [poxos]
---
Turing award for his recent work in distributed system as well as document writing and formating tool LaTeX.
Recently, Leslie has been focus on TLA. stands for Temporal Logic of Actions.
TLA+ is a specification language which is especially well suited for for writing concurrent and distributed systems

How do you defined distributed system?
Multi-processing system, the time required for inter-process communication is large compared to the time between events in a single processor.
in other words, it takes processor a lot longer to exchange messages with another porcessor than it does to access it's own memory.
That's the definition I made 30-40 years ago. 

Nowadays, DS have a voe mean systems which processors communicate by sending messages, 
formalism:
    specify and reasoning about a distributed system. which is no different from how you go reasoning or specifying any other concurrent system.

What let you do think about DS?
    When I received a technical report by Johnson and Tomas, the one that cited in my Time-Clock paper, I don't remember the title of the report, but I know it's something about distributed databases. The first paper or thought I had for distributed system I can remember. 
The  paper itself will lead to time-clock paper.  I observed that something not quite right in the way they have done things. in particular, the algorithm they used have the effect of allowing a vilation of cousality. that is event A cousally affect event B. yet in Their algorithm, event B could process before event A. The whole idea of the problem of that notion cousality came about because of my familiarity of special relativity. It was totally obvious to me looking at what was going on. that it was completely analogous to the situation in special relativity. 
Cousality have to do whether or not one event could causaly affect another depended on whether or not information from one could physically reach the other because of the finate speed of transimission of light. Put a little conherently, special relativity, one event proceeded in another, if we possible to transmit information from the 1st event to the 2nd event using beams of light. 
The corresponding concept in distributed system  is one event proceeded in another event if we possible to let information flow from event A to event B by messages sent to the system. 

It lead to logical clocks, some people call it Lamport clock. which was different with vector clock, I don't remember invented by who. developed not long after my time-clock paper. 
The effect of that paper have 2 fold: 
    * Got me to think causility in distributed systems.  which the time-clock paper was noted for. 
    * The algorithm I came up with which was a modification of the one by Johnson and Tomas, applied not just to the problem they were looking at, as I recall, is distributed databases.  but apply to any system. 
    Here I not sure exactly what lead to that realization. The realization that any system can be described as a state machine.  and using the algorithm that is my adaptation of Johnson and Tomas's algorithm. One could implement an arbitrary state machine in a distributed system. 

### When I took distributed systems in college, course material was divided into 2 things. The material we study for paxos, the rest material related to paxos. the importance of paxos.
8:30





cousality: 因果性
special relativity: 狭义相对论

Dynamo paper is very interesting and discussed various concepts like vector clocks, consistent hashing etc. Is there a book or tutorial that explains these topics in more detail.
