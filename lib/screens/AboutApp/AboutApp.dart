import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'Dimensions.dart';

class AboutAppScreen extends StatelessWidget {
  Widget text(
    String string, {
    bool point = false,
    TextStyle textStyle,
  }) {
    final color = point ? Colors.black.withOpacity(0.6) : Colors.black;
    TextStyle style = TextStyle(
      fontSize: point ? 13 : 15,
      fontWeight: FontWeight.w600,
      color: color,
    ).merge(textStyle);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding / 1.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          point ? Text(" - ", style: style) : Container(),
          Flexible(
            child: Text(
              string,
              style: style,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext buildCtx) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        Dimensions.init(context, orientation);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: AppDimensions.maxContainerWidth,
                  ),
                  padding: Utils.safePaddingUnit(context, 'vertical').add(
                    EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                      vertical: AppDimensions.padding,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About App",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(AppDimensions.padding / 2)),
                      Text(
                        "Flutter UI Designs is just an experimintal project so please pardon & report any bugs you face",
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                      ),
                      this.text(
                        "I crafted this app becuase I wanted to know flutter's potential to solve real word problems such as.",
                      ),
                      this.text(
                        "True native performance.",
                        point: true,
                      ),
                      this.text(
                        "Smooth 60FPS animations under the heavy load.",
                        point: true,
                      ),
                      this.text(
                        "Difficulty of adapting the languade & framework.",
                        point: true,
                      ),
                      this.text(
                        "Potential to write Flexible & Readable code.",
                        point: true,
                      ),
                      this.text(
                        "Potential to built pixel perfect UI for different screen size/type",
                        point: true,
                      ),
                      this.text(
                        "Is it really a true Cross Platform framework.",
                        point: true,
                      ),
                      this.text(
                        "Is it superior to React Native.",
                        point: true,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                      ),
                      this.text(
                        "Well for starters I fell in love with flutter at first glance because of no native rendering (Same render/behaviour on different platforms) & lightning fast hot reload. There's so much to talk about but I'll get to my conclusion.",
                      ),
                      this.text(
                        "It's very close to native & performance difference isn't noticable.",
                        point: true,
                      ),
                      this.text(
                        "As you can see in UI designs animations are running smooth without any glitches.",
                        point: true,
                      ),
                      this.text(
                        "Someone with Java, Javascript or React Native background it's easy to adapt flutter & dart.",
                        point: true,
                      ),
                      this.text(
                        "Yes, Thanks to the widget system in flutter.",
                        point: true,
                      ),
                      this.text(
                        "Yes, As you can see this app supports variety of screen sizes, landscape & tablet devices.",
                        point: true,
                      ),
                      this.text(
                        "UI part of framework is true cross platform except some native plugin.",
                        point: true,
                      ),
                      this.text(
                        "In terms of performace YES but flutter lacks in popularity at the time of building this app",
                        point: true,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                      ),
                      this.text(
                        "I don't have any copyrights overs designs that's pusblished in this app. I asked for the perimission of designers before I published UIs. And I've gave credit & put every information(as much as I could find) of designers.",
                        textStyle: TextStyle(
                          color: theme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
