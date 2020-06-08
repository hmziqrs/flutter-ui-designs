import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/Providers/AppProvider.dart';

import 'package:flutter_uis/screens/Home/messages/keys.dart';

final Map<String, Map<String, String>> map = {
  "en": {
    "label": "English",
    "trans": HomeScreenMessages.settingsModalEnglish,
    "emoji": "usa",
  },
  "zh": {
    "label": "中文",
    "trans": HomeScreenMessages.settingsModalChinese,
    "emoji": "china",
  },
  "ar": {
    "label": "صينى",
    "trans": HomeScreenMessages.settingsModalArabic,
    "emoji": "Saudia Arabia",
  },
  "def": {
    "label": "System Default",
    "trans": HomeScreenMessages.settingsModalSystemDefault,
    "emoji": "empty",
  },
};

class HomeSettingsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: FittedBox(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              ),
              width: AppDimensions.miniContainerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          App.translate(HomeScreenMessages.settingsModalTitle),
                          style: TextStyles.heading2,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  ...[null, ...AppProvider.locales].map(
                    (locale) {
                      final key = locale?.languageCode ?? 'def';
                      final isActive =
                          (provider.activeLocale == null && locale == null) ||
                              (provider.activeLocale == locale);
                      return Material(
                        color: Colors.black.withOpacity(
                          isActive ? 0.04 : 0.0,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            provider.activeLocale = locale;
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.padding,
                              horizontal: AppDimensions.padding * 2,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: AppDimensions.padding,
                            ),
                            child: Text(
                              "${map[key]["label"]} - ${App.translate(map[key]["trans"])}",
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
