Dependency Inversion Principle: How to define “high-level policy” and “low-level detail” to other people?
http://programmers.stackexchange.com/questions/195252/dependency-inversion-principle-how-to-define-high-level-policy-and-low-level


Think about power sockets. In any given nation, the high-level policy is that power sockets are always the same. It doesn't matter where you get you electricity from (coal, gas, nuclear), the sockets on the wall should always put out the same amount of power, through the same set of connectors.

Now you can plug any device into that socket, because they all have a common interface, the "plug". The high-level policy never has to dictate any part of that implementation detail. Just plug something in and it goes.

Now if you have a device that doesn't want AC power -- maybe it runs on a 7V DC circuit -- you can still use that high-level policy, you just need some kind of adapter between the power supply and the device. And, because everyone has the same high-level policy, the manufacturer can build that into the implementation, without any change to the high-level policy. The person connecting the implementation to the policy (you, plugging your laptop in) doesn't really need to understand either.

Further, if the manufacturer wants to sell the same device in another country, all they have to do is develop a different adapter. So the same implementation can work with multiple policies while the same policy can run multiple implementations.

This is a perfect example of dependency inversion.

But here's the interesting bit: Go back to what I first said. "It doesn't matter where you get you electricity from." This is also an implementation detail. The high-level policy is still that all power sockets are the same shape and emit the same type of power. The low-level implementation details are both where the electricity comes from and what it runs.

In programming terms, that means the high-level policy is the interface (Where a language supports it. Another form of DI is duck-typing.) that an API provides and the application consumes, and the low-level implementation details are both the application consuming it and the API itself, neither of which need to understand each other.

Adapters may be used to fit the same implementation into different policies.





## Clarify the Single Responsibility Principle



I really like the way Robert C. Martin (Uncle Bob) restates the Single Responsibility Principle (linked to PDF):

    There should never be more than one reason for a class to change

It's subtly different from the traditional "should do only one thing" definition, and I like this because it forces you to change the way you think about your class. Instead of thinking about "is this doing one thing?", you instead think about what can change and how those changes affect your class. So for example, if the database changes does your class need to change? What about if the output device changes (for example a screen, or a mobile device, or a printer)? If your class needs to change because of changes from many other directions, then that's a sign that your class has too many responsibilities.

In the linked article, Uncle Bob concludes:

    The SRP is one of the simplest of the principles, and one of the hardest to get right. Conjoining responsibilities is something that we do naturally. Finding and separating those responsibilities from one another is much of what software design is really about.



A class should do one thing when viewed at its own level of abstraction. It will doubtless do many things at a less abstract level. This is how classes work to make programs more maintainable: they hide implementation details if you don't need to examine them closely.

I use class names as a test for this. If I can't give a class a fairly short descriptive name, or if that name has a word like "And" in it, I'm probably violating the Single Responsibility Principle.

In my experience, it's easier to keep this principle at the lower levels, where things are more concrete.

