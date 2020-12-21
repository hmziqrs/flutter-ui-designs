import 'package:flutter/material.dart';

import 'package:flutter_uis/Providers/AppProvider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';

import 'ScreenSettingsSelect.dart';
import 'data.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';

class ScreenSettingsModalBody extends StatelessWidget {
  ScreenSettingsModalBody({
    @required this.onClose,
    @required this.appState,
    @required this.isModalOpen,
  });

  final VoidCallback onClose;
  final AppProvider appState;
  final bool isModalOpen;

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: Theme.of(context).textTheme.bodyText1,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return true;
              },
              child: ListView(
                key: Key(ScreenWidgetTestKeys.rootScroll),
                children: [
                  Container(height: AppDimensions.padding * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.padding * 2,
                        ),
                        child: Text(
                          App.translate(ScreenWidgetMessages.smTitle, context),
                          style: TextStyles.heading1,
                        ),
                      ),
                      IconButton(
                        key: Key(ScreenWidgetTestKeys.close),
                        icon: Icon(Icons.close),
                        onPressed: this.onClose,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      App.translate(
                        ScreenWidgetMessages.smSelectLanguage,
                        context,
                      ),
                      style: TextStyles.heading3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      "All the translatable messages are translated by an automated google translator script that's why you may see translation errors if you choose any language other than English And I won't improve translation since this is just an experimental application also I work alone on this project. If you wish to improve translation do contact me, I'll mention your contribution in application and github repository.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  ...[
                    null,
                    ...AppProvider.locales,
                  ].map(
                    (locale) {
                      final String key = locale?.languageCode ?? 'def';
                      return ScreenSettingsSelect(
                        onPress: () => appState.setActiveLocale(locale),
                        isActive: locale == appState.activeLocale,
                        textChild: DefaultTextStyle(
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          child: Row(
                            children: [
                              Text(map[key]["emoji"]),
                              Container(width: AppDimensions.padding),
                              Text(map[key]["label"]),
                              Text(" - "),
                              Text(
                                App.translate(
                                  map[key]["trans"],
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  Container(height: AppDimensions.padding),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      App.translate(
                        ScreenWidgetMessages.smSelectTheme,
                        context,
                      ),
                      style: TextStyles.heading3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ...ThemeMode.values.map(
                    (themeMode) => ScreenSettingsSelect(
                      testKey: themeTestKeysMap[themeMode],
                      onPress: () => appState.setTheme(themeMode),
                      isActive: themeMode == appState.themeMode,
                      text: App.translate(themeModeMap[themeMode], context),
                    ),
                  ),
                  Container(height: AppDimensions.padding * 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
