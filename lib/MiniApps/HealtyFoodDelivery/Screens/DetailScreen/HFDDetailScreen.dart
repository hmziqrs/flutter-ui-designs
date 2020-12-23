import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

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
import 'Provider.dart';

enum AnimProp {
  base,
  circle,
  bars,
}

class HFDDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HFDDetailState>(
      create: (_) => HFDDetailState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final HFDFoodItem item = ModalRoute.of(context).settings.arguments;
    final textStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Nunito');

    final baseDuration = Duration(milliseconds: 400);
    final baseTween = Tween(begin: 0.0, end: 1.0);

    MultiTween<AnimProp> tween = MultiTween<AnimProp>()
      ..add(
        AnimProp.base,
        baseTween,
        baseDuration,
      )
      ..add(
        AnimProp.circle,
        ConstantTween(0.0),
        Duration(milliseconds: 300),
      )
      ..add(
        AnimProp.circle,
        baseTween,
        baseDuration,
      )
      ..add(
        AnimProp.bars,
        ConstantTween(0.0),
        Duration(milliseconds: 300),
      )
      ..add(
        AnimProp.bars,
        baseTween,
        baseDuration,
      );

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          HFDDetailState.state(context).setOffset(
            notification.metrics.pixels,
          );
        }
        return true;
      },
      child: Screen(
        theme: Theme.of(context).copyWith(
          accentColor: theme.primary,
          primaryColor: theme.primary,
        ),
        textStyle: textStyle,
        fontFamily: 'Nunito',
        builder: (_) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: <Widget>[
                Consumer<HFDDetailState>(
                  builder: (context, state, child) {
                    return HFDDetailScreenBackground(
                      offset: state.offset,
                      item: item,
                    );
                  },
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
                                  circle: multiTrackAnimations.get(
                                    AnimProp.circle,
                                  ),
                                  bars: multiTrackAnimations.get(
                                    AnimProp.bars,
                                  ),
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
                Consumer<HFDDetailState>(
                  builder: (context, state, child) {
                    final safeOffset =
                        state.getSafe(Dimensions.coverImageHeight);
                    return Padding(
                      padding: EdgeInsets.only(
                        top: safeOffset < 0 ? 0 : safeOffset,
                      ),
                    );
                  },
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
