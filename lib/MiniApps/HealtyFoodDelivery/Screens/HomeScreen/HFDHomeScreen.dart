import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../configs/AppDimensions.dart';
import '../../data/data.dart' as data;
import '../../configs/theme.dart' as theme;

import 'Dimensions.dart';
import 'Widgets/BoxItem.dart';
import 'Widgets/FilterBar.dart';
import 'Widgets/ResturantSlider.dart';

class HFDHomeScreen extends StatefulWidget {
  HFDHomeScreen({Key key}) : super(key: key);

  @override
  _HFDHomeScreenState createState() => _HFDHomeScreenState();
}

class _HFDHomeScreenState extends State<HFDHomeScreen> {
  String activeFilter = data.fliters[0];
  int activeBottomNav = 0;

  @override
  initState() {
    Utils.darkStatusBar();
    super.initState();
  }

  @override
  dispose() {
    Utils.lightStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Screen(
        Dimensions.init,
        theme: Theme.of(context).copyWith(
          accentColor: theme.primary,
          primaryColor: theme.primary,
        ),
        bottomNavigationBar: this.buildBottomNavigationBar(),
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontFamily: 'Nunito'),
        builder: (_) => SafeArea(
          top: false,
          child: ListView(
            children: <Widget>[
              this.buildHeader(),
              this.buildFilterBar(),
              this.buildItems(),
              this.buildCategories(),
              this.buildTopResturantsHeading(),
              this.buildTopResturants(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: this.activeBottomNav,
      selectedItemColor: theme.primary,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        setState(() {
          this.activeBottomNav = index;
        });
      },
      items: data.bottomnavList
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item),
              title: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  width: 30,
                  height: 4,
                  transform: Matrix4.identity()..translate(0.0, 4.0),
                  decoration: BoxDecoration(
                    color: (data.bottomnavList[this.activeBottomNav] == item
                        ? theme.primary
                        : Colors.transparent),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      child: Row(
        children: <Widget>[
          Text(
            "Healthy Food",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(child: Container()),
          InkWell(
            onTap: () {},
            child: Icon(MaterialCommunityIcons.search_web),
          )
        ],
      ),
    );
  }

  Widget buildFilterBar() {
    return Container(
      width: Dimensions.chipsContainerWidth,
      constraints: BoxConstraints(
        maxWidth: Dimensions.chipsContainerWidth,
      ),
      padding: EdgeInsets.all(AppDimensions.padding * 1),
      child: FilterBar(this.activeFilter, (filter) {
        setState(() {
          this.activeFilter = filter;
        });
      }),
    );
  }

  Widget buildItems() {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.padding * 4,
        bottom: AppDimensions.padding * 4,
      ),
      // height: 340,
      height: Dimensions.itemBaseHeight,
      child: ListView.builder(
        itemCount: data.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final item = data.items[index];

          return BoxItem(item);
        },
      ),
    );
  }

  Widget buildCategories() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: data.categories
              .map(
                (category) => Ink(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: Dimensions.categoryBaseSize,
                        height: Dimensions.categoryBaseSize,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: Offset(0, 6),
                              color: Colors.black.withOpacity(0.10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: category.margin,
                          child: Icon(
                            category.icon,
                            color: theme.primary,
                            size: category.iconSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 0.8),
                      ),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 8 + AppDimensions.ratio * 4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget buildTopResturantsHeading() {
    return Container(
      padding: EdgeInsets.only(
        top: AppDimensions.padding * 4,
        left: AppDimensions.padding * 2,
      ),
      child: Text(
        "Top Resturants",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildTopResturants() {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        bottom: AppDimensions.padding * 4,
      ),
      child: ResturantSlider(),
    );
  }
}
