import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/widgets/Screen/Provider.dart';

import 'HomeBuildVersion.dart';
import '../data.dart' as data;
import '../messages/keys.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: AppDimensions.maxContainerWidth,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding * 2,
            vertical: AppDimensions.padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                App.translate(
                  HomeScreenMessages.title,
                  context,
                ),
                key: Key("title"),
                style: TextStyles.heading1,
              ),
              Text(
                App.translate(
                  HomeScreenMessages.desc,
                  context,
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(padding: EdgeInsets.all(AppDimensions.padding)),
              ...data.list
                  .map(
                    (item) => Container(
                      width: double.infinity,
                      child: OutlineButton(
                        key: Key(item["key"]),
                        textColor: AppTheme.primary,
                        borderSide: BorderSide(
                          width: 1.5,
                          color: AppTheme.primary.withOpacity(0.6),
                        ),
                        highlightedBorderColor: AppTheme.primary.withOpacity(
                          0.8,
                        ),
                        onPressed: () {
                          final path = item["path"];
                          if (path == 'settings') {
                            return ScreenStateProvider.state(context)
                                .setSettingsOpen(true);
                          }

                          Navigator.of(context).pushNamed(
                            path,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item["icon"], size: 20),
                            Container(width: 6),
                            Text(
                              App.translate(
                                item["label"],
                                context,
                              ),
                              style: TextStyles.body17,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              HomeBuildVersion(),
            ],
          ),
        ),
      ),
    );
  }
}
