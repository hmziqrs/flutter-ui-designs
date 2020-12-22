import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class UIDetailStateProvider extends FadeScreenProvider {
  static UIDetailStateProvider state(BuildContext context, [listen = false]) =>
      Provider.of<UIDetailStateProvider>(context, listen: listen);
}
