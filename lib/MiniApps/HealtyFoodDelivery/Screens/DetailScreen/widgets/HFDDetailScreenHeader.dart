import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/utils/Utils.dart';

class HFDDetailScreenHeader extends StatelessWidget {
  HFDDetailScreenHeader();

  @override
  Widget build(BuildContext context) {
    final padding = AppDimensions.padding * 3;
    return Positioned(
      top: padding,
      left: padding,
      right: padding,
      child: Padding(
        padding: Utils.safePaddingUnit(context, "top"),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: BackButton(),
            ),
            Flexible(child: Container()),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(MaterialCommunityIcons.heart_outline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
