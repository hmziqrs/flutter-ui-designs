import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  Locale _activeLocale;

  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
  ];

  Locale get activeLocale => this._activeLocale;

  setActiveLocale(Locale locale) {
    this._activeLocale = locale;
    notifyListeners();
  }
}
