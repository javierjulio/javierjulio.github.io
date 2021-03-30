---
layout: post
title:  "Using a Laptop Script to Install and Document Development Tools"
date:   2012-02-07
redirect_from: /2012/02/07/using-a-laptop-script-to-install-and-document-development-tools/
---

Not to long ago I read Thoughbot's excellent [Ruby guide to Mac OSX development](https://thoughtbot.com/blog/2011-rubyists-guide-to-a-mac-os-x-development) that lists all the development tools they install on their laptops. The big takeaway for me was the last step their laptop script which is just a bash script that runs various install commands for Ruby Gems and other tools. While it may seem so simple I couldn't believe I didn't think about this before. What a useful tool. This inspired me to create [my own laptop script](https://github.com/javierjulio/laptop).

You might ask "why bother?" as I wouldn't be going through laptops that often to have a need for this and you'd be right. The real motivator has always been documentation. Recently, I learned the hard way that the most important part isn't so much knowing what tools I have installed but **how** I installed them. Big difference.

This past summer I had installed Node.js when it was on version 0.4.x but didn't do much with it until this past December when Node was updated to version 0.6.7. I wanted to update but for the life of me I couldn't remember how I installed Node. Did I install using Homebrew? From source? From one of the downloadable installers? Honestly, I couldn't remember. Coming across Thoughtbot's post, I realized this wouldn't be an issue if I had with a simple shell script that would double as documentation.

I'd like to expand the script to account for tools that have been installed so as to not reinstall them or better yet to perform updates. For now though I'm pleased with it serving mainly as documentation.
