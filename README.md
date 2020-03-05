# Flutter UI Designs

## Features

<dl>
  <dt>UI Scaling</dt>
  <dd>Scales UI on any size of device wether it be tablet, small screen mobile, phablet or desktop screen.</dd>

  <dt>True Cross Platform</dt>
  <dd>Just download the <a href="#downloads">app</a> from for your OS and run it without installing any dependencies.</dd>

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

> Just in case if you ran into errors make sure your'e using correct flutter & dart version. In order to support desktop build master branch is a requirement & Master branch is not stable so breaking changes happen very often.

- Flutter master channel & Framework • revision `4df8fdb7df`
  - Run `flutter --version` to check it
- Dart VM version: 2.7.1
  - Run `dart --version` to check it
- Follow these step to use correct revision version
  - cd \$FLUTTER_HOME (path where your flutter is installed)
  - git checkout master
  - git checkout `4df8fdb7df`
- To enable dekstop & web builds run these commands
  - flutter --enable-web
  - flutter --enable-macos-desktop
  - flutter --enable-linux-desktop
  - flutter --enable-windows-desktop
- Run `flutter doctor` this command will show you what dependencies you need to install.

## Getting started with code

> Please note that this project's code is not meant for beginners! If you're just getting started with flutter I recommend you to explore some ToDo and basic setState apps and get yourself familiar with flutter and dart eco-system becuase in this project intermediate and advance implementations are use which will confuse you and won't help much in terms of learning.

- There are 2 entry files for this project `main.dart` & `main.mobile.dart`. It was necesarry because I'm using Firebase analytics and crashlytics and there isn't desktop support for Firebase yet.
- `Navigator.dart` is responisble for managing routes, handles custom trasnition, pass parameter in screens & Controll navigation with keyboard shortcuts.
- `UI.dart` provides constant for building responsive UI.
- `blocs/` Intially I was going to implement Rest APIs but that seemed unnecessary & a lot of work So I'll probably remove `blocs/` in futrue.
- `configs/AppDimensions.dart` this is the magical file. It provides the app with:
  - My custom size unit based on device's width, height & pixel density.
  - Responsive containers.
  - Padding multiplier unit (I learned it with experience instead of using 1,2,3px should use multiplier. it helps maintain constancy around the app).
- `Widgets/Screen.dart` This widget is necessary when building a new screen.
  - configure theme & font style.
  - You can show popUps. `final screenKey = GlobalKey<ScreenState>();` & `this.screenKey.showPopUp(message: "your message");`
  - It also recieve a `belowBuilder` parameter which builds custom background (This enables us to build Parallax, Animated background & Any thing you could imagine in background). you can find an example in `Screens/Download/Download.dart`
- Code structure is pretty much simple.
  - Don't import anything form ScreenA in ScreenB.
  - Don't import anthing from Screen/Widget in universal files.
  - Don't import anthing from ScreenA specific Widget in universal files.
  - Each Screen will have `Dimensions.dart` where you can write Screen's responsive logic.
  - I didn't use snake_case in naming convention just becuase I don't prefer it.
  - I use `this` for class's properties & methods I helps keep track of vriables & functions.

## Scripts

> Just run `npm run install` once

- `scripts/upload.js`
  - `npm run upload platform` // platforms: [apk, windows, linux, macos]
  - This script will upload the release build to your firebase storage
  - I intended to integrate this script with github actions but the use account acess was visible on logs that's why I stick with github-release.
- `scripts/runAlliOS.js`
  - Need work currently not a priority.
- `vslaunch.js`
  - `npm run vslaunch`
  - This script will make vscode configuration file with all of your connected devices.
  - You can live debug app on multiple devices at once.
  - Each device's debug logs on seprate **DEBUG CONSOLE**.
  - Very useful when testing UIs for multiple devices.

## Show support

**If you like the project and want to appreciate my effort. Then please perform any of these steps :)**

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
