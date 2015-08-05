---
layout: post
title:  "Avoiding sudo when installing command line tools from source"
date:   2011-11-29
redirect_from: /2011/11/29/avoiding-sudo-when-installing-command-line-tools/
---

Recently, I came across [an excellent and detailed Node.js installation post](http://increaseyourgeek.wordpress.com/2010/08/18/install-node-js-without-using-sudo/) that caught my attention since it focused on how to avoid using `sudo`. The "Long Version" part proved most helped as it goes into detail on the what and why of every action you perform. A great read if command line isn't your strongest area.

I realized a lot of what was discussed I had done earlier for installing the excellent [rbenv tool](https://github.com/sstephenson/rbenv) so I deviated a little from the instructions by installing Node.js into a hidden folder in my home directory (e.g. `~/.node`) and then updating my path in my `~/.bash_profile` file. That last step I had to change to the following:

	$ echo 'export PATH="$HOME/.node/bin:$PATH"' >> ~/.bash_profile

I've grown used to installing from source lately where in the past I wouldn't have but with enough of the projects I'm interested being hosted on GitHub (which I love) the workflow I know well and remains consistent so it makes sense. Its worth the effort rather than installing from a third party like Homebrew where it might not have the latest version (which I encountered when attempting to install Node.js).

For some of you this might seem trivial but a lot of this I didn't take the time to understand. Now though I know the difference that by installing into my home directory I can avoid using `sudo` and take control of the tools I depend on.
