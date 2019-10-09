import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';

import '../DetailScreen/HABDetailScreen.dart';
import '../../configs/theme.dart' as theme;
import '../../data/flights.dart' as data;

class FlightsCarousel extends StatefulWidget {
  FlightsCarousel(this.fontStyle, {Key key}) : super(key: key);

  final TextStyle fontStyle;

  _FlightsCarouselState createState() => _FlightsCarouselState();
}

class _FlightsCarouselState extends State<FlightsCarousel> {
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: data.flights
              .asMap()
              .map(
                (index, item) {
                  final data.Flight item = data.flights[index];
                  final activeTextColor = index == this.activeIndex
                      ? theme.primary
                      : widget.fontStyle.color;

                  return MapEntry(
                    index,
                    GestureDetector(
                      onTap: () => this.setActiveIndex(index),
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        width: UI.safeBlockHorizontal * 42,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              offset: Offset(0, 3),
                              color: Colors.black.withOpacity(.2),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: "hfb-name-${item.id}",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  item.name,
                                  style: widget.fontStyle.copyWith(
                                    fontSize: 16,
                                    color: activeTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              tag: "hfb-flight-${item.id}",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "Flight",
                                  style: widget.fontStyle.copyWith(
                                    fontSize: 15,
                                    color: activeTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.only(
                                top: UI.vertical * .6,
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
