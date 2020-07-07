import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import '../../DetailScreen/HABDetailScreen.dart';
import '../../../configs/theme.dart' as theme;
import '../../../data/flights.dart' as data;
import '../Dimensions.dart';

class HABHomeScreenFlightsCarousel extends StatefulWidget {
  HABHomeScreenFlightsCarousel(this.fontStyle);
  final TextStyle fontStyle;

  _HABHomeScreenFlightsCarouselState createState() =>
      _HABHomeScreenFlightsCarouselState();
}

class _HABHomeScreenFlightsCarouselState
    extends State<HABHomeScreenFlightsCarousel> {
  int activeIndex = 0;

  void setActiveIndex(int index) async {
    setState(() {
      activeIndex = index;
    });
    Utils.darkStatusBar();
    await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (ctx) => HABDetailScreen(index),
      ),
    );
    Utils.lightStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Row(
          children: data.flights
              .asMap()
              .map(
                (index, item) {
                  final data.HABFlight item = data.flights[index];
                  final activeTextColor = index == this.activeIndex
                      ? theme.primary
                      : widget.fontStyle.color;

                  return MapEntry(
                    index,
                    GestureDetector(
                      onTap: () => this.setActiveIndex(index),
                      child: Container(
                        width: Dimensions.flightCardWidth,
                        margin: EdgeInsets.all(AppDimensions.padding * 2),
                        padding: EdgeInsets.all(AppDimensions.padding * 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: Offset(0, 6),
                              color: Colors.black.withOpacity(0.2),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              style: widget.fontStyle.copyWith(
                                fontSize: 16,
                                color: activeTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Flight",
                              style: widget.fontStyle.copyWith(
                                fontSize: 15,
                                color: activeTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: AppDimensions.padding,
                              ),
                              child: Text(
                                item.people,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.subText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
