import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/flights.dart' as data;

import '../Dimensions.dart';
import 'PostFlightInfoTab.dart';
import 'FlightDetailsTab.dart';
import 'PreFlightInfoTab.dart';

class FlightView extends StatefulWidget {
  FlightView(this.flight, this.fontStyle);
  final data.HABFlight flight;
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

  tabBar() {
    final tabBarFontStyle = widget.fontStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 13,
    );

    return TabBar(
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
                  child: Text(
                    tab,
                  ),
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
    );
  }

  renderContent() {
    if (this.activeTab == 0) {
      return FlightDetailsTab(widget.flight);
    } else if (this.activeTab == 1) {
      return PreFlightInfoTab(widget.flight);
    } else if (this.activeTab == 2) {
      return Padding(
        padding: EdgeInsets.all(Dimensions.padding * 3),
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
      padding: EdgeInsets.only(top: ((Dimensions.headerSpace * 2) + 100)),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
        child: Container(
          padding: EdgeInsets.only(
            top: Dimensions.padding * 4,
            left: Dimensions.padding * 4,
            right: Dimensions.padding * 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this.tabBar(),
              Padding(padding: EdgeInsets.all(Dimensions.padding * 1.5)),
              Flexible(
                child: ControlledAnimation(
                  key: Key(this.activeTab.toString()),
                  tween: Tween(begin: 0.0, end: 1.0),
                  delay: Duration(milliseconds: 120),
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
