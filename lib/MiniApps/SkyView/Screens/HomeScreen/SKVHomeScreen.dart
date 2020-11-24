import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'messages/keys.dart';
import 'Dimensions.dart';
import 'TestKeys.dart';

import 'widgets/SKVHomeScreenPlanetsCarousel.dart';
import 'widgets/SKVHomeScreenSearchBar.dart';
import 'widgets/SKVHomeScreenStory.dart';

class SKVHomeScreen extends StatefulWidget {
  SKVHomeScreen({Key key}) : super(key: key);

  _SKVHomeScreenState createState() => _SKVHomeScreenState();
}

class _SKVHomeScreenState extends State<SKVHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  double scrollOffset = 0.0;
  double previousOffset = 0.0;
  // Key pageScrollKey = GlobalKey(debugLabel: "pageScroll");

  final List<String> tabs = [
    SKVHomeScreenMessages.planets,
    SKVHomeScreenMessages.stars,
    SKVHomeScreenMessages.satellites,
    SKVHomeScreenMessages.astroids,
    SKVHomeScreenMessages.comets,
  ];

  @override
  void initState() {
    super.initState();
    Utils.darkStatusBar();

    this.tabController = TabController(
      length: this.tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    Utils.lightStatusBar();
    super.dispose();
  }

  bool onScrollNotification(notification) {
    if (Axis.vertical == notification.metrics.axis) {
      setState(() {
        this.scrollOffset = (notification.metrics.pixels - this.previousOffset);
        this.previousOffset = notification.metrics.pixels;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Montserrat',
        );

    final rootTheme = Theme.of(context).copyWith(
      accentColor: theme.primary,
      primaryColor: theme.primary,
    );

    return Screen(
      theme: rootTheme,
      textStyle: fontStyle,
      scaffoldBackgroundColor: theme.background,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          new FocusNode(),
        ),
        child: NotificationListener<ScrollNotification>(
          onNotification: this.onScrollNotification,
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
                      // Tabsbar
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: AppDimensions.padding * 3,
                          horizontal: AppDimensions.padding * 3,
                        ),
                        color: theme.background,
                        child: TabBar(
                          isScrollable: true,
                          labelStyle: fontStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: fontStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          labelColor: Colors.black,
                          indicatorColor: theme.primary,
                          controller: this.tabController,
                          unselectedLabelColor: theme.subText,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(
                            vertical: AppDimensions.padding,
                            horizontal: AppDimensions.padding * 3,
                          ),
                          tabs: this
                              .tabs
                              .map(
                                (tab) => Text(
                                  App.translate(
                                    tab,
                                    context,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SKVHomeScreenPlanetsCarousel(this.scrollOffset),
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
