---
layout: post
title:  "Expanding TextArea with no clone or ghost element"
date:   2014-04-24
redirect_from: /2014/04/24/expanding-textarea-with-no-clone-or-ghost-element/
---

I've been working on a small project called [textarea-autosize](https://javierjulio.github.io/textarea-autosize/) for some time now that is a jQuery plugin for vertically expanding textareas through user input **without** using a clone or ghost element. The plugin is available on both [NPM](https://www.npmjs.org/package/textarea-autosize) and [Bower](https://bower.io/search/?q=textarea-autosize).

#### So why build this?

Many solutions I came across just didn't feel smooth. In some the textarea would flicker on entering new lines with a noticeable delay in resizing. Most were outdated and all were a lot bulkier than they had to be. The bulk came from needing a cloned textarea or ghost element to determine the new height after each input action.

#### A different approach

The solution I have in place relies on a property called `scrollHeight`. Whenever the textarea value changes the height of the textarea is temporarily changed to `auto` and then immediately set back to whatever the `scrollHeight` value is. This is what keeps the plugin very lightweight yet achieving the same result of an expanding textarea on input without a flicker or delay. Also the expanding can be controlled all using CSS by simply setting a `max-height`.

To learn more [try the demo on the project page](https://javierjulio.github.io/textarea-autosize/). If you encounter any issues please [submit a report](https://github.com/javierjulio/textarea-autosize/issues). Thanks!
