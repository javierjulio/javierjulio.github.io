---
layout: post
title:  "Detect at runtime when XCode tests are running"
date:   2014-12-05
redirect_from: /2014/12/05/detect-at-runtime-when-xcode-tests-are-running/
---

I've been using a simple flag in Swift that detects if I'm running tests so I can modify my AppDelegate all programmatically so I can safely run the app or run tests without having to change code. For the past month or so I've been using something like the following in my AppDelegate:

    class AppDelegate: UIResponder, UIApplicationDelegate {

      func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let runningTests = (NSClassFromString("XCTest") != nil)
        // ...
      }

    }

This proved to work when running the app or tests in the simulator or building to a device.. until today. I spent hours debugging why this app I've just setup with TestFlight was crashing at the launch image. I finally learned that `runningTests` line was the culprit. I tried other alternatives like how Artsy does in their [Eidolon app](https://github.com/artsy/eidolon). I updated my code to use that approach, uploaded a new binary and installed an update through TestFlight. That update showed that the device was executing that test environment specific code although we weren't running tests, the app is in a release state.

As a last resort I ported the `isRunningTests` approach in the [objc.io Testing View Controllers article](http://www.objc.io/issue-1/testing-view-controllers.html) to Swift and included it in my app (the final code can be seen below). Thankfully after uploading the binary and installing the app from TestFlight it proved successful.

    class AppDelegate: UIResponder, UIApplicationDelegate {

      func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if isRunningTests() {
          // ..
        }
      }

      func isRunningTests() -> Bool {
        let environment = NSProcessInfo.processInfo().environment
        let injectBundle = environment["XCInjectBundle"] as String?
        return (injectBundle?.pathExtension == "xctest")
      }

    }

I've seen approaches on changing build settings. I wasn't familiar with the differences in developing, building and releasing so I wanted a simple code only solution. Luckily this worked great. Be careful if using NSClassFromString in this case (releasing an app) and probably best to avoid it.
