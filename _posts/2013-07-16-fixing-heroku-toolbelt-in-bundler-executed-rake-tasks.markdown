---
layout: post
title:  "Fixing Heroku Toolbelt in Bundler Executed Rake Tasks"
date:   2013-07-16
redirect_from: /2013/07/16/fixing-heroku-toolbelt-in-bundler-executed-rake-tasks/
---

If you have any rake tasks that use the `heroku` command (should be using the [Heroku Toolbelt CLI](https://devcenter.heroku.com/articles/heroku-cli) and not the Ruby gem) make sure to wrap any code with Bundler.with_clean_env which takes a block like in the example below:

```ruby
namespace :my_app do
  task :example do
    Bundler.with_clean_env do
      system "heroku version"
    end
  end
end
```

Before coming across [the solution](https://github.com/sstephenson/rbenv/issues/400#issuecomment-18744931) I ran into two different errors. The first was due to a Bundler error about a Ruby version mismatch since a project related rake task running on Ruby 2.0 but the Heroku Toolbelt uses Ruby 1.9.3. The second occurred on Tddium as it needs a post build rake task for deploying to Heroku with the error message stating that it could not find a gem (e.g. rake) in any of the sources.

If you run a rake task using Bundler (e.g. `bundle exec rake`) any subprocesses like the `heroku` command will inherit the environment variables rake creates. Perhaps running rake without Bundler might prevent any errors but you'd have to make sure your rake task doesn't depend on any of bundled gems.
