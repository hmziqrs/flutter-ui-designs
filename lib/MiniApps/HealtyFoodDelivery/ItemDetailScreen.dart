import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/UI.dart';
import 'HFDDimensions.dart';

import 'theme.dart' as theme;
import 'data.dart' as data;

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class HealtyFoodDeliveryItemDetailScreen extends StatefulWidget {
  HealtyFoodDeliveryItemDetailScreen.withIndex(this.index);
  HealtyFoodDeliveryItemDetailScreen() : index = null;
  final int index;

  _HealtyFoodDeliveryItemDetailScreenState createState() =>
      _HealtyFoodDeliveryItemDetailScreenState();
}

class _HealtyFoodDeliveryItemDetailScreenState
    extends State<HealtyFoodDeliveryItemDetailScreen> {
  final stars = [1.0, 2.0, 3.0, 4.0, 5.0].asMap();
  final baseDelay = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context).settings.arguments ?? widget.index;

    final item = data.items[index];
    // final backgroundImageSize = MediaQuery.of(context).size.height * .68;
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        UI.init(context);
        HFDDimensions.init(context, orientation);

        final backgroundImageSize = HFDDimensions.backgroundImageHeight;

        final contentSpace = HFDDimensions.contentSpace;

        final nutritionTween = MultiTrackTween([
          Track("cardPosition").add(
            Duration(milliseconds: 400),
            Tween(
              begin: backgroundImageSize * .6,
              end: contentSpace,
            ),
          ),
          Track("cardOpacity").add(
            Duration(milliseconds: 400),
            Tween(
              begin: 0.0,
              end: 1.0,
            ),
          ),
          ...[
            {"key": "dailyCal", "value": "${item.dailyCal}"},
            {"key": "carbo", "value": "${item.carbo}"},
            {"key": "protien", "value": "${item.protien}"},
            {"key": "fat", "value": "${item.fat}"},
          ]
              .asMap()
              .map(
                (index, tw) => MapEntry(
                  index,
                  Track(tw["key"])
                      .add(
                        Duration(milliseconds: 200 + (0)),
                        ConstantTween(0.0),
                      )
                      .add(
                        Duration(milliseconds: 400 + ((160 * index))),
                        Tween(
                          begin: 0.0,
                          end: double.parse(tw["value"]) * 0.01,
                        ),
                      ),
                ),
              )
              .values
              .toList(),
        ]);

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: "ma-hfd-image-${index}",
                  child: Container(
                    height: backgroundImageSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage(item.image),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: contentSpace,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.44),
                      ),
                    ),
                  ),
                ),
              ),
              ControlledAnimation(
                delay: this.baseDelay,
                duration: Duration(milliseconds: 380),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeInOut,
                builder: (ctx, animation) => Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Transform.scale(
                        scale: animation,
                        child: BackButton(
                          color: Colors.white,
                        ),
                      ),
                      Transform.scale(
                        scale: animation,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          child: Icon(MaterialCommunityIcons.heart_outline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: contentSpace,
                left: 0,
                right: HFDDimensions.contentRightPadding,
                child: Container(
                  height: backgroundImageSize - contentSpace,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: this
                                  .stars
                                  .map(
                                    (index, star) => MapEntry(
                                      index,
                                      ControlledAnimation(
                                        delay: this.baseDelay,
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        duration: Duration(
                                          milliseconds: 200 + (160 * index),
                                        ),
                                        builder: (ctx, animation) => Opacity(
                                          opacity: animation,
                                          child: Icon(
                                            item.stars >= star
                                                ? MaterialCommunityIcons.star
                                                : MaterialCommunityIcons
                                                    .star_outline,
                                            color: theme.primary,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
                            ),
                            Hero(
                              tag: "ma-hfd-price-${index}",
                              child: Material(
                                color: theme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  width: 95,
                                  height: 41,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "\$",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${item.price}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Hero(
                          tag: "ma-hfd-name-${index}",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              item.name,
                              style: TextStyle(
                                color: Colors.white.withOpacity(.92),
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Hero(
                          tag: "ma-hfd-desc-${index}",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              item.description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(.86),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ControlledAnimation(
                key: Key(orientation.toString()),
                curve: Curves.easeIn,
                tween: nutritionTween,
                duration: nutritionTween.duration,
                delay: Duration(milliseconds: 280),
                builder: (ctx, animation) => Positioned(
                  top: animation["cardPosition"],
                  left: HFDDimensions.statsLeftPadding,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: animation["cardOpacity"],
                    child: Container(
                      // decoration:
                      //     BoxDecoration(color: Colors.blue.withOpacity(.5)),
                      child: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: HFDDimensions.statsTopScrollPadding,
                                // decoration: BoxDecoration(color: Colors.blue),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, 0, 0.0),
                                margin: EdgeInsets.all(24),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                            color:
                                                Colors.black.withOpacity(.26),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, bottom: 16.0),
                                            child: Text(
                                              "Nutrition Facts",
                                              style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              CircularPercentIndicator(
                                                radius: 52.0,
                                                lineWidth: 4.5,
                                                center: new Text(
                                                    "${item.kcal.toStringAsFixed(0)}"),
                                                progressColor: theme.primary,
                                                percent: animation["dailyCal"],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "${item.kcal.toStringAsFixed(0)} kcal",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "${item.dailyCal}% of daily calories",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(height: 16),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                child: LinearPercentIndicator(
                                                  percent: animation["carbo"],
                                                  lineHeight: 6,
                                                  progressColor: theme.primary,
                                                ),
                                                flex: 1,
                                              ),
                                              Text(
                                                "${item.carbo}%  ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "Carbo",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(height: 16),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                child: LinearPercentIndicator(
                                                  percent: animation["protien"],
                                                  lineHeight: 6,
                                                  progressColor: theme.primary,
                                                ),
                                                flex: 1,
                                              ),
                                              Text(
                                                "${item.protien}%  ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "Protien",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(height: 16),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                child: LinearPercentIndicator(
                                                  percent: animation["fat"],
                                                  lineHeight: 6,
                                                  progressColor: theme.primary,
                                                ),
                                                flex: 1,
                                              ),
                                              Text(
                                                "${item.fat}%  ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "Fat",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 24.0,
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      color: theme.primary,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 46, vertical: 12),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                      ),
                                      child: Text(
                                        "Order Now",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // decoration: BoxDecoration(color: Colors.red),
                                height: HFDDimensions.statsBottomScrollPadding,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
