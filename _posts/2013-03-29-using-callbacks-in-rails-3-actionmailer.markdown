---
layout: post
title:  "Using Callbacks in Rails 3 ActionMailer"
date:   2013-03-29
redirect_from: /2013/03/29/using-callbacks-in-rails-3-actionmailer/
---

When working with ActionMailer (Rails 3) it feels so similar to how controllers work that I thought it was odd that I couldn't use callbacks such as `before_filter` or `after_filter`. While there are [drop in gems](https://thoughtbot.com/blog/delivering-all-email-from-staging-to-a-group-email) or [examples showing how to use interceptors](https://thepugautomatic.com/2012/08/abort-mail-delivery-with-rails-3-interceptors/) I figured there had to be a way to reuse callbacks.

Luckily, I came across an accepted [pull request that includes callbacks in ActionMailer](https://github.com/rails/rails/pull/5372) but only for Rails 4. After reviewing the commit its very easy to add support for Rails 3 since all we need to do is include the `AbstractController::Callbacks` module in our mailer class and from there we can define our callbacks.

The example below shows how I resolved an issue where I needed to change the recipient address for any outgoing emails when in the staging environment.

```ruby
class Mailer < ActionMailer::Base
  include AbstractController::Callbacks

  after_filter :send_to_admin_if_staging

  def send_to_admin_if_staging
    if Rails.env.staging?
      message.to = 'admin@my-app.com'
    end
  end
end
```

Besides access to `message` we also have access to `mail` in callbacks. This is useful if you prefer to [stop email delivery](https://coderwall.com/p/mwrsvw/rails-4-before_filter-and-after_filter-in-your-mailers) or perhaps change other mail settings.

```ruby
after_filter :stop_delivery_if_staging

def stop_delivery_if_staging
  if Rails.env.staging?
    mail.perform_deliveries = false
  end
end
```
