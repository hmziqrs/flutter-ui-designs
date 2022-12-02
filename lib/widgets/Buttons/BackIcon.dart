import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/App.dart';

class BackIconButton extends StatelessWidget {
  BackIconButton({
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          this.onPressed != null ? this.onPressed : Navigator.pop(context),
      icon: Icon(
        App.isLtr
            ? MaterialCommunityIcons.chevron_left
            : MaterialCommunityIcons.chevron_right,
      ),
    );
  }
}
