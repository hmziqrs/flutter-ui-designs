import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;

import 'Widgets/ObjectsCarousel.dart';
import 'Dimensions.dart';

class SKHomeScreen extends StatefulWidget {
  SKHomeScreen({Key key}) : super(key: key);

  _SKHomeScreenState createState() => _SKHomeScreenState();
}

class _SKHomeScreenState extends State<SKHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
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

    this.tabController = new TabController(
      length: this.tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    Utils.lightStatusBar();
    super.dispose();
  }

  searchBar(TextStyle fontStyle) {
    return Container(
      height: Dimensions.searchBarHeight,
      margin: EdgeInsets.all(16.0),
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
              style: TextStyle(fontSize: 12),
              cursorColor: theme.primary,
              decoration: InputDecoration(
                hintText: "Search Planets, Stars, Satellite",
                hintStyle: fontStyle.copyWith(
                  color: theme.lightText,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
              ),
            ),
          ),
          Container(
            width: Dimensions.searchBarHeight,
            height: Dimensions.searchBarHeight,
            child: Icon(
              Icons.search,
              color: theme.lightText2,
              size: 19,
            ),
          ),
        ],
      ),
    );
  }

  tabsBar(TextStyle fontStyle) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      color: theme.background,
      child: TabBar(
        isScrollable: true,
        labelStyle:
            fontStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
        labelColor: Colors.black,
        indicatorColor: theme.primary,
        controller: this.tabController,
        unselectedLabelColor: theme.subText,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        tabs: this.tabs.map((tab) {
          return Text(tab);
        }).toList(),
      ),
    );
  }

  stories() {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.padding * 3),
      padding: Utils.safePaddingUnit(context, 'horizontal').add(
        EdgeInsets.all(Dimensions.padding * 2),
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
          Text(
            "Popular",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: theme.lightText,
            ),
          ),
          ...data.storyList
              .map((story) => Container(
                    margin: EdgeInsets.only(top: Dimensions.padding * 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          story.image,
                          height: Dimensions.storyImageHeight,
                          fit: BoxFit.cover,
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  story.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                  ),
                                  child: Row(
                                    children: List<Widget>.generate(
                                      5,
                                      (index) {
                                        final bool isEnabled =
                                            (index + 1) <= story.stars;
                                        return Container(
                                          child: Icon(
                                            isEnabled
                                                ? Icons.star
                                                : MaterialIcons.star_border,
                                            color: theme.primary,
                                            size: 18,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  story.desc,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
          Utils.safePadding(context, 'bottom'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        UI.init(context);
        Dimensions.init(context, orientation: orientation);

        return Scaffold(
          backgroundColor: theme.background,
          body: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: theme.secondary,
              accentColor: theme.secondary,
            ),
            child: DefaultTextStyle(
              style: fontStyle,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(
                  new FocusNode(),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Utils.safePadding(context, 'top'),
                      SafeArea(
                        top: false,
                        bottom: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            this.searchBar(fontStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 24.0, left: 16.0),
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: theme.lightText,
                                ),
                              ),
                            ),
                            this.tabsBar(fontStyle),
                          ],
                        ),
                      ),
                      ObjectsCarousel(),
                      this.stories(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
