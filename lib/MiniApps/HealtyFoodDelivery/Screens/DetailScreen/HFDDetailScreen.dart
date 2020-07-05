import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../configs/theme.dart' as theme;
import '../../models/HFDFoodItem.dart';

import 'Dimensions.dart';

class HFDDetailScreen extends StatefulWidget {
  HFDDetailScreen({Key key}) : super(key: key);

  @override
  _HFDDetailScreenState createState() => _HFDDetailScreenState();
}

class _HFDDetailScreenState extends State<HFDDetailScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  double offset = 0.0;

  @override
  initState() {
    Utils.lightStatusBar();

    this.scrollController.addListener(() {
      setState(() {
        this.offset = this.scrollController.offset;
      });
    });

    super.initState();
  }

  @override
  dispose() {
    Utils.darkStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HFDFoodItem item = ModalRoute.of(context).settings.arguments;
    final textStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Nunito');

    final baseDuration = Duration(milliseconds: 400);
    final baseTween = Tween(begin: 0.0, end: 1.0);
    final tween = MultiTrackTween([
      Track("base").add(baseDuration, baseTween),
      Track("circle")
          .add(Duration(milliseconds: 300), ConstantTween(0.0))
          .add(baseDuration, baseTween),
      Track("bars")
          .add(Duration(milliseconds: 300), ConstantTween(0.0))
          .add(baseDuration, baseTween),
    ]);

    return Container(
      child: Screen(
        Dimensions.init,
        theme: Theme.of(context).copyWith(
          accentColor: theme.primary,
          primaryColor: theme.primary,
        ),
        textStyle: textStyle,
        builder: (_) {
          double safeOffset = this.offset;

          if (safeOffset > Dimensions.coverImageHeight) {
            safeOffset = Dimensions.coverImageHeight;
          }

          return SingleChildScrollView(
            controller: this.scrollController,
            child: Stack(
              children: <Widget>[
                this.buildBackgroundImage(item),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.coverImageHeight - Dimensions.contentHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      this.buildBackgroundImageBody(item),
                      ControlledAnimation(
                        tween: tween,
                        duration: tween.duration,
                        delay: Duration(milliseconds: 400),
                        builder: (context, multiTrack) => Opacity(
                          opacity: multiTrack["base"],
                          child: Container(
                            transform: Matrix4.identity()
                              ..translate(
                                0.0,
                                Utils.rangeMap(
                                  multiTrack["base"],
                                  0.0,
                                  1.0,
                                  80,
                                  (-AppDimensions.padding * 8),
                                ),
                              ),
                            child: Column(
                              children: <Widget>[
                                this.buildBody(item, multiTrack),
                                Container(
                                  height: AppDimensions.padding * 4,
                                ),
                                this.buildOrderButton(textStyle),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: safeOffset < 0 ? 0 : safeOffset),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: safeOffset < 0 ? 0 : safeOffset),
                ),
                this.buildHeader(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildHeader() {
    final padding = AppDimensions.padding * 3;
    return Positioned(
      top: padding,
      left: padding,
      right: padding,
      child: Padding(
        padding: Utils.safePaddingUnit(context, "top"),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: BackButton(),
            ),
            Flexible(child: Container()),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(MaterialCommunityIcons.heart_outline),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBackgroundImage(HFDFoodItem item) {
    double height = Dimensions.coverImageHeight + (this.offset * -1);

    if (height < 0) {
      height = 0;
    }

    return Container(
      height: height,
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()..translate(0.0, this.offset),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.transparent,
          child: Container(
            width: AppDimensions.miniContainerWidth * 1.1,
            height: double.infinity,
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackgroundImageBody(HFDFoodItem item) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: Dimensions.contentHeight,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
      ),
      child: Container(
        height: double.infinity,
        width: AppDimensions.miniContainerWidth,
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        margin: EdgeInsets.only(bottom: AppDimensions.padding * 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: List.generate(5, (index) {
                    bool active = item.stars.floor().clamp(1, 5) < (index + 1);
                    return Container(
                      child: Icon(
                        active
                            ? MaterialCommunityIcons.star_outline
                            : MaterialCommunityIcons.star,
                        color: theme.primary,
                      ),
                    );
                  }),
                ),
                Flexible(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    color: theme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 4,
                    vertical: AppDimensions.padding * 1.5,
                  ),
                  child: Text(
                    "\$ ${item.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(height: AppDimensions.padding * 3),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 12 + AppDimensions.ratio * 8,
                color: Colors.white.withOpacity(
                  0.88,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(height: AppDimensions.padding),
            Expanded(
              child: Text(
                item.description,
                // maxLines: 9,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(HFDFoodItem item, dynamic multiTrack) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      width: (AppDimensions.miniContainerWidth - AppDimensions.padding * 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              offset: Offset(0.0, 4.0),
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimensions.padding * 2),
            child: Text(
              "Nutirion Fact",
              style: TextStyle(
                fontSize: 10 + AppDimensions.ratio * 5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(
                  left: AppDimensions.padding * 2,
                  right: AppDimensions.padding * 2,
                ),
                child: CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 4.5,
                  center: new Text(
                    "${item.kcal.toStringAsFixed(0)}",
                  ),
                  progressColor: theme.primary,
                  percent: multiTrack["circle"],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${item.kcal.toStringAsFixed(0)} kcal",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${item.dailyCal}% of daily calories",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          this.buildLinearBar(item.carbo, "Carbo", multiTrack["bars"]),
          this.buildLinearBar(item.protien, "Protien", multiTrack["bars"]),
          this.buildLinearBar(item.fat, "fat", multiTrack["bars"]),
        ],
      ),
    );
  }

  Widget buildLinearBar(int no, String label, double animate) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
        vertical: AppDimensions.padding * 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 4 + AppDimensions.ratio * 1,
                child: LinearProgressIndicator(
                  value: Utils.rangeMap(animate, 0.0, 1.0, 0.0, no / 100),
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Text(
                "$no%",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 5 + AppDimensions.ratio * 3,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: AppDimensions.padding * 2),
              width: double.infinity,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 5 + AppDimensions.ratio * 4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildOrderButton(TextStyle textStyle) {
    return Container(
      width: (AppDimensions.miniContainerWidth * 0.7).clamp(180.0, 300.0),
      child: RaisedButton(
        onPressed: () {},
        color: theme.primary,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding * 1.8,
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        child: Text(
          "Order Now",
          style: textStyle.copyWith(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "Nunito",
          ),
        ),
      ),
    );
  }
}
