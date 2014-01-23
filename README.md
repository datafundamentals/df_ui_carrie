A few notes about Carrie
====

Carrie is a demonstration project for automating some big data devops tasks such as setting up dev machines and writing automated ETL code to these same machines.

It is appropriately named after the horror movie of the same name.

In its current state it is barely started, but it should remain incomplete for it's entire life. It is not intended as anything other than exploratory proof-of-concept software.

Technology
===

The UI is built using Bootstrap and Sinatra. The generation programs are written in Ruby. Bootstrap, Ruby, and Sinatra are bran new technologies to the author of Carrie, who is a back-end Java developer. The hacky nature of the code should reflect the relative inexperience of the author.

Context of Choices by Disabled Options
====

Carrie provides a context for many of it's design decisions by showing disabled choices among those which are enabled.

When selecting options, you are shown not just the one(s) implemented within Carries, but many of the choices that we didn't yet make, by simply disabling the options within a wide set of choices. This gives you a context for understanding your options within the much broaders set of options available. 

Presumably, with enough budget, any choices that are disabled could be enabled. 

Production Code?
===

If Carrie is a relative hack, and not production code, is the code that it generates also hack level code?

This is an interesting question from a couple different perspectives.
1. Compared to what? The author has seen so much hack code declared as 'production', it does beg the question. A reasonable attempt is made to follow some standards and be above average. If improvements need to be made - it's all open source!
2. It's all consistent. Generated code has the advantage of being easier to work with than hand-written code of the same quality level. That's because it's all written the same way.
