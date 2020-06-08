import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  Locale _activeLocale;

  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
  ];

  Locale get activeLocale => this._activeLocale;

  set activeLocale(Locale newLocale) {
    this._activeLocale = newLocale;
    notifyListeners();
  }
}
