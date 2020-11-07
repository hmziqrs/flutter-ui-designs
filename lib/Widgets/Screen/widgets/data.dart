
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';

final Map<String, Map<String, String>> map = {
  "en": {
    "label": "English",
    "trans": ScreenWidgetMessages.smEnglish,
    "emoji": Emojis.flagUnitedStates,
  },
  "zh": {
    "label": "中文",
    "trans": ScreenWidgetMessages.smChinese,
    "emoji": Emojis.flagChina,
  },
  "ar": {
    "label": "عربى",
    "trans": ScreenWidgetMessages.smArabic,
    "emoji": Emojis.flagSaudiArabia,
  },
  "def": {
    "label": "System Default",
    "trans": ScreenWidgetMessages.smSystemDefault,
    "emoji": Emojis.gear,
  },
};

final themeTestKeysMap = {
  ThemeMode.system: ScreenWidgetTestKeys.systemTheme,
  ThemeMode.light: ScreenWidgetTestKeys.lightTheme,
  ThemeMode.dark: ScreenWidgetTestKeys.darkTheme,
};

final Map themeModeMap = {
  ThemeMode.system: ScreenWidgetMessages.smSelectTheme,
  ThemeMode.light: ScreenWidgetMessages.smLightTheme,
  ThemeMode.dark: ScreenWidgetMessages.smDarkTheme,
};
