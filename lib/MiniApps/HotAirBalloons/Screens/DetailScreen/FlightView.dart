import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/UI.dart';

import '../../configs/theme.dart' as theme;
import '../../data/flights.dart' as data;
import 'FlightDetailsTab.dart';
import 'PreFlightInfoTab.dart';
import 'PostFlightInfoTab.dart';

class FlightView extends StatefulWidget {
  FlightView(this.flight, this.fontStyle);
  final data.Flight flight;
  final TextStyle fontStyle;

  @override
  _FlightViewState createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int activeTab;

  final tabs = [
    'FLIGHT DETAILS',
    'PRE-FLIGHT INFORMATION',
    'IN-FLIGHT INFORMATION',
    'POST-FLIGHT INFORMATION'
  ];

  @override
  void initState() {
    this.tabController = new TabController(
      vsync: this,
      length: 4,
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

  tabBar() {
    final tabBarFontStyle =
        widget.fontStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 13);

    int tabCount = -1;
    return TabBar(
      controller: this.tabController,
      indicator: null,
      indicatorColor: Colors.transparent,
      labelStyle: tabBarFontStyle,
      onTap: this.setActiveTab,
      labelColor: theme.primary,
      unselectedLabelColor: Colors.black,
      // labelColor: theme.primary,
      // unselectedLabelStyle: widget.fontStyle,
      isScrollable: true,
      tabs: this.tabs.map(
        (tab) {
          tabCount += 1;
          return GestureDetector(
            child: Container(
              child: Text(
                tab,
              ),
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: tabCount == this.activeTab
                        ? theme.primary
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  renderContent() {
    if (this.activeTab == 0) {
      return FlightDetailsTab(widget.flight);
    } else if (this.activeTab == 1) {
      return PreFlightInfoTab(widget.flight);
    } else if (this.activeTab == 2) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UI.horizontal * 5,
          vertical: UI.vertical * 3,
        ),
        child: Text(
          widget.flight.inFlightInfo,
          style: TextStyle(
            fontSize: 12,
            color: theme.subText,
            height: 1.7,
          ),
        ),
      );
    }
    return PostFlightInfoTab(
      widget.flight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.red.withOpacity(.5),
          ),
      padding: EdgeInsets.only(top: (UI.vertical * 17 + 60)),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
        child: Container(
          padding: EdgeInsets.only(
            top: UI.vertical * 5,
            left: UI.horizontal * 6,
            right: UI.horizontal * 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this.tabBar(),
              Container(height: UI.vertical * 3),
              Flexible(
                child: ControlledAnimation(
                  key: Key(this.activeTab.toString()),
                  tween: Tween(
                    begin: 0.0,
                    end: 1.0,
                  ),
                  delay: Duration(milliseconds: 60),
                  duration: Duration(milliseconds: 500),
                  builder: (ctx, animation) => Opacity(
                    opacity: animation,
                    child: SingleChildScrollView(
                      child: this.renderContent(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
