import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/statics/models/UIItem.dart';

import 'package:flutter_uis/widgets/UICard/UICard.dart';

import 'DesignerProfileHeading.dart';
import '../messages/keys.dart';
import '../Dimensions.dart';

class DesignerProfileMoreUIs extends StatelessWidget {
  DesignerProfileMoreUIs({
    @required this.designer,
    @required this.uiList,
  });

  final UIDesigner designer;
  final List<UIItem> uiList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignerProfileHeading(
          App.translate(DesignerProfileScreenMessages.explore, context),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: uiList
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
