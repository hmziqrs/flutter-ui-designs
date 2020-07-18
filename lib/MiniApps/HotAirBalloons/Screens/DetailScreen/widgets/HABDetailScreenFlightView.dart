import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/flights.dart' as data;
import '../messages/keys.dart';
import '../Dimensions.dart';

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
          App.translate(widget.flight.inFlightInfo),
          style: TextStyle(
            fontSize: 12,
            color: theme.subText,
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
            top: Radius.circular(Dimensions.borderCliping),
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.backgroudImageHeight -
                  Dimensions.borderCliping * 2,
            ),
            padding: EdgeInsets.only(
              top: AppDimensions.padding * 4,
              left: AppDimensions.padding * 4,
              right: AppDimensions.padding * 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.borderCliping),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  indicator: null,
                  isScrollable: true,
                  onTap: this.setActiveTab,
                  labelColor: theme.primary,
                  labelStyle: tabBarFontStyle,
                  controller: this.tabController,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.black,
                  tabs: this
                      .tabs
                      .asMap()
                      .map(
                        (index, tab) => MapEntry(
                          index,
                          GestureDetector(
                            child: Container(
                              child: Text(App.translate(tab)),
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: index == this.activeTab
                                        ? theme.primary
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
                ControlledAnimation(
                  key: Key(this.activeTab.toString()),
                  tween: Tween(begin: 0.0, end: 1.0),
                  delay: Duration(milliseconds: 120),
                  duration: Duration(milliseconds: 500),
                  builder: (ctx, animation) => Opacity(
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
