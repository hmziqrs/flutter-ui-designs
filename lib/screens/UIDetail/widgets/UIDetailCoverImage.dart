import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/statics/data/uiList.dart';

import '../Dimensions.dart';

class UIDetailCoverImage extends StatelessWidget {
  UIDetailCoverImage({@required this.scrollOffset, @required this.uiItem});

  final double scrollOffset;
  final UIItem uiItem;

  @override
  Widget build(BuildContext context) {
    double height = Dimensions.coverImageHeight + scrollOffset;
    if (height < 0) {
      height = 0;
    }

    return Hero(
      transitionOnUserGestures: true,
      tag: "thumbnail-${uiItem.id}",
      child: Container(
        transform: Matrix4.identity()..translate(0.0, -scrollOffset),
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(uiItem.thumbnail),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.center,
            begin: Alignment.topCenter,
            stops: [0.15, 1.0],
            colors: [
              AppTheme.primary.withOpacity(0.84),
              AppTheme.primary.withOpacity(0.01),
            ],
          ),
        ),
      ),
    );
  }
}
