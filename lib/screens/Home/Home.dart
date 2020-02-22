import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'Dimensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool webPopUpMounted;
  double webPopUpOpacity;

  bool desktopPopUpMounted;
  double desktopPopUpOpacity;

  @override
  void initState() {
    this.webPopUpMounted = kIsWeb;
    this.webPopUpOpacity = kIsWeb ? 1 : 0;

    this.desktopPopUpMounted = Utils.isDesktop();
    this.desktopPopUpOpacity = Utils.isDesktop() ? 1 : 0;
    super.initState();
  }

  final list = [
    {
      "label": "Explore UIs",
      "path": 'uiList',
      "icon": Icons.explore,
    },
    {
      "label": "About App",
      "path": "about",
      "icon": Icons.ac_unit,
    },
    {
      "label": "About Developer",
      "path": "aboutDeveloper",
      "icon": Icons.ac_unit
    },
    {
      "label": "Download",
      "path": "download",
      "icon": Icons.ac_unit,
    },
  ];

  Widget buildAlertModal({
    String title,
    String description,
    bool mount,
    double opacity,
    VoidCallback onEnd,
    String primaryText,
    VoidCallback onPrimary,
    String secondaryText,
    VoidCallback onSecondary,
  }) {
    if (!mount) {
      return Container();
    }
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 280),
      onEnd: onEnd,
      child: Positioned.fill(
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.4),
          child: Container(
            margin: EdgeInsets.all(AppDimensions.padding * 3),
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.sta,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black.withOpacity(0.12),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 10.0 + AppDimensions.ratio * 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: <Widget>[
                        primaryText != null
                            ? RaisedButton(
                                color: theme.primary,
                                onPressed: onPrimary,
                                child: Text(
                                  primaryText,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: onSecondary,
                          child: Text(
                            secondaryText,
                            style: TextStyle(
                              color: theme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildNavList(BuildContext context) {
    return list
        .map(
          (item) => Container(
            width: double.infinity,
            child: OutlineButton(
              textColor: theme.primary,
              borderSide: BorderSide(
                width: 1.5,
                color: theme.primary.withOpacity(0.2),
              ),
              highlightedBorderColor: theme.primary.withOpacity(0.8),
              onPressed: () => Navigator.of(context).pushNamed(item["path"]),
              child: Text(
                item["label"],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext buildCtx) {
    return Screen(
      Dimensions.init,
      scaffoldBackgroundColor: Colors.white,
      builder: (_) => SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: AppDimensions.maxContainerWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                  vertical: AppDimensions.padding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Explore elegantly crafted UIs with Google's Flutter designed by creative designers.",
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(AppDimensions.padding)),
                    ...this.buildNavList(context),
                  ],
                ),
              ),
            ),
            this.buildAlertModal(
              title: "Warning",
              description:
                  "Flutter does not have good support for web out of box. That's why you will face bugs and lag. There is nothing wrong with my implementaion becuase every things works well on native apps.\n\nSo for hassle free smooth experience I recommend you to download native app",
              mount: this.webPopUpMounted,
              opacity: this.webPopUpOpacity,
              primaryText: "Download",
              onPrimary: () => Navigator.of(context).pushNamed("download"),
              secondaryText: "Continue",
              onSecondary: () => setState(() => (this.webPopUpOpacity = 0)),
              onEnd: () => setState(() => (this.webPopUpMounted = false)),
            ),
            this.buildAlertModal(
              title: "Alert",
              description:
                  "In some screens 'BackButton' isn't avaible becuase it made UI hideous. So as an alternative I implemented keyboard actions to navigate back.\n\nMacOS: Option + Backspace\nLinux: Alt + Backsoace\nWindows: Ctrl + Backspace",
              mount: this.desktopPopUpMounted,
              opacity: this.desktopPopUpOpacity,
              secondaryText: "Continue",
              onSecondary: () => setState(() => (this.desktopPopUpOpacity = 0)),
              onEnd: () => setState(() => (this.desktopPopUpMounted = false)),
            ),
          ],
        ),
      ),
    );
  }
}
