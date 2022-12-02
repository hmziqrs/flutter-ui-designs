import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

final themeMap = {
  "system": ThemeMode.system,
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

enum Cache {
  theme,
  locale,
}

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
  ];

  static final appBox = Hive.box('app');

  AppProvider() {
    final cachedLocale = appBox.get(Cache.locale.toString());
    if (cachedLocale != null) {
      final split = cachedLocale.split("_");
      this._activeLocale = Locale(split.first, split.last);
    }

    final cachedTheme = appBox.get(Cache.theme.toString());
    this._themeMode =
        cachedTheme == null ? themeMap["system"]! : themeMap[cachedTheme]!;
  }

  Locale? _activeLocale;
  Locale? get activeLocale => this._activeLocale;

  setActiveLocale(Locale? locale) {
    if (locale == null) {
      this._activeLocale = null;
      appBox.put(Cache.locale.toString(), null);
      notifyListeners();
    }

    if (locale == this._activeLocale) {
      return;
    }
    this._activeLocale = locale;
    appBox.put(Cache.locale.toString(), locale.toString());
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => this._themeMode;

  void setTheme(ThemeMode newTheme) {
    if (this._themeMode == newTheme) {
      return;
    }
    this._themeMode = newTheme;
    notifyListeners();
    appBox.put(
      Cache.theme.toString(),
      newTheme.toString().split(".").last,
    );
  }
}
