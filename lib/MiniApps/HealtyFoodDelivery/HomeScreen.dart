import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_uis/Widgets/HeroText/HeroText.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'theme.dart' as theme;
import 'data.dart' as data;

import 'ItemDetailScreen.dart';
import 'HFDDimensions.dart';
import 'Transitions.dart';

class HealtyFoodDeliveryHomeScreen extends StatefulWidget {
  HealtyFoodDeliveryHomeScreen({Key key}) : super(key: key);

  _HealtyFoodDeliveryHomeScreenState createState() =>
      _HealtyFoodDeliveryHomeScreenState();
}

class _HealtyFoodDeliveryHomeScreenState
    extends State<HealtyFoodDeliveryHomeScreen> {
  int currentIndex = 0;
  String activeFllter = data.fliters[0];

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

  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        UI.init(context);
        HFDDimensions.init(context, orientation);

        final cardHeight = HFDDimensions.cardHeight;
        final cardWidth = cardHeight * .8;
        final cardRWidth = cardWidth * .88;
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: theme.primary,
            accentColor: theme.primary,
          ),
          child: Scaffold(
            backgroundColor: theme.background,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int i) {
                setState(() {
                  currentIndex = i;
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: this.currentIndex,
              items: data.bottomnavList
                  .map(
                    (icon) => BottomNavigationBarItem(
                      icon: Icon(icon),
                      title: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  )
                  .toList(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Healty Food",
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: HFDDimensions.chipsHolderWidth,
                      ),
                      // decoration: BoxDecoration(color: Colors.red),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: data.fliters.map((filter) {
                          final isFilterActive = filter == this.activeFllter;
                          return GestureDetector(
                            onTap: () => setState(() {
                              this.activeFllter = filter;
                            }),
                            child: Chip(
                              elevation: isFilterActive ? 4.0 : 0,
                              label: Text(
                                filter,
                                style: TextStyle(
                                  color: isFilterActive
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              backgroundColor: isFilterActive
                                  ? theme.primary
                                  : theme.background,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: cardHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        addAutomaticKeepAlives: true,
                        itemCount: 5,
                        itemBuilder: (ctx, index) {
                          if (index == 0 || index == 4) {
                            return Container(
                              width: 8,
                              height: cardHeight,
                            );
                          }
                          final itemIndex = index - 1;
                          final item = data.items[itemIndex];
                          return GestureDetector(
                            onTap: () async {
                              Utils.lightStatusBar();
                              await Navigator.of(context).push(
                                new FadePageRoute(
                                  fullscreenDialog: true,
                                  builder: (ctx) =>
                                      new HealtyFoodDeliveryItemDetailScreen
                                          .withIndex(itemIndex),
                                ),
                              );
                              Utils.darkStatusBar();
                            },
                            child: Container(
                              width: cardWidth,
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  ),
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag: "ma-hfd-image-${itemIndex}",
                                    child: Container(
                                      margin: EdgeInsets.all(12.0),
                                      height: cardHeight,
                                      width: cardRWidth,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: ExactAssetImage(item.image),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 1.0,
                                            blurRadius: 4.2,
                                            offset: Offset(0.0, 2.0),
                                            color: Colors.grey[500],
                                          )
                                        ],
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: cardHeight * .58,
                                        ),
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(.44),
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 12,
                                    right: (cardWidth - cardRWidth) - 12,
                                    bottom: 12,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        width: cardRWidth,
                                        // decoration: BoxDecoration(
                                        //   color: Colors.black.withOpacity(.38),
                                        //   borderRadius: BorderRadius.vertical(
                                        //     bottom: Radius.circular(16.0),
                                        //   ),
                                        // ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: DefaultTextStyle(
                                            style:
                                                TextStyle(color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Hero(
                                                  tag:
                                                      "ma-hfd-name-${itemIndex}",
                                                  flightShuttleBuilder: (
                                                    _,
                                                    __,
                                                    HeroFlightDirection
                                                        direction,
                                                    ___,
                                                    ____,
                                                  ) {
                                                    return HeroText(
                                                      title: item.name,
                                                      viewState: direction ==
                                                              HeroFlightDirection
                                                                  .push
                                                          ? ViewState.enlarge
                                                          : ViewState.shrink,
                                                      smallFontSize: 19,
                                                      largeFontSize: 22,
                                                      textStyle: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(.92),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    );
                                                  },
                                                  child: HeroText(
                                                    title: item.name,
                                                    smallFontSize: 19,
                                                    largeFontSize: 22,
                                                    viewState: ViewState.shrunk,
                                                    textStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(.92),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Container(height: 8.0),
                                                Container(
                                                  width: cardRWidth * .8,
                                                  child: Hero(
                                                    tag:
                                                        "ma-hfd-desc-${itemIndex}",
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Text(
                                                        item.description,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(.86),
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(height: 8.0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.star,
                                                      color: theme.primary,
                                                      size: 20,
                                                    ),
                                                    Container(width: 2),
                                                    Text("${item.stars}"),
                                                    Flexible(
                                                      flex: 1,
                                                      child: Container(),
                                                    ),
                                                    Icon(
                                                      MaterialCommunityIcons
                                                          .map_marker_outline,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                    Container(width: 2),
                                                    Text("${item.location} km"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 56,
                                    right: 0,
                                    child: Hero(
                                      tag: "ma-hfd-price-${itemIndex}",
                                      child: Material(
                                        color: theme.primary,
                                        elevation: 5.0,
                                        shape: CircleBorder(),
                                        clipBehavior: Clip.antiAlias,
                                        child: Container(
                                          width: 48,
                                          height: 48,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "\$",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "${item.price}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: HFDDimensions.categoriesHolderWidth,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: data.categories
                            .map(
                              (category) => GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            offset: Offset(0, 2.5),
                                            color:
                                                Colors.black.withOpacity(.13),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Container(
                                          margin: category.margin,
                                          child: Icon(
                                            category.icon,
                                            color: theme.primary,
                                            size: category.iconSize,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(height: 10),
                                    Text(
                                      category.name,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        "Top Resturants",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(height: 8),
                    CarouselSlider(
                      enableInfiniteScroll: false,
                      height: cardHeight * .6,
                      items: data.topResturants
                          .map(
                            (resturant) => Card(
                              child: new Center(
                                child: Text(resturant.name),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Container(
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class HealtyFoodDeliveryHomeScreen extends StatelessWidget {
//   @override
//  }
