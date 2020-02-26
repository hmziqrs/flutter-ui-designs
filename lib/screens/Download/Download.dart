import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'Widgets/Link.dart';
import 'Dimensions.dart';
import 'data.dart' as data;

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final screenKey = GlobalKey<ScreenState>();
  bool fetching = false;
  bool error = false;
  static Map cache;

  @override
  void initState() {
    super.initState();
    this.fetch();
  }

  fetch({bool force = false}) async {
    try {
      if (this.fetching || (cache != null && !force)) {
        return;
      }

      this.setParams(true, false);

      final url = 'https://flutter-ui-challenges-hgl.firebaseio.com/urls.json';
      final res = await http.Client().get(url);
      this.setParams(false, false);
      setState(() {
        cache = json.decode(res.body) as Map;
      });
    } catch (e) {
      this.setParams(false, true);
      this
          .screenKey
          .currentState
          .showPopUp(message: "Unable to fetch download links");
    }
  }

  setParams(fetching, error) {
    setState(() {
      this.fetching = fetching;
      this.error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      key: this.screenKey,
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      "Download will start in browser",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14 + AppDimensions.ratio * 5,
                      ),
                    ),
                  ),
                  ...this.buildPlatformWithLinks("Mobile", data.mobileLinks),
                  ...this.buildPlatformWithLinks("Desktop", data.desktopLinks),
                  ...this.buildPlatformWithLinks("Online", data.webLinks),
                  this.buildErrorButton(),
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
          end: theme.primary.withOpacity(0.4),
        ),
        duration: Duration(milliseconds: 280),
        playback: this.fetching ? Playback.MIRROR : Playback.PAUSE,
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
        children: links.map((obj) => Link(obj, cache)).toList(),
      ),
    ];
  }

  Widget buildErrorButton() {
    if (!error) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      child: RaisedButton(
        color: theme.primary,
        textColor: Colors.white,
        onPressed: () => this.fetch(force: true),
        child: Text("Fetch again"),
      ),
    );
  }
}
