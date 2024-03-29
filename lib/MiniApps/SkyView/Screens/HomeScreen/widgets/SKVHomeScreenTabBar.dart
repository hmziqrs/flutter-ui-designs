import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../configs/theme.dart' as theme;
import '../messages/keys.dart';

class SKVHomeScreenTabBar extends StatefulWidget {
  @override
  _SKVHomeScreenTabBarState createState() => _SKVHomeScreenTabBarState();
}

class _SKVHomeScreenTabBarState extends State<SKVHomeScreenTabBar>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = [
    SKVHomeScreenMessages.planets,
    SKVHomeScreenMessages.stars,
    SKVHomeScreenMessages.satellites,
    SKVHomeScreenMessages.asteroids,
    SKVHomeScreenMessages.comets,
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(
      length: this.tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    this.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: 'Montserrat',
        );

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppDimensions.padding * 3,
        horizontal: AppDimensions.padding * 3,
      ),
      color: theme.background,
      child: TabBar(
        dividerHeight: 0.0,
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
        unselectedLabelColor: Colors.black.withOpacity(0.6),
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
    );
  }
}
