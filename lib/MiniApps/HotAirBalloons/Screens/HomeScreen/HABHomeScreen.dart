import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../configs/theme.dart' as theme;
import 'FlightsCarousel.dart';

class HABHomeScreen extends StatefulWidget {
  HABHomeScreen({Key key}) : super(key: key);

  _HABHomeScreenState createState() => _HABHomeScreenState();
}

class _HABHomeScreenState extends State<HABHomeScreen> {
  renderRedBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: theme.primary,
        ),
      ),
    );
  }

  renderShapesBackground() {
    return Positioned(
      top: UI.vertical * 43,
      bottom: -UI.vertical * 40,
      child: Image.asset(
        "assets/ma-hab/bubbles-bg.png",
        fit: BoxFit.cover,
        width: UI.horizontal * 110,
        alignment: Alignment(-0.4, 0.0),
      ),
    );
  }

  renderBalloonShadowBackground() {
    return Positioned(
      top: -UI.vertical * 2,
      right: -UI.vertical * 18,
      child: ControlledAnimation(
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
                  opacity: .25,
                  child: Image.asset(
                    "assets/ma-hab/balloon-shadow.png",
                    fit: BoxFit.contain,
                    width: UI.horizontal * 100,
                    height: UI.vertical * 90,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  renderBalloonBackground() {
    return Positioned(
      top: -UI.vertical * 12,
      right: -UI.vertical * 10,
      child: ControlledAnimation(
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
                child: Image.asset(
                  "assets/ma-hab/balloon.png",
                  fit: BoxFit.contain,
                  width: UI.horizontal * 100,
                  height: UI.vertical * 80,
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
    UI.init(context);

    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    return Scaffold(
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
              this.renderRedBackground(),
              this.renderShapesBackground(),
              this.renderBalloonShadowBackground(),
              this.renderBalloonBackground(),
              Positioned.fill(
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Cappadocia\nHot Air Balloon",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 8.0,
                          bottom: 8.0,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
