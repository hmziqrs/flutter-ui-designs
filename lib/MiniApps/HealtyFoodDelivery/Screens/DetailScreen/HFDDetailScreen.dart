import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

import '../../configs/theme.dart' as theme;
import '../../models/HFDFoodItem.dart';
import 'messages/keys.dart';

import 'widgets/HFDDetailScreenBackgroundImageBody.dart';
import 'widgets/HFDDetailScreenBackground.dart';
import 'widgets/HFDDetailScreenHeader.dart';
import 'widgets/HFDDetailScreenBody.dart';
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
    Dimensions.init(context);

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
                HFDDetailScreenBackground(
                  item: item,
                  offset: this.offset,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.coverImageHeight - Dimensions.contentHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      HFDDetailScreenBackgroundImageBody(item: item),
                      ControlledAnimation(
                        tween: tween,
                        duration: tween.duration,
                        delay: Duration(milliseconds: 400),
                        builder: (context, multiTrackAnimations) => Opacity(
                          opacity: multiTrackAnimations["base"],
                          child: Container(
                            transform: Matrix4.identity()
                              ..translate(
                                0.0,
                                Utils.rangeMap(
                                  multiTrackAnimations["base"],
                                  0.0,
                                  1.0,
                                  80,
                                  (-AppDimensions.padding * 8),
                                ),
                              ),
                            child: Column(
                              children: <Widget>[
                                HFDDetailScreenBody(
                                  item: item,
                                  multiTrackAnimations: multiTrackAnimations,
                                ),
                                Container(
                                  height: AppDimensions.padding * 4,
                                ),
                                Container(
                                  width:
                                      (AppDimensions.miniContainerWidth * 0.7)
                                          .clamp(180.0, 300.0),
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
                                      App.translate(
                                        HFDDetailScreenMessages.orderNow,
                                        context,
                                      ),
                                      style: textStyle.copyWith(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Nunito",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: safeOffset < 0 ? 0 : safeOffset,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: safeOffset < 0 ? 0 : safeOffset,
                  ),
                ),
                HFDDetailScreenHeader(),
              ],
            ),
          );
        },
      ),
    );
  }
}
