import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/Providers/AppProvider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/services/notification/notification.dart';

import 'ScreenSettingsSelect.dart';
import 'data.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';

class ScreenSettingsModalBody extends StatelessWidget {
  ScreenSettingsModalBody({
    required this.onClose,
    required this.isModalOpen,
  });

  final VoidCallback onClose;
  final bool isModalOpen;

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.state(context, true);
    return Material(
      textStyle: Theme.of(context).textTheme.bodyLarge,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
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
                        textChild: Row(
                          children: [
                            Text(
                                "${map[key]!["emoji"]}  ${map[key]!["label"]} - ${App.translate(
                              map[key]!["trans"],
                              context,
                            )}"),
                          ],
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
                  Container(height: AppDimensions.padding),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      "Notifications",
                      style: TextStyles.heading3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ScreenSettingsSelect(
                    onPress: () async {
                      final token = await AppFCM.getToken();
                      if (token == null) {
                        return;
                      }
                      print(token);
                      Clipboard.setData(ClipboardData(text: token));
                    },
                    isActive: false,
                    text: "Copy fcm token to clipboard",
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
