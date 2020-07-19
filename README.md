# Flutter UI Designs

## Features

<dl>
  <dt>UI Scaling</dt>
  <dd>Scales UI on any size of device wether it be tablet, small screen mobile, phablet or desktop screen.</dd>

  <dt>True Cross Platform</dt>
  <dd>Just download the <a href="#downloads">app</a> for your OS and run it without installing any dependencies.</dd>

  <dt>Offline-first</dt>
  <dd>Run app without an internet connection. All assets are saved locally.</dd>
  
  <dt>Simple UI</dt>
  <dd>Just simple and straight forward UI.</dd>

  <dt>Modularized Structure</dt>
  <dd>Helps maintain a readable code, easy to fix and more room to add new features.</dd>

  <dt>Open Source</dt>
  <dd>Any piece of code is free to use anywhere except UI Designs you've to ask permission from relevant designers. Designer's information can be found in app.</dd>
</dl>

## Requirements to run locally

> Just in case if you ran into errors make sure you're using correct flutter & dart version. In order to support desktop build master branch is a requirement & Master branch is not stable so breaking changes happen very often.

> A formal warning. In order to compile app properly on your machine you'll need to switch master channel with exact revision. By doing so the process will delete any previous stable/beta flutter/dart sdk. Thank you <a href="https://github.com/3mrdev" target="_3mrdev">@3mrdev</a> for letting me know of this issue. I'll look into the fvm or any other version manger when I get more free time to spend on it.

> I did spent some time to integrate <a href="https://github.com/leoafarias/fvm">FVM</a> in `Windows` but I ran into some sorts of errors. After spending some hours to solve the issue & not getting any success I parked the idea on side as currently using master branch directly is much easier & stable solution.

- Flutter master channel & Framework • revision `4df8fdb7df`
  - Run `flutter --version` to check it
- Dart VM version: 2.7.1
  - Run `dart --version` to check it
- Follow these step to use correct revision version
  - Run `cd \$FLUTTER_HOME` (or the path where your flutter is installed)
  - Run `git checkout master`
  - Run `git checkout 4df8fdb7df`
- To enable desktop & web builds run the relevant command
  - Run `flutter --enable-web`
  - Run `flutter --enable-macos-desktop`
  - Run `flutter --enable-linux-desktop`
  - Run `flutter --enable-windows-desktop`
- Run `flutter doctor` this command will show you what dependencies you need to install.

## Getting started with code

> Please note that this project's code is not meant for beginners! If you're just getting started with flutter I recommend you to explore some ToDo and basic setState apps and get yourself familiar with flutter and dart eco-system because in this project intermediate and advance implementations are use which will confuse you and won't help much in terms of learning.

- There are 2 entry files for this project `main.dart` & `main.mobile.dart`. It was necessary because I'm using Firebase analytics and crashlytics and there isn't desktop support for Firebase yet.
- `Navigator.dart` is responsible for managing routes, handles custom transition, pass parameter in screens and control navigation with keyboard shortcuts.
- `UI.dart` provides constant for building responsive UI.
- `blocs/` Initially I was going to implement Rest APIs but that seemed unnecessary & a lot of work So I'll probably remove `blocs/` in future.
- `configs/AppDimensions.dart` this is the magical file. It provides the app with:
  - My custom size unit based on device's width, height & pixel density.
  - Responsive containers.
  - Padding multiplier unit (I learned it with experience instead of using 1,2,3px should use multiplier. it helps maintain constancy around the app).
- `Widgets/Screen.dart` This widget is necessary when building a new screen.
  - configure theme & font style.
  - You can show popUps. `final screenKey = GlobalKey<ScreenState>();` & `this.screenKey.showPopUp(message: "your message");`
  - It also receive a `belowBuilder` parameter which builds custom background (This enables us to build Parallax, Animated background & Any thing you could imagine in background). you can find an example in `Screens/Download/Download.dart`
- Code structure is pretty much simple.
  - Don't import anything form ScreenA in ScreenB.
  - Don't import anything from Screen/Widget in universal files.
  - Don't import anything from ScreenA specific Widget in universal files.
  - Each Screen will have `Dimensions.dart` where you can write Screen's responsive logic.
  - I didn't use snake_case in naming convention just because I don't prefer it.
  - I use `this` for class's properties & methods I helps keep track of variables & functions.

## Scripts

> Just run `npm run setup` once

- `scripts/upload.js`
  - `npm run upload platform` // platforms: [apk, windows, linux, macos]
  - This script will upload the release build to your firebase storage
  - I intended to integrate this script with github actions but the use account access key was visible on logs that's why I stick with github-release downloads.
- `scripts/runAlliOS.js`
  - Need work currently not a priority.
- `vslaunch.js`
  - `npm run vslaunch`
  - This script will make vscode configuration file with all of your connected devices.
  - You can live debug app on multiple devices at once from vs code.
  - Each device's debug logs on separate **DEBUG CONSOLE**.
  - Very useful for testing UI for multiple devices simultaneously.

## Show support

> **If you like the project and want to appreciate my effort. Then please perform any of these steps :)**

- Star this repository.
- Rate the app on <a href="https://play.google.com/store/apps/details?id=com.onemdev.flutter_ui_challenges" target="_playstore">Play Store</a>.
- Endorse my skills on my <a href="https://www.linkedin.com/in/hackerhgl" target="linkedin">linkedin Profile</a>.
- Favorite my gigs on <a href="https://www.fiverr.com/hackerhgl" target="fiver">Fiverr</a>.
- Give a recommendation on <a href="https://www.freelancer.com/u/hackerhgl" target="freelance">Freelancer</a>.

## Download

<div id="downloads">
  <a href="https://play.google.com/store/apps/details?id=com.onemdev.flutter_ui_challenges">
    <img src="https://raw.githubusercontent.com/hackerhgl/flutter-ui-designs/master/.github/assets/google-play.png" alt="Play Store badge" width="200" />
  </a>
  <a href="https://github.com/hackerhgl/flutter-ui-designs/releases/latest/download/app-release.apk">
    <img src="https://raw.githubusercontent.com/hackerhgl/flutter-ui-designs/master/.github/assets/android.png" alt="Android badge" width="200" />
  </a>
  <a href="https://github.com/hackerhgl/flutter-ui-designs/releases/latest/download/windows-release.zip">
    <img src="https://raw.githubusercontent.com/hackerhgl/flutter-ui-designs/master/.github/assets/windows.png" alt="Windows badge" width="200" />
  </a>
  <a href="https://github.com/hackerhgl/flutter-ui-designs/releases/latest/download/macos-release.zip">
    <img src="https://raw.githubusercontent.com/hackerhgl/flutter-ui-designs/master/.github/assets/macos.png" alt="MacOS badge"  width="200" />
  </a>
  <a href="https://github.com/hackerhgl/flutter-ui-designs/releases/latest/download/linux-release.zip">
    <img src="https://raw.githubusercontent.com/hackerhgl/flutter-ui-designs/master/.github/assets/linux.png" alt="Linux badge"  width="200"/>
  </a>
</div>

## License

This project is licensed under the MIT license, Copyright (c) 2020 Hamza Iqbal. For more information see `LICENSE.md`.
