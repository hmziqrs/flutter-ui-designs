import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperContent.dart';
import 'widgets/AboutDeveloperAvatar.dart';
import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  final screenKey = GlobalKey<ScreenState>();

  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      key: this.screenKey,
      scaffoldBackgroundColor: theme.darkBackground,
      builder: (_) => SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            AboutDeveloperContent(),
            AboutDeveloperAvatar(),
            Positioned(
              child: Padding(
                padding: Utils.safePaddingUnit(context, "all"),
                child: BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
