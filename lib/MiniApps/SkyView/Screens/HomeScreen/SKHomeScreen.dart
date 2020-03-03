import 'package:flutter/material.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import './../../configs/theme.dart' as theme;
import './../../data/data.dart' as data;

import 'Widgets/PlanetsCarousel.dart';
import 'Dimensions.dart';

class SKHomeScreen extends StatefulWidget {
  SKHomeScreen({Key key}) : super(key: key);

  _SKHomeScreenState createState() => _SKHomeScreenState();
}

class _SKHomeScreenState extends State<SKHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  double scrollOffset = 0.0;
  double previousOffset = 0.0;
  Key pageScrollKey = GlobalKey(debugLabel: "pageScroll");

  final List<String> tabs = [
    "Planets",
    "Stars",
    "Satellites",
    "Astroids",
    "Comets"
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

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Montserrat',
        );

    return Screen(
      Dimensions.init,
      scaffoldBackgroundColor: theme.background,
      theme: Theme.of(context).copyWith(
        accentColor: theme.primary,
        primaryColor: theme.primary,
      ),
      textStyle: fontStyle,
      builder: (_) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            new FocusNode(),
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (Axis.vertical == notification.metrics.axis) {
                setState(() {
                  this.scrollOffset =
                      (notification.metrics.pixels - this.previousOffset);
                  this.previousOffset = notification.metrics.pixels;
                });
              }
              return true;
            },
            child: SingleChildScrollView(
              key: this.pageScrollKey,
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        this.buildSearchBar(fontStyle),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppDimensions.padding * 4,
                            left: AppDimensions.padding * 3,
                          ),
                          child: Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 20 + AppDimensions.ratio * 10,
                              fontWeight: FontWeight.w800,
                              color: theme.lightText,
                            ),
                          ),
                        ),
                        this.buildTabsBar(fontStyle),
                      ],
                    ),
                  ),
                  PlanetsCarousel(this.scrollOffset),
                  this.buildStories(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSearchBar(TextStyle fontStyle) {
    return Container(
      height: Dimensions.searchBarHeight,
      margin: EdgeInsets.all(AppDimensions.padding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: Dimensions.searchBarHeight,
            height: Dimensions.searchBarHeight,
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 1,
                  color: theme.primary.withOpacity(0.35),
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Icon(
              Icons.camera_enhance,
              color: Colors.white,
              size: 18,
            ),
          ),
          Flexible(
            child: TextField(
              cursorColor: theme.primary,
              style: TextStyle(
                fontSize: 8 + AppDimensions.ratio * 4,
              ),
              decoration: InputDecoration(
                hintText: "Search Planets, Stars, Satellite",
                hintStyle: fontStyle.copyWith(
                  color: theme.lightText,
                  fontWeight: FontWeight.w500,
                  fontSize: 8 + AppDimensions.ratio * 4,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 4,
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.searchBarHeight,
            height: Dimensions.searchBarHeight,
            child: Icon(
              Icons.search,
              size: 19,
              color: theme.lightText2,
            ),
          ),
        ],
      ),
    );
  }

  buildTabsBar(TextStyle fontStyle) {
    return Container(
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
        labelColor: Colors.black,
        indicatorColor: theme.primary,
        controller: this.tabController,
        unselectedLabelColor: theme.subText,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding,
          horizontal: AppDimensions.padding * 3,
        ),
        tabs: this.tabs.map((tab) {
          return Text(tab);
        }).toList(),
      ),
    );
  }

  buildStories() {
    return Container(
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
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.padding * 4,
              bottom: AppDimensions.padding * 2,
              left: AppDimensions.padding * 1.5,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: theme.lightText,
                fontWeight: FontWeight.w800,
                fontSize: 20 + AppDimensions.ratio * 10,
              ),
            ),
          ),
          Wrap(
            children: data.storyList.map(this.buildStory).toList(),
          ),
          Utils.safePadding(context, 'bottom'),
        ],
      ),
    );
  }

  Widget buildStory(data.SpaceStory story) {
    return Container(
      width: Dimensions.storyBaseWidth,
      margin: EdgeInsets.all(
        AppDimensions.padding * 1.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            story.image,
            fit: BoxFit.cover,
            height: Dimensions.storyImageHeight,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: AppDimensions.padding * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    story.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 7 + AppDimensions.padding * 2.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.padding,
                      bottom: AppDimensions.padding,
                    ),
                    child: Row(
                      children: List<Widget>.generate(
                        5,
                        (index) {
                          final bool isEnabled = (index + 1) <= story.stars;
                          return Container(
                            child: Icon(
                              isEnabled
                                  ? Icons.star
                                  : MaterialIcons.star_border,
                              size: 18,
                              color: theme.primary,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    story.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.8,
                      fontSize: 8 + AppDimensions.ratio * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
