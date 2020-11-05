import 'package:flutter/material.dart';

class ScreenStateProvider extends ChangeNotifier {
  bool _isSettingsOpen = false;
  bool _isSettingsMounted = false;

  bool get isSettingsOpen => this._isSettingsOpen;
  bool get isSettingsMounted => this._isSettingsMounted;

  set isSettingsOpen(bool flag) {
    if (flag == this._isSettingsOpen) {
      return;
    }
    this._isSettingsOpen = flag;
    if (flag) {
      this._isSettingsMounted = flag;
    }
    notifyListeners();
  }

  set isSettingsMounted(bool flag) {
    if (flag == this._isSettingsMounted) {
      return;
    }
    this._isSettingsMounted = flag;
    notifyListeners();
  }
}
