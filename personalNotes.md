# This file has very little to nothing actual with code but my personal experience of coming to the solutions after hours of research & testing.

---

## 09:08AM GMT+5 august-09-2020.

> So I've been trying to run test driver on android devices for almost 3 days & was just able to solve it a few minutes ago.
> I was about to implement a very horrible solution which could've made my life a living hell.

### Some technical reasons:

- My main reason to implement test driver was to take screenshots of every supported platform via github actions.
- That would help me see state of every integrated screen.
- I can showcase key screens on github readme which I don't have update by myself every time.
- Now I successfully integrated the complete test driver with screenshot flow for windows app.
- But when I get started on android it didn't worked & got the `taking too much time on load` error.
- I got the idea that something is blocking the rendering that's why driver wasn't able to find widgets by keys.
- So I started stripping the `app_test.dart` to only bare chunk testing.
- But only if development was that easy.
- Then I started stripping `app.dart` to basic boilerplate which we mostly see in examples.
- Again only if development was that easy.
- Then I thought it may have something to do with flutter sdk version.
- But that didn't worked either.
- Then I thought some thing in the realm of native android is causing that.
- I upgraded gradle, buildSdkVersion & native libraries. But still no success.
- It came to my mind that may be native firebase or crashlytics could be the hidden cause of conflict.
- So I built a new basic project & added test deriver & added so basic taps & it worked.
- Now I my doubt was strong but not that much confirmed.
- I added the basic app & test to my app which was bundled with firebase or crashlytics. It worked.
- My doubt was clear that those libraries aren't the cause of error. Theres something in my dart which is working weird in android.
- So I started stripping down my `Navigator.dart` to just `Material(home: HomeScreen())` & boom it worked.
- Now it's confirmed that `Navigator.dart` is the home of hidden error.
- I started adding code back chunk by chunk in `Navigator.dart` & found out the cause.
- Error was produced when I attached my `AppLocalizations.delegate`.
- I started adding logs & stripping code in `AppLocalizations.dart`. Found `AppLocalizations.load()` was the issue.
- In android app couldn't get past `rootBundle.loadString()`.
- In this <a href="https://github.com/flutter/flutter/issues/24703" target="_link6">github issue</a> it mentions that `loadString()` use `compute()` method. which basically spawns a new isolate(sort of new thread in dart).
- According to the theory I came up in this journey is App basically runs as isolate & when the app spawns a new isolate then it cause some sync conflict with driver as driver is connected to main isolate (the App) & isn't aware of the existence or depends on any other isolates spawn by app.
- Now changing `rootBundle.loadString()` to `rootBundle.load()` & doing my custom parsing did solve the issue.
- It all could've been avoided if documentation had notes about it.
- If you're wondering why It worked on windows & linux not on android my theory is in desktop environment `compute()` must've done operation so fast that It didn't left the main isolate hanging because native desktop apps running on OS are way faster than android app running on device or emulator.
- Or another theory is that's how code behave differently on `x86/x64` & `arm32/arm64`.

---

## 10:49AM GMT+5 july-31-2020.

> So I was about to giving up the whole automate testing with full window screenshots idea for desktop apps.
> Because I wasn't getting anywhere with it & results for problems were very bad or not very clear.

### Some technical reasons:

- Couldn't find any native cli command for windows to capture screenshot.
- Then decided to compile my own small cross platform <a href="https://github.com/hackerhgl/go-cross-screenshot" target="_link1">go-lang library</a> so i don't have to waste my time again for mac & linux. Github actions is integrated so I don't have to compile for all OS by my self & can run binary without go lang dependency.
- Now it was time to fight the real monster maximize windows frame via cli.
- Again Couldn't find any native cli command for windows to maximize running app. There were native solutions to maximize.
- After searching I found 2 solutions <a href="https://stackoverflow.com/a/42704274" target="_link2">windowMode.bat</a> & <a href="https://ritchielawrence.github.io/cmdow/" target="_link3">CMDOW</a>.
- Few hours before success I was looking to attach test driver to an up & running app instance.
- I was able to found two outdated articles on medium <a href="https://medium.com/flutter-community/blazingly-fast-flutter-driver-tests-5e375c833aa" target="_link4">Blazingly Fast Flutter Driver Tests</a> & <a href="https://medium.com/flutter-community/hot-reload-for-flutter-integration-tests-e0478b63bd54" target="_link5">Hot Reload For Flutter Integration Tests</a>.
- NGL before these articles I totally lost the hope of integrating my idea of maximize app with full screenshot.
- But in `Hot Reload For Flutter Integration Tests` article author use ENV variable to save the connection port so later it can be passed to test driver.
  - Now I had a crazy idea in my mind.
  - How about I make a dart wrapper script.
  - Which will run an debuggable app instance.
  - When app is up and running I could maximize the window fram then attach the test driver.
  - But BS between `powershell` & `cmd` I had very hard time testing SHARED variable thing.
  - I tried loads of methods like `[PS] $env:KEY=VALUE`, `[PS] SET KEY VALUE`, `[CMD] SET KEY=VALUE` & `SETX \M KEY VALUE` in dart script, `powershell` & `cmd`.
  - But after hours of testing & not getting a good result I throw the variable sharing idea.
- Now I started tweaking `test_driver/app_test.dart` file again if I could some how make it run by adding `delays` in between or before execution.
- Then next day in the morning I started testing a mix of solutions form both articles with updated arguments & stuff.
- In between my testing I get this error `Error: Not found: 'dart:ui'` & some thing `not-nullable` & `int?` (I can't remember exact stack trace can't find the old one) like this error.
- Now this `int?` keyword hits me because I was using latest dart sdk `2.8.4` & this version supported `?` nullable safety.
- Now I had doubts of having 2 dart instances on my machine.
- After checking the dart which was bundled with flutter SDK was using dart `2.9.0-21.0.dev.flutter-9dca49e71e`.
- Version so after removing my system installed dart `2.8.4` I was able to run my code.
- But still my tweaks didn't work.
- Then again new idea came to my mind instead of attaching test driver with an already running app instance.
- How about I maximize window frame just before my `flutter drive` process attach the test driver.
- That's how I came up with currently integrated solution of maximize app instance in `test_driver/app.dart` before `app.main()` is called with safety delay.
- If you read this far you must be wondering I could've just start with this solution saved some 2 days worth of work. But the thing that's how most programmers learn. Implementing a real world solution is not as easy like going through the index of a book to find a page number with written solution & not to mention the un valuable experience you gain from these small stressful journeys like. I learned about ENV variables in windows for `CMD` & `PS`.
- I hope this poorly written experience can help you in any way.
- windowMode.bat
  - It's is good solution very minimal low size, self compile & required .Net dependency which is already installed to build flutter windows.
  - But it didn't worked well with title argument for some reason.
  - Pid was working solid but in order to get PID I needed to attach test driver with app instance & doing so was messing up test.
- CMDOW
  - Calling this binary without any argument prints the list of all running process with their unique HEX, PID, source & title.
  - Now this solution needed a title or unique HEX in order to maximize a window frame.
  - So I run thing command via dart process class which gave me this unfiltered list.
  - After some parsing I could get the unique HEX & was able to maximize the window frame.
