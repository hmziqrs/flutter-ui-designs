import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Mixins/HoverWidget.dart';

import '../../../data/data.dart' as data;
import '../Dimensions.dart';

class Content extends StatefulWidget {
  final double uiRatio;
  final data.ASCItem item;
  final Color activeColor;
  final int activeColorIndex;
  final void Function(Color, int) changeColor;

  Content({
    this.item,
    this.uiRatio,
    this.changeColor,
    this.activeColor,
    this.activeColorIndex,
  });

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int activeSize;
  final List<int> sizes = [7, 8, 9, 10, 11];

  @override
  void initState() {
    this.activeSize = this.sizes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.maxContainerWidth,
      margin: EdgeInsets.only(top: AppDimensions.padding * 2),
      padding: EdgeInsets.all(AppDimensions.padding * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.item.contentHeading,
                    style: TextStyle(
                      fontSize: 8 + AppDimensions.ratio * 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  Text(
                    widget.item.contentSubHeading,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 6 + AppDimensions.ratio * 5,
                    ),
                  ),
                ],
              ),
              this.buildBadge(),
            ],
          ),
          Container(height: AppDimensions.padding * 2),
          this.buildStars(),
          Container(height: AppDimensions.padding * 6),
          Text(
            "SIZE",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 8 + AppDimensions.ratio * 6,
            ),
          ),
          Container(height: AppDimensions.padding * 2),
          this.buildSize(),
          Container(height: AppDimensions.padding * 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              this.buildColorsFilter(),
              this.buildPriceBagde(),
            ],
          ),
          Utils.safePadding(context, "bottom"),
        ],
      ),
    );
  }

  Widget buildBadge() {
    final translate = widget.uiRatio * -25;
    final scale = widget.uiRatio * 0.05;
    final opacity = widget.uiRatio * 0.13;
    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()
          ..translate(translate, scale * 10)
          ..scale(1 - scale),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 5,
          vertical: AppDimensions.padding * 2,
        ),
        decoration: BoxDecoration(
          color: widget.activeColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          "NEW",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 8 + AppDimensions.ratio * 4,
          ),
        ),
      ),
    );
  }

  Widget buildStars() {
    final opacity = widget.uiRatio * 0.15;
    final translateX = widget.uiRatio * -15;
    final translateY = widget.uiRatio * -3;
    final scale = widget.uiRatio * 0.04;

    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()
          ..translate(translateX, translateY)
          ..scale(1 - scale, 1 - scale),
        child: Row(
          children: List.generate(
            5,
            (index) => Icon(
              MaterialCommunityIcons.star,
              size: 18 + AppDimensions.ratio + 10,
              color: widget.item.stars > index
                  ? widget.activeColor
                  : Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSize() {
    final tween = MultiTrackTween([
      Track("background").add(
        Duration(milliseconds: 180),
        ColorTween(
          begin: Colors.transparent,
          end: Colors.black.withOpacity(0.35),
        ),
      ),
      Track("text").add(
        Duration(milliseconds: 180),
        ColorTween(
          begin: Colors.black,
          end: Colors.white,
        ),
      ),
    ]);
    return Row(
      children: this
          .sizes
          .map(
            (size) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: GestureDetector(
                onTap: () => setState(() => (this.activeSize = size)),
                child: ControlledAnimation(
                    tween: tween,
                    duration: tween.duration,
                    playback: this.activeSize == size
                        ? Playback.PLAY_FORWARD
                        : Playback.PLAY_REVERSE,
                    builder: (context, animation) {
                      return Container(
                        width: Dimensions.sizeRadius,
                        height: Dimensions.sizeRadius,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: animation["background"],
                        ),
                        child: Text(
                          size.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: animation["text"],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildColorsFilter() {
    final translate = widget.uiRatio * 8;
    final opacity = widget.uiRatio * 0.14;
    return Opacity(
      opacity: (1.0 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()..translate(translate, translate),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "COLOURS",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 8 + AppDimensions.ratio * 6,
              ),
            ),
            Container(height: AppDimensions.padding * 1),
            Row(
              children: widget.item.colors.map(
                (color) {
                  final index = widget.item.colors.indexOf(color);
                  final offset = Dimensions.colorRadius / 2;

                  return GestureDetector(
                    onTap: () => widget.changeColor(color, index),
                    child: ControlledAnimation(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 180),
                        playback: widget.activeColorIndex == index
                            ? Playback.PLAY_FORWARD
                            : Playback.PLAY_REVERSE,
                        builder: (context, animation) {
                          final innerCircleRadius = Dimensions.colorRadius *
                              Utils.rangeMap(animation, 0.0, 1.0, 0.55, 0.7);

                          return Container(
                            width: Dimensions.colorRadius,
                            height: Dimensions.colorRadius,
                            margin: EdgeInsets.symmetric(
                                horizontal: AppDimensions.padding * 1),
                            child: Stack(
                              children: <Widget>[
                                Transform(
                                  transform: Matrix4.identity()
                                    ..scale(
                                      animation,
                                      animation,
                                    ),
                                  origin: Offset(offset, offset),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: widget.activeColor,
                                        width: AppDimensions.ratio * 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: innerCircleRadius,
                                    height: innerCircleRadius,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPriceBagde() {
    final opacity = widget.uiRatio * 0.14;
    final translate = widget.uiRatio * -8;

    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()..translate(0.0, translate),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 5,
          vertical: AppDimensions.padding * 3.5,
        ),
        decoration: BoxDecoration(
          color: widget.activeColor,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12.0),
          ),
        ),
        child: RichText(
          text: TextSpan(
            text: "USD ",
            style: TextStyle(
              fontSize: 10 + AppDimensions.ratio * 4,
            ),
            children: [
              TextSpan(
                text: widget.item.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
