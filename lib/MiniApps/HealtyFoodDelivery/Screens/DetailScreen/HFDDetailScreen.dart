import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

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

    final HFDFoodItem item =
        ModalRoute.of(context)!.settings.arguments as HFDFoodItem;
    final textStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(fontFamily: 'Nunito');

    final baseDuration = Duration(milliseconds: 400);
    final baseTween = Tween(begin: 0.0, end: 1.0);

    final tween = MovieTween()
      ..tween(
        AnimProp.base,
        baseTween,
        duration: baseDuration,
      )
      ..tween(
        AnimProp.circle,
        ConstantTween(0.0),
        duration: Duration(milliseconds: 300),
      )
      ..tween(
        AnimProp.circle,
        baseTween,
        duration: baseDuration,
      )
      ..tween(
        AnimProp.bars,
        ConstantTween(0.0),
        duration: Duration(milliseconds: 300),
      )
      ..tween(
        AnimProp.bars,
        baseTween,
        duration: baseDuration,
      );

    final colorScheme = ColorScheme.fromSwatch().copyWith(
      secondary: theme.primary,
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
          primaryColor: theme.primary,
          colorScheme: colorScheme,
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
                      CustomAnimationBuilder<Movie>(
                        tween: tween,
                        duration: tween.duration,
                        delay: Duration(milliseconds: 400),
                        builder: (context, multiTrackAnimations, child) =>
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
                                SizedBox(
                                  height: AppDimensions.padding * 4,
                                ),
                                Container(
                                  width:
                                      (AppDimensions.miniContainerWidth * 0.7)
                                          .clamp(180.0, 300.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: theme.primary,
                                      padding: EdgeInsets.symmetric(
                                        vertical: AppDimensions.padding * 1.8,
                                      ),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80),
                                      ),
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
