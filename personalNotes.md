# This file has very little to nothing actual with code but my personal experience of coming to the solutions after hours of research & testing.

---

## 10:49AM GMT+5 7-31-2020.

So I was about to giving up the whole automate testing with full window screenshots idea for desktop apps.
Because I wasn't getting anywhere with it & results for problems were very bad or not very clear.

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
