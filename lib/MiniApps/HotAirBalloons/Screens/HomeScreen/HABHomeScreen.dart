import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations/controlled_animation.dart';

import 'package:flutter_uis/UI.dart';

import '../../configs/theme.dart' as theme;
import 'Widgets/FlightsCarousel.dart';
import 'Dimensions.dart';

class HABHomeScreen extends StatefulWidget {
  HABHomeScreen();

  _HABHomeScreenState createState() => _HABHomeScreenState();
}

class _HABHomeScreenState extends State<HABHomeScreen> {
  Widget renderShapesBackground() {
    return Positioned(
      child: Transform(
        transform: Dimensions.shapeTransform,
        // ..translate(-10.0),
        child: Image.asset(
          "assets/ma-hab/bubbles-bg.png",
          // repeat: ImageRepeat.repeatX,
          // alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget renderBalloonShadowBackground() {
    return Positioned(
      top: Dimensions.balloonShadowOffset.dy,
      right: Dimensions.balloonShadowOffset.dx,
      child: this.balloonWrapper(
        "assets/ma-hab/balloon-shadow.png",
        Dimensions.balloonShadowSize,
        opacity: 0.3,
      ),
    );
  }

  Widget renderBalloonBackground() {
    return Positioned(
      top: Dimensions.balloonOffset.dy,
      right: Dimensions.balloonOffset.dx,
      child: this.balloonWrapper(
        "assets/ma-hab/balloon.png",
        Dimensions.balloonSize,
        opacity: 1.0,
      ),
    );
  }

  Widget renderContent(TextStyle fontStyle) {
    return Positioned.fill(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: Dimensions.padding * 2),
              child: Text(
                "Cappadocia\nHot Air Balloon",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.padding * 2,
                top: Dimensions.padding,
                bottom: Dimensions.padding,
              ),
              child: Text(
                "Once in a lifetime adventure",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FlightsCarousel(fontStyle),
          ],
        ),
      ),
    );
  }

  balloonWrapper(String imagePath, Size imageSize, {double opacity = 1.0}) {
    return ControlledAnimation(
      delay: Duration(milliseconds: 100),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 1800),
      builder: (ctx, animation) => Opacity(
        opacity: animation,
        child: Transform.scale(
          scale: animation,
          origin: Offset(0, 300),
          child: ControlledAnimation(
            playback: Playback.MIRROR,
            delay: Duration(milliseconds: 2200),
            tween: Tween(begin: -40.0, end: 10.0),
            duration: Duration(milliseconds: 2800),
            builder: (ctx, translate) => Transform.translate(
              offset: Offset(0, translate),
              child: Opacity(
                opacity: opacity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: imageSize.width,
                  height: imageSize.height,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        UI.init(context);
        Dimensions.init(context, orientation: orientation);

        return Scaffold(
          backgroundColor: theme.primary,
          body: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: theme.primary,
              accentColor: theme.primary,
              // textTheme: TextTheme(body1: Theme.of(context).textTheme.body1),
            ),
            child: DefaultTextStyle(
              style: fontStyle,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // this.renderRedBackground(),
                  this.renderShapesBackground(),
                  this.renderBalloonShadowBackground(),
                  this.renderBalloonBackground(),
                  this.renderContent(fontStyle),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
