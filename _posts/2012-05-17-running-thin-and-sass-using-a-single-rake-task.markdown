---
layout: post
title:  "Running Thin and Sass using a single Rake task"
date:   2012-05-17
redirect_from: /2012/05/17/running-thin-and-sass-using-a-single-rake-task/
---

I've been working with Sass lately on the [redesigned MyFDB](https://myfdb.com) and figured would be good to learn how to implement it on my site where I use Sinatra.

Sinatra has the capability built in to process Sass but I wanted to compile the files locally so they don't have to be generated on each request. Since I'm running a Thin server I needed to run a second process but without having to open a new Terminal tab to start it. Not only is it an unnecessary extra step, I was afraid I'd forget to.

With Thin I found I can run it as a daemon and since I would be focusing on content and CSS updates, any Ruby related error output in Terminal wasn't vital. The trick is to start Thin first as a daemon and then the Sass watcher as it'll be the process that takes up that shell session. Once you quit (CTRL+C) a Rake task `server:stop` will run that terminates the Thin daemon and removes the `tmp` and `log` folders that Thin generated. Working `Rakefile`:

    require 'fileutils'

    namespace :server do

      desc "Starts the daemon Thin server and Sass watcher"
      task :processes do
        puts "Start Thin as a daemon and Sass normally"

        system "thin start -d"
        system "sass --watch assets/stylesheets:assets/stylesheets --style compressed"
      end

      desc "Stops the daemon Thin server"
      task :stop do
        file = File.open("tmp/pids/thin.pid", "rb")
        process_id = file.read

        puts "Stopping Thin server (process #{process_id})"

        system "kill #{process_id}"

        FileUtils.remove_dir("log") if File.directory? "log"
        FileUtils.remove_dir("tmp") if File.directory? "tmp"
      end

      desc "Starts server at localhost:3000 with Sass enabled"
      task :start => [:processes, :stop] do
        puts "Bye!"
      end

    end

While I learned a lot from that approach it was a bit of a waste since the Foreman gem solves this problem and makes it super easy to implement. You just specify a unique name for each command (used as identifier for any command output in Terminal) in a `Procfile`. The following is what I use for my site:

    web:  bundle exec shotgun --server=thin --port=3000
    sass: bundle exec sass --watch assets/stylesheets:assets/stylesheets --style compressed

From there I just run `foreman start` and the gem handles the rest. I started off using Thin directly but switched to the Shotgun gem (which still uses Thin) as it reloads the entire Sinatra app on every request. If you ran the app with Thin directly you'd have to restart the server anytime you make Ruby/Sinatra related changes.
