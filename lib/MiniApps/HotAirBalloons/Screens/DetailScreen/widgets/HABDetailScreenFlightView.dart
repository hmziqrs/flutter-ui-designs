import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import '../../../data/flights.dart' as data;
import '../messages/keys.dart';
import '../Dimensions.dart';
import '../TestKeys.dart';

import 'HABDetailScreenPostFlightInfoTab.dart';
import 'HABDetailScreenFlightDetailsTab.dart';
import 'HABDetailScreenPreFlightInfoTab.dart';

class HABDetailScreenFlightView extends StatefulWidget {
  HABDetailScreenFlightView(this.flight, this.fontStyle);
  final data.HABFlight flight;
  final TextStyle fontStyle;

  @override
  _HABDetailScreenFlightViewState createState() =>
      _HABDetailScreenFlightViewState();
}

class _HABDetailScreenFlightViewState extends State<HABDetailScreenFlightView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int activeTab;

  final tabs = [
    HABDetailScreenMessages.tabFlightDetails,
    HABDetailScreenMessages.tabPreFlightInfo,
    HABDetailScreenMessages.tabInFlightInfo,
    HABDetailScreenMessages.tabPostFlightInfo,
  ];

  final tabsTestKeys = [
    HABDetailScreenTestKeys.tabFlightDetails,
    HABDetailScreenTestKeys.tabPreFlightInfo,
    HABDetailScreenTestKeys.tabInFlightInfo,
    HABDetailScreenTestKeys.tabPostFlightInfo,
  ];

  @override
  void initState() {
    this.tabController = new TabController(
      vsync: this,
      length: this.tabs.length,
      initialIndex: 0,
    );
    this.activeTab = 0;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  setActiveTab(int index) {
    setState(() {
      this.activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabBarFontStyle = widget.fontStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 13,
    );

    Widget buildContent;
    if (this.activeTab == 0) {
      buildContent = HABDetailScreenFlightDetailsTab(widget.flight);
    } else if (this.activeTab == 1) {
      buildContent = HABDetailScreenPreFlightInfoTab(widget.flight);
    } else if (this.activeTab == 2) {
      buildContent = Padding(
        padding: EdgeInsets.all(AppDimensions.padding * 3),
        child: Text(
          App.translate(
            widget.flight.inFlightInfo,
            context,
          ),
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.subText,
            height: 1.7,
          ),
        ),
      );
    } else {
      buildContent = HABDetailScreenPostFlightInfoTab(
        widget.flight,
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.borderClipping),
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.backgroundImageHeight -
                  Dimensions.borderClipping * 2,
            ),
            padding: EdgeInsets.only(
              top: AppDimensions.padding * 4,
              left: AppDimensions.padding * 4,
              right: AppDimensions.padding * 4,
            ),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.borderClipping),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  key: Key(HABDetailScreenTestKeys.tabsScroll),
                  indicator: null,
                  isScrollable: true,
                  onTap: this.setActiveTab,
                  labelColor: AppTheme.primary,
                  labelStyle: tabBarFontStyle,
                  controller: this.tabController,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: AppTheme.text,
                  unselectedLabelStyle: tabBarFontStyle,
                  tabs: this
                      .tabs
                      .asMap()
                      .map(
                        (index, tab) => MapEntry(
                          index,
                          GestureDetector(
                            key: Key(this.tabsTestKeys[index]),
                            child: Container(
                              child: Text(
                                App.translate(
                                  tab,
                                  context,
                                ),
                              ),
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: index == this.activeTab
                                        ? AppTheme.primary
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                CustomAnimation(
                  key: Key(this.activeTab.toString()),
                  tween: Tween(begin: 0.0, end: 1.0),
                  delay: Duration(milliseconds: 120),
                  duration: Duration(milliseconds: 500),
                  builder: (ctx, child, animation) => Opacity(
                    opacity: animation,
                    child: buildContent,
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
