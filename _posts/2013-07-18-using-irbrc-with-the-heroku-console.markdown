---
layout: post
title:  "Using .irbrc with the Heroku Console"
date:   2013-07-18
redirect_from: /2013/07/18/using-irbrc-with-the-heroku-console/
---

As a Ruby developer having a local `.irbrc` file is really handy for specifying custom settings and method helpers to help speed up tasks when in the IRB or Rails console. I always wondered if this would also work in the Heroku console as I work in that environment all the time. I'm often checking on data, particularly delayed jobs if I've recently deployed or have to run a rake task.

I had kept forgetting to give it a try but today I added an `.irbrc` file (with the contents you see below) to a project repository and deployed to staging.

```ruby
#!/usr/bin/ruby

def q
  exit
end

def dj
  Delayed::Job
end

def djc
  Delayed::Job.count
end
```

Just as you would expect the above methods run successfully in the Heroku console. No special configuration needed. Just a normal `.irbrc` file in the root of your git project and you're all set.
