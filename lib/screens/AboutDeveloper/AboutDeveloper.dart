import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperContent.dart';
import 'widgets/AboutDeveloperAvatar.dart';
import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      scaffoldBackgroundColor: theme.darkBackground,
      child: SingleChildScrollView(
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
