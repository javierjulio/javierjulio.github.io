---
layout: post
title:  Recovering Deleted Files From SVN
date:   2011-09-18
redirect_from: /2011/09/18/recovering-deleted-files-from-svn/
---

Recently, I had accidentally deleted a project file from SVN that was still required. Searching on how to recover it I came across different methods (mainly using svn copy) but [an example using svn merge](http://pointbeing.net/weblog/2010/02/recovering-a-deleted-file-from-subversion.html) is what worked for me. All you need is the revision number that deleted the file(s) that you want back.

The following is the command format you'll want to use:

```
$ svn merge -r [rev]:[rev-1] [file-path-or-current-dir]
```

As an example, lets say I wanted to retrieve a post I had deleted for my site and the revision number that deleted the file was 50. That would look something like this:

```
$ cd Projects/website/posts/
$ svn merge -r 50:49 .
```

If you made other changes that were part of that revision they will be retrieved but are not committed so you can modify them as you like. In my case I had deleted 2 other files so I just re-deleted them, kept the one I needed and committed my changes. The revision history for the file you retain is preserved.
