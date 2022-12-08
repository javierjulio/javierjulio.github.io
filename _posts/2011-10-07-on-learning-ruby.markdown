---
layout: post
title:  On Learning Ruby
date:   2011-10-07
redirect_from: /2011/10/07/on-learning-ruby/
---

Having written so much code in AS3 I wanted to learn a similar language but that was simpler. Lighter. I had my own ideas of what I'd like in a language and I've found that Ruby has several of them. A simple example that stood out for me was defining a constant. In AS3 this requires a lot of typing that I felt could be implied.

```
public static const FIRST_NAME:String = "Javier"
```

In Ruby it's no different than declaring a variable but you type the name in all caps.

```
FIRST_NAME = "Javier"
```

Short and sweet. In another example I was impressed in how expressive Ruby can be. I had been figuring out the different ways I could repeat a string when I noticed in the documentation that operators were implemented as methods. Why can't I just multiply the string by the number of times I want to repeat it? For example:

```
"Ruby! " * 5
```

And that worked as expected! Simple things like this have made learning Ruby a joy.

Although I've written [small scripts](https://github.com/javierjulio/ruby-notes) and [re-written my site](https://github.com/javierjulio/website) to learn Ruby I wanted something else that was structured. I had discovered two invaluable resources: [Ruby Koans](https://github.com/edgecase/ruby_koans) and [Learning Ruby The Hard Way](https://learncodethehardway.org/ruby/). While I'm half way through Learning Ruby The Hard Way I haven't enjoyed it as much as completing the Ruby Koans. The koans are a collection of units tests where you fill in the blanks or write scripts against pre-written unit tests. I don't remember ever learning a new language so much as I did by completing those koans. If you have any experience programming it is a great way to pick up Ruby fast.

If you have any resources you'd like to share I'd love to hear from you.
