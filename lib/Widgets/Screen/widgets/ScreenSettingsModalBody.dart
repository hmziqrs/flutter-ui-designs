import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/Widgets/Screen/ScreenStateProvider.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/Providers/AppProvider.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

import '../messages/keys.dart';

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
    "label": "صينى",
    "trans": ScreenWidgetMessages.smArabic,
    "emoji": Emojis.flagSaudiArabia,
  },
  "def": {
    "label": "System Default",
    "trans": ScreenWidgetMessages.smSystemDefault,
    "emoji": Emojis.gear,
  },
};

class ScreenSettingsModalBody extends StatelessWidget {
  ScreenSettingsModalBody({this.runAnimation});

  final Function({double begin, double end}) runAnimation;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context, listen: false);
    final state = Provider.of<ScreenStateProvider>(context, listen: false);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: AppDimensions.padding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 4,
                ),
                child: Text(
                  App.translate(ScreenWidgetMessages.smTitle),
                  style: TextStyles.heading1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding,
                ),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => this.runAnimation(
                    begin: state.offset,
                    end: state.baseOffset,
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  top: AppDimensions.padding,
                  left: AppDimensions.padding * 4,
                  right: AppDimensions.padding * 4,
                ),
                child: GestureDetector(
                  onDoubleTap: () {},
                  // onVerticalDragStart: (_) {},
                  // onVerticalDragUpdate: (_) {},
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          App.translate(ScreenWidgetMessages.smSelectLanguage),
                          style: TextStyles.heading3.copyWith(
                            color: theme.primary,
                          ),
                        ),
                        Container(height: AppDimensions.padding),
                        Text(
                          "All the translatable messages are translated by an automated google translator script that's why you may see translation errors if you choose any language other than English And I won't improve translation since this is just an experimintal application also I work alone on this project. If you wish to improve translation do contact me, I'll mention your contribution in appllication and github repository.",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(height: AppDimensions.padding),
                        ...[
                          null,
                          ...AppProvider.locales,
                        ].map(
                          (locale) {
                            final key = locale?.languageCode ?? 'def';
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                // color: Colors.blue,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding * 1,
                                ),
                                child: InkWell(
                                  onTap: () => appState.activeLocale = locale,
                                  splashColor: Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      AppDimensions.padding * 2.4,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(map[key]["emoji"]),
                                        Container(width: AppDimensions.padding),
                                        Text(map[key]["label"]),
                                        Text(" - "),
                                        Text(App.translate(map[key]["trans"])),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
