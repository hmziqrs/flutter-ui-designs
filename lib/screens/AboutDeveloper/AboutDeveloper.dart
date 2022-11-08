import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/io/io.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperBody.dart';

import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        Navigator.popUntil(
          context,
          (route) =>
              route.settings.name != ModalRoute.of(context)!.settings.name,
        );
        return false;
      },
      child: Screen(
        child: AboutDeveloperBody(),
      ),
    );
  }
}
