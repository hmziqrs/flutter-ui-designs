import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found');
    exit(1);
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final pubspec = loadYaml(pubspecContent);

  final version = pubspec['version'] as String;

  final versionParts = version.split('+');
  if (versionParts.length != 2) {
    print('Invalid version format in pubspec.yaml');
    exit(1);
  }

  final versionName = versionParts[0];
  final versionCode = versionParts[1];
  print("$versionParts");

  updateAndroidVersion(versionName, versionCode);
  // updateIOSVersion(versionName, versionCode);
  // updateMacOSVersion(versionName, versionCode);
  // updateLinuxVersion(versionName, versionCode);
  // updateWindowsVersion(versionName, versionCode);

  print('Version updated successfully');
}

void updateAndroidVersion(String versionName, String versionCode) {
  final buildGradleFile = File('android/app/build.gradle');
  if (!buildGradleFile.existsSync()) {
    print('android/app/build.gradle not found');
    return;
  }

  final buildGradleContent = buildGradleFile.readAsStringSync();
  final updatedContent = buildGradleContent
      .replaceAll(RegExp(r'versionCode = .*$', multiLine: true),
          'versionCode = $versionCode')
      .replaceAll(RegExp(r'versionName = .*$', multiLine: true),
          'versionName = "$versionName"');

  buildGradleFile.writeAsStringSync(updatedContent);
  print('Android version updated');
}

void updateIOSVersion(String versionName, String versionCode) {
  final plistFile = File('ios/Runner/Info.plist');
  if (!plistFile.existsSync()) {
    print('ios/Runner/Info.plist not found');
    return;
  }

  final plistContent = plistFile.readAsStringSync();
  final updatedContent = plistContent
      .replaceAll(
          RegExp(
              r'<key>CFBundleShortVersionString</key>\s*<string>[^<]+</string>'),
          '<key>CFBundleShortVersionString</key>\n\t<string>$versionName</string>')
      .replaceAll(
          RegExp(r'<key>CFBundleVersion</key>\s*<string>[^<]+</string>'),
          '<key>CFBundleVersion</key>\n\t<string>$versionCode</string>');

  plistFile.writeAsStringSync(updatedContent);
  print('iOS version updated');
}

void updateMacOSVersion(String versionName, String versionCode) {
  final plistFile = File('macos/Runner/Info.plist');
  if (!plistFile.existsSync()) {
    print('macos/Runner/Info.plist not found');
    return;
  }

  final plistContent = plistFile.readAsStringSync();
  final updatedContent = plistContent
      .replaceAll(
          RegExp(
              r'<key>CFBundleShortVersionString</key>\s*<string>[^<]+</string>'),
          '<key>CFBundleShortVersionString</key>\n\t<string>$versionName</string>')
      .replaceAll(
          RegExp(r'<key>CFBundleVersion</key>\s*<string>[^<]+</string>'),
          '<key>CFBundleVersion</key>\n\t<string>$versionCode</string>');

  plistFile.writeAsStringSync(updatedContent);
  print('macOS version updated');
}

void updateLinuxVersion(String versionName, String versionCode) {
  final cmakeFile = File('linux/CMakeLists.txt');
  if (!cmakeFile.existsSync()) {
    print('linux/CMakeLists.txt not found');
    return;
  }

  final cmakeContent = cmakeFile.readAsStringSync();
  final updatedContent = cmakeContent
      .replaceAll(RegExp(r'set\(PROJECT_VERSION "[^"]+"\)'),
          'set(PROJECT_VERSION "$versionName")')
      .replaceAll(RegExp(r'set\(PROJECT_VERSION_CODE \d+\)'),
          'set(PROJECT_VERSION_CODE $versionCode)');

  cmakeFile.writeAsStringSync(updatedContent);
  print('Linux version updated');
}

void updateWindowsVersion(String versionName, String versionCode) {
  final rcFile = File('windows/runner/Runner.rc');
  if (!rcFile.existsSync()) {
    print('windows/runner/Runner.rc not found');
    return;
  }

  final rcContent = rcFile.readAsStringSync();
  final updatedContent = rcContent
      .replaceAll(RegExp(r'FILEVERSION \d+,\d+,\d+,\d+'),
          'FILEVERSION ${versionName.replaceAll('.', ',')},$versionCode')
      .replaceAll(RegExp(r'PRODUCTVERSION \d+,\d+,\d+,\d+'),
          'PRODUCTVERSION ${versionName.replaceAll('.', ',')},$versionCode')
      .replaceAll(RegExp(r'VALUE "FileVersion", "[^"]+"'),
          'VALUE "FileVersion", "$versionName.$versionCode"')
      .replaceAll(RegExp(r'VALUE "ProductVersion", "[^"]+"'),
          'VALUE "ProductVersion", "$versionName.$versionCode"');

  rcFile.writeAsStringSync(updatedContent);
  print('Windows version updated');
}
