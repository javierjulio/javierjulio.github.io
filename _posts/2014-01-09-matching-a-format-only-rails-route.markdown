---
layout: post
title:  "Matching a format only Rails route"
date:   2014-01-09
redirect_from: /2014/01/09/matching-a-format-only-rails-route/
---

On a recent project I noticed several errors for an invalid route requested by a search bot where the URL looked something like:

    /people/123706399_571n.jpg

which in turn triggered the people show route that looks for:

    /people/123-full-name

Since the parsed value 123706399_571n isn't a valid person id we'd be receiving about 4-5 daily errors in Airbrake.

I figured this should be easy enough to fix with a one line redirect in the routes config that after a week or so I could remove as the search bot would have picked up the redirect by then. Since the invalid URL is matching the people show route, I just duplicated that and added the necessary format specific properties below:

    get 'people/:id',
      format: true,
      constraints: { format: /(jpg|jpeg)/ },
      to: redirect("/people")

    get 'people/:id' => 'people#show'

At first I just had the constraints hash since from my understanding I thought that was all that was needed. Testing proved otherwise as even a valid request for a person detail page would result in a redirect when it shouldn't. The reason is that [Rails will match both versions of the route](https://github.com/rails/rails/issues/5548#issuecomment-5806078), one with the format and the other without (which is the default) despite setting the format constraints. To avoid the behavior of the default route match we also set `format: true` so the redirect route is only applied if the URL has a jpg format.
