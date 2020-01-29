import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:simple_animations/simple_animations/animation_controller_x/animation_controller_mixin.dart';
import 'package:simple_animations/simple_animations/animation_task/from_to_task.dart';

class UICard extends StatefulWidget {
  const UICard(
    this.item, {
    this.padding,
    this.cardWidth,
    this.cardHeight,
    this.isMini = false,
  });
  final UIItem item;
  final bool isMini;
  final double padding;
  final double cardWidth;
  final double cardHeight;

  @override
  _UICardState createState() => _UICardState();
}

class _UICardState extends State<UICard> with AnimationControllerMixin {
  bool isFocused = false;
  Animation<double> animation;

  @override
  void initState() {
    this.animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  void onFocus(bool focus) {
    controller.reset([
      FromToTask(
        to: focus ? 1.0 : 0.0,
        duration: Duration(
          milliseconds: 180,
        ),
      )
    ]);
  }

  BoxShadow boxShadow() {
    if (this.widget.isMini) {
      final opacity = Utils.rangeMap(animation.value, 0.0, 1.0, 0.3, 0.5);
      final blurRadius = Utils.rangeMap(animation.value, 0.0, 1.0, 6, 8);
      return BoxShadow(
        spreadRadius: 1.0,
        blurRadius: blurRadius,
        offset: Offset(0.0, 3.0),
        color: Colors.black.withOpacity(opacity),
      );
    } else {
      final opacity = Utils.rangeMap(animation.value, 0.0, 1.0, 0.4, 0.7);
      final blurRadius = Utils.rangeMap(animation.value, 0.0, 1.0, 7, 10);
      return BoxShadow(
        spreadRadius: 0.0,
        blurRadius: blurRadius,
        offset: Offset(0.0, 4.0),
        color: Colors.black.withOpacity(opacity),
      );
    }
  }

  LinearGradient linearGradient() {
    final middle = Utils.rangeMap(animation.value, 0.0, 1.0, 0.18, 0.4);
    final end = Utils.rangeMap(animation.value, 0.0, 1.0, 0.8, 1.0);
    final opacity = Utils.rangeMap(animation.value, 0.0, 1.0, 0.04, 0.15);

    return LinearGradient(
      begin: Alignment.bottomRight,
      stops: [0.0, middle, end],
      colors: [
        theme.primary.withRed(190),
        theme.primary,
        theme.primary.withOpacity(opacity)
      ],
    );
  }

  backgroundImage(BorderRadius borderRadius) {
    return Hero(
      transitionOnUserGestures: true,
      tag: "thumbnail-${this.widget.item.id}",
      child: Container(
        margin: EdgeInsets.all(this.widget.padding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(this.widget.item.thumbnail),
            fit: BoxFit.cover,
          ),
          boxShadow: [this.boxShadow()],
          borderRadius: borderRadius,
        ),
        foregroundDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            decoration: BoxDecoration(
              gradient: this.linearGradient(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(6.0),
    );
    return Container(
      width: this.widget.cardWidth,
      height: this.widget.cardHeight,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          this.backgroundImage(borderRadius),
          Positioned(
            top: this.widget.padding,
            bottom: this.widget.padding,
            right: this.widget.padding,
            left: this.widget.padding,
            child: InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHover: this.onFocus,
              onFocusChange: this.onFocus,
              onTap: () => this.widget.isMini
                  ? Navigator.of(context).pushReplacementNamed(
                      "uiDetail",
                      arguments: this.widget.item,
                    )
                  : Navigator.of(context).pushNamed(
                      "uiDetail",
                      arguments: this.widget.item,
                    ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(this.widget.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        this.widget.item.name,
                        style: TextStyle(
                          fontSize: this.widget.isMini ? 20.0 : 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      !this.widget.isMini
                          ? Text(
                              "By ${this.widget.item.designer}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
