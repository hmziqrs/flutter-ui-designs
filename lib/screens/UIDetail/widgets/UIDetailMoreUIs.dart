import 'package:flutter/material.dart';

import 'package:flutter_uis/statics/data/uiList.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';
import 'package:flutter_uis/statics/models/UIItem.dart';

import '../messages/keys.dart';
import '../Dimensions.dart';

class UIDetailMoreUIs extends StatelessWidget {
  UIDetailMoreUIs({@required this.uiItem});

  final UIItem uiItem;

  @override
  Widget build(BuildContext context) {
    final moreUis = uilist
        .where((ui) => ui.id != uiItem.id && ui.designer == uiItem.designer);

    if (moreUis.length == 0) {
      return Container();
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.padding),
          child: Text(
            "${App.translate(UIDetailScreenMessages.moreUIs)} ${uiItem.designer}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: moreUis
                .map(
                  (ui) => UICard(
                    ui,
                    isMini: true,
                    padding: AppDimensions.padding * 2,
                    cardWidth: Dimensions.cardWidth,
                    cardHeight: Dimensions.cardHeight,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
