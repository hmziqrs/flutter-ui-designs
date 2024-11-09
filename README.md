# Flutter UI Designs

> ## True cross-platform app that runs on web, mobile & desktop platforms

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

## Requirements

### Minimum System Requirements

- Flutter: 3.24.4 or higher (stable channel)
- Dart: 3.5.4 or higher
- DevTools: 2.37.3 or higher

### Enable Platform Support

To develop for different platforms, enable them using:

```bash
flutter config --enable-web
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter config --enable-windows-desktop
```

### Setup Verification

1. Run `flutter doctor` to verify your setup and install any missing dependencies
2. Run `flutter pub get` to install project dependencies

## Project Structure

> **Note:** This project implements intermediate to advanced Flutter concepts. If you're new to Flutter, we recommend starting with simpler projects first.

### Key Components

1. **Entry Points**

   - `main.dart`: Core application entry
   - `main.mobile.dart`: Mobile-specific entry with Firebase integration

2. **Core Files**
   - `Navigator.dart`: Handles routing, transitions, and keyboard navigation
   - `configs/AppDimensions.dart`: Manages responsive layouts
   - `UI.dart`: Contains UI constants and helpers
   - `Widgets/Screen.dart`: Base widget for screen construction

### Code Organization Guidelines

- Maintain separation between screen components
- Follow proper dependency direction
- Each screen has its own `Dimensions.dart` for responsive logic
- Use PascalCase for file naming
- Use `this` keyword for better code clarity

## Development Scripts

### VS Code Integration

```bash
dart scripts/vslaunch.dart
```

This generates VS Code configuration for:

- Multi-device debugging
- Separate debug consoles per device
- Live UI testing across devices

## Support the Project

If you find this project helpful:

- ⭐ Star this repository
- 📱 Rate our app on [Play Store](https://play.google.com/store/apps/details?id=com.onemdev.flutter_ui_challenges)
- 👔 Endorse skills on [LinkedIn](https://www.linkedin.com/in/hackerhgl)

## License

This project is licensed under the MIT License. Copyright (c) 2020-2024 Hamza Iqbal.
See `LICENSE.md` for more details.
