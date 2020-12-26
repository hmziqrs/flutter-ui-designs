import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../data/data.dart' as data;
import 'messages/keys.dart';
import 'Dimensions.dart';
import 'TestKeys.dart';

class CCNHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Screen(
      child: ListView(
        children: [Text("WORKS")],
      ),
    );
  }
}
