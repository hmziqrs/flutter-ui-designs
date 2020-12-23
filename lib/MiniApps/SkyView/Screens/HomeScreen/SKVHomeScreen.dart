import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'messages/keys.dart';
import 'Dimensions.dart';
import 'TestKeys.dart';
import 'Provider.dart';

import 'widgets/SKVHomeScreenPlanetsCarousel.dart';
import 'widgets/SKVHomeScreenSearchBar.dart';
import 'widgets/SKVHomeScreenStory.dart';
import 'widgets/SKVHomeScreenTabBar.dart';

class SKVHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SKVHomeState>(
      create: (_) => SKVHomeState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  bool onScrollNotification(
    BuildContext context,
    ScrollNotification notification, [
    bool isHorizontal = false,
  ]) {
    final offset = notification?.metrics?.pixels;
    if (offset == null) {
      return false;
    }
    final state = SKVHomeState.state(context);
    if (notification.metrics.axis == Axis.vertical) {
      state.setOffsetY(offset);
    } else {
      state.setOffsetX(offset);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final rootTheme = Theme.of(context).copyWith(
      accentColor: theme.primary,
      primaryColor: theme.primary,
    );

    return Screen(
      theme: rootTheme,
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: theme.background,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          new FocusNode(),
        ),
        child: NotificationListener<ScrollNotification>(
          onNotification: (n) => this.onScrollNotification(context, n),
          child: SingleChildScrollView(
            key: Key(SKVHomeScreenTestKeys.rootScroll),
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SKVHomeScreenSearchBar(),

                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.padding * 4,
                          left: AppDimensions.padding * 3,
                          right: AppDimensions.padding * 3,
                        ),
                        child: Text(
                          App.translate(
                            SKVHomeScreenMessages.explore,
                            context,
                          ),
                          style: TextStyle(
                            fontSize: 20 + AppDimensions.ratio * 10,
                            fontWeight: FontWeight.w800,
                            color: theme.lightText,
                          ),
                        ),
                      ),
                      // TabsBar
                      SKVHomeScreenTabBar(),
                    ],
                  ),
                ),
                NotificationListener<ScrollNotification>(
                  onNotification: (n) => this.onScrollNotification(context, n),
                  child: SKVHomeScreenPlanetsCarousel(),
                ),
                // Build Stories
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: AppDimensions.padding * 3),
                  padding: Utils.safePaddingUnit(context, 'horizontal').add(
                    EdgeInsets.all(AppDimensions.padding * 1.5),
                  ),
                  decoration: BoxDecoration(
                    color: theme.secondary,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.padding * 4,
                          bottom: AppDimensions.padding * 2,
                          left: AppDimensions.padding * 1.5,
                          right: AppDimensions.padding * 1.5,
                        ),
                        child: Text(
                          App.translate(
                            SKVHomeScreenMessages.popular,
                            context,
                          ),
                          style: TextStyle(
                            color: theme.lightText,
                            fontWeight: FontWeight.w800,
                            fontSize: 20 + AppDimensions.ratio * 10,
                          ),
                        ),
                      ),
                      Wrap(
                        children: data.storyList
                            .map(
                              (story) => SKVHomeScreenStory(
                                story: story,
                              ),
                            )
                            .toList(),
                      ),
                      Utils.safePadding(context, 'bottom'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
