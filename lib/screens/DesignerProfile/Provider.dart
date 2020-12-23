import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class DesignerProfileStateProvider extends FadeScreenProvider {
  static DesignerProfileStateProvider state(BuildContext context,
          [listen = false]) =>
      Provider.of<DesignerProfileStateProvider>(context, listen: listen);
}
