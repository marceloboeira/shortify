# Comments
> A bit about my choices along the assignment.

## **Stack**

After reading the assignment description, I thought about two main ways of implementing the project:

### 1) Minimalist
> Use as less code/gems/packages as possible, make it simple, get shit done

  Choosing this path, would lead me to use Ruby with [Cuba](https://github.com/soveran/cuba), or even [Sinatra](https://github.com/sinatra/sinatra), because of their simplicity and even performance, once they have few "abstraction" layers.
  I would also store the URLs on a key-value database, such as redis. Once it has very few requirements/abstractions, since you don't need to work with a ORM.

* PROS:
  - Easy/Fast to build (Almost a single-file application)
  - Performance (few abstraction and dependencies)
* CONS:
  - Hard to maintain/extend (very few abstractions)
  - Hard to test (it would have mostly functional tests)
  - Feels too much like a *hack*
  - Little bit unsual **[1]**

  **TL;DR** - Summing up, it seems a nice stack if you're on a hackday/hackathon, or even if you're bulding a gem/engine to be easily pluggable. It seems a cool a ideia, but for a long-term project, I think I would rather have more **support** from my tools.


### 2) Robust
> Use frameworks, ORM, long-term thinking, ...

  Choosing this path, I would probably also use Ruby **[3]**, but this time with **Rails**, because of the environment, support, stability.
  Since one of the requirements is to have an API I would also use [Grape](https://github.com/ruby-grape/grape), a powerfull micro-framework to create REST API's with Ruby.

  I think that Rails does not provide a very good support to build APIs yet. Even now with the 'rails-api' gem, there is still a lot to improve, I like to believe Rails 5 will have a better support.

  Finally, I would also use MongoDB instead of a classic relational databases **[2]**, such as PostgreSQL or MySQL, for several reasons, but the main reason is that I believe the problem, url shortening, is likely to change a lot and its important to be able to change fast. It is easy to see that it does not require a big relational schema, so, for now, I don't want to deal with relational problems, the main model would be pretty much my only one. Being 'dynamic' makes it fast to change, so it would be easy to extend the application to store access statistics of each URL, for instance.


* PROS:
  - Easy to test (each part of the problem is isolated)
  - Easy to maintain/extend (more abstraction and independecy)
  - Better environment
  - Good abstractions - (everything seems to have its place) **[4]**

* CONS:
  - Lots of dependencies
  - A bit more code/effort to start the project
  - Performance issues, if not careful (Yet may even overcome the minimalist if done correctly)

**TL;DR** - Summing up, this solution takes vantage of frameworks, libraries, abstractions, unitary tests. It is a nice stack if you're thining for a long-term project, because it takes time and some abstractions to have everyting working. This solutions 'sounds' better on my mind, so I guess at this point this is my favorite choice.

---

[1] - I have considered using [Crystal-Lang](http://github.com/crystal-lang/crystal), which I've been **studying**, yet I found that it is **too soon** to use in **production**, it has a lot of bugs and it is definitely **not stable** at this point. I didn't want to get stucked by a random bug since I have a short deadline for this project.

[2] - I **do like relational databases**, I just thought this problem is suitable for NoSql.

[3] - In both cases I've chosen **Ruby**, because it is my main language currently, I really believe on its princibles and most importantly I believe it can handle the problem. But I always try to find the best **tool for the problem**, not the other way around.

[4] - It took a long time, but now I understand the **importance** and the benneficts of **abstractions** (not over-engineering), as also the purpose of clean code principles, so I'll be always inclined to think forward. I know that we must decide things when we face the problem, still, it is nice to know that someday it may happen, to be prepared.
