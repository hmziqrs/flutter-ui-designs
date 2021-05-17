# Flutter UI Designs

> ## True cross platform app runs on web, mobile & desktop

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

## Requirements to run locally

- Flutter stable v2.0.0+
- Dart VM version: 2.12.0+
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
- `configs/AppDimensions.dart` this is the magical file. It provides the app with:
- `UI.dart` provides constant for building responsive UI.
  - My custom size unit based on device's width, height & pixel density.
  - Responsive containers.
  - Padding multiplier unit (I learned it with experience instead of using 1,2,3px should use multiplier. it helps maintain constancy around the app).
- `Widgets/Screen.dart` This widget is necessary when building a new screen.
  - configure theme & font style.
  - It also receive a `belowBuilders` parameter which builds custom background (This enables us to build Parallax, Animated background & Any thing you could imagine in background). you can find an example in `Screens/Download/Download.dart`
- Code structure is pretty much simple.
  - Don't import anything form ScreenA in ScreenB.
  - Don't import anything from Screen/Widget in universal files.
  - Don't import anything from ScreenA specific Widget in universal files.
  - Each Screen will have `Dimensions.dart` where you can write Screen's responsive logic.
  - I didn't use snake_case in naming convention just because I don't prefer it.
  - I use `this` for class's properties & methods I helps keep track of variables & class properties.

## Scripts

- `vslaunch.dart`
  - `dart sciprts/vslaunch.dart`
  - This script will make vscode configuration file with all of your connected devices.
  - You can live debug app on multiple devices at once from vs code.
  - Each device's debug logs on separate **DEBUG CONSOLE**.
  - Very useful for testing UI for multiple devices simultaneously.

## Show support

> **If you like the project and want to appreciate my effort. Then you can perform any of these steps**

- Star this repository.
- Rate the app on <a href="https://play.google.com/store/apps/details?id=com.onemdev.flutter_ui_challenges" target="playstore">Play Store</a>.
- Endorse my skills on my <a href="https://www.linkedin.com/in/hackerhgl" target="linkedin">Linkedin Profile</a>.

## License

This project is licensed under the MIT license, Copyright (c) 2020 Hamza Iqbal. For more information see `LICENSE.md`.
