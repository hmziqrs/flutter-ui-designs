import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

import 'Widgets/DownloadPlatformWithLinks.dart';
import 'data.dart' as data;
import 'messages/keys.dart';
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      belowBuilder: (context) => ControlledAnimation(
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
        },
      ),
      child: Container(
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
                      App.translate(DownloadScreenMessages.title),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12 + AppDimensions.ratio * 4,
                      ),
                    ),
                  ),
                  DownloadPlatformWithLinks(
                    App.translate(DownloadScreenMessages.mobile),
                    data.mobileLinks,
                  ),
                  DownloadPlatformWithLinks(
                    App.translate(DownloadScreenMessages.desktop),
                    data.desktopLinks,
                  ),
                  DownloadPlatformWithLinks(
                    App.translate(DownloadScreenMessages.online),
                    data.webLinks,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
