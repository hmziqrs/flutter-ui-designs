import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/Ads.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/CommonProps.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/widgets/Screen/Provider.dart';

import 'HomeBuildVersion.dart';
import '../data.dart' as data;
import '../messages/keys.dart';

class HomeBody extends StatelessWidget {
  onPress(BuildContext context, String path) {
    if (path == 'settings') {
      return ScreenStateProvider.state(context).setSettingsOpen(true);
    }
    Navigator.of(context).pushNamed(
      path,
    );
  }

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
            vertical: AppDimensions.padding * 2,
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
              ...data.list.map(
                (item) {
                  if (item["key"] == 'ad') {
                    if (!App.showAds) {
                      return SizedBox();
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.padding * 1,
                      ),
                      child: AdmobBanner(
                        adSize: AdmobBannerSize.SMART_BANNER(context),
                        adUnitId: Ads.getHomeScreenBanner(),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding * 1,
                    ),
                    child: InkWell(
                      key: Key(item["key"]),
                      borderRadius: CommonProps.buttonRadius,
                      onTap: () => this.onPress(context, item["path"]),
                      child: Ink(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.padding * 1.5,
                        ),
                        width: double.infinity,
                        decoration: CommonProps.borderButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"],
                              size: 20,
                              color: AppTheme.primary,
                            ),
                            Container(width: AppDimensions.padding),
                            Text(
                              App.translate(
                                item["label"],
                                context,
                              ),
                              style: TextStyles.body16
                                  .copyWith(color: AppTheme.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              HomeBuildVersion(),
            ],
          ),
        ),
      ),
    );
  }
}
