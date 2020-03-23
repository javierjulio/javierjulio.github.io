---
layout: post
title:  "Git tagging a forked Ruby gem project for Bundler"
date:   2011-12-06
redirect_from: /2011/12/06/git-tagging-a-forked-ruby-gem-project-for-bundler/
---

If you ever have to customize or patch a Ruby gem and you are using [Bundler](https://bundler.io), its a good idea when forking that project to create a branch and then tag new releases.

I found this out recently as I used and patched two Ruby gems, [databasedotcom](https://github.com/javierjulio/databasedotcom) and [salesforce_bulk](https://github.com/javierjulio/salesforce_bulk), to sync data to Salesforce for reporting. I ran into showstoppers with both but luckily they are hosted on [GitHub](https://github.com/) so I was able to fork them and make the necessary changes to resolve the issues I encountered while being able to contribute those changes back.

The project `Gemfile` was updated with my two forked git branches and then I ran `bundle install`. While Bundler does support specifying a git branch I found that as I made further code updates and would run `bundle install` again, Bundler wouldn't download those changes. I figured out that I should be tagging releases of that branch instead as that would require the `Gemfile` to be updated with a new tag name. After that running `bundle install` would download the latest changes I made.
