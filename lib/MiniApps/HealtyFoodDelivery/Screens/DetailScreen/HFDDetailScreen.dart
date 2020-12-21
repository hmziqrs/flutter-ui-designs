import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

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
import 'data.dart';

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

    final baseDuration = 400.milliseconds;
    final baseTween = 0.0.tweenTo(1.0);
    final delayTween = ConstantTween(0.0);
    final delayDuration = 300.milliseconds;
    final tween = MultiTween<AnimProp>()
      ..add(AnimProp.base, baseTween, baseDuration)
      ..add(AnimProp.circle, delayTween, delayDuration)
      ..add(AnimProp.circle, baseTween, baseDuration)
      ..add(AnimProp.bars, delayTween, delayDuration)
      ..add(AnimProp.bars, baseTween, baseDuration);

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
                      CustomAnimation<MultiTweenValues<AnimProp>>(
                        tween: tween,
                        duration: tween.duration,
                        delay: Duration(milliseconds: 400),
                        child: Container(
                          width: (AppDimensions.miniContainerWidth * 0.7)
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
                        builder: (context, child, multiTrackAnimations) =>
                            Opacity(
                          opacity: multiTrackAnimations.get(AnimProp.base),
                          child: Container(
                            transform: Matrix4.identity()
                              ..translate(
                                0.0,
                                Utils.rangeMap(
                                  multiTrackAnimations.get(AnimProp.base),
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
                                child,
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
