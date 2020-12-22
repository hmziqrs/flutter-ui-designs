import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/utils/Utils.dart';

import 'TestKeys.dart';

class Header extends StatelessWidget {
  Header({
    this.label,
    this.enableSafePadding = true,
  });

  final String label;
  final bool enableSafePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.enableSafePadding
          ? Utils.safePaddingUnit(context, "top")
          : EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppTheme.lightShadow,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              key: Key(HeaderWidgetKey.backButton),
              child: IconButton(
                icon: Icon(Icons.chevron_left),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) =>
                        route.settings.name !=
                        ModalRoute.of(context).settings.name,
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppDimensions.padding * 2),
              child: Text(
                App.translate(this.label, context),
                style: TextStyles.heading46,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
