import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'Widgets/Link.dart';
import 'Dimensions.dart';
import 'data.dart' as data;

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      belowBuilder: (context) => this.buildBackground(),
      builder: (_) => Container(
        height: AppDimensions.size.height,
        child: SingleChildScrollView(
          child: Align(
            child: Container(
              padding: EdgeInsets.all(
                AppDimensions.padding * 2,
              ),
              width: AppDimensions.maxContainerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Utils.safePadding(context, "top"),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      "Download will start in browser",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12 + AppDimensions.ratio * 4,
                      ),
                    ),
                  ),
                  ...this.buildPlatformWithLinks("Mobile", data.mobileLinks),
                  ...this.buildPlatformWithLinks("Desktop", data.desktopLinks),
                  ...this.buildPlatformWithLinks("Online", data.webLinks),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackground() {
    return ControlledAnimation(
        tween: ColorTween(
          begin: theme.primary.withOpacity(0.15),
          end: theme.primary.withOpacity(1.0),
        ),
        duration: Duration(milliseconds: 2400),
        playback: Playback.MIRROR,
        builder: (context, animation) {
          return Positioned(
            bottom: AppDimensions.ratio * -10,
            right: AppDimensions.ratio * 5,
            child: Icon(
              MaterialCommunityIcons.cloud_download_outline,
              size: AppDimensions.ratio * 100,
              color: animation,
            ),
          );
        });
  }

  List<Widget> buildPlatformWithLinks(String label, List<Map> links) {
    return [
      Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.padding * 3,
          bottom: AppDimensions.padding * 1,
          left: AppDimensions.padding * 2,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14 + AppDimensions.ratio * 5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Wrap(
        children: links.map((obj) => Link(obj)).toList(),
      ),
    ];
  }
}
