import 'package:flutter/material.dart';
import 'package:flutter_uis/Widgets/Overlay/GradientFade.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/statics/data/uiList.dart';

import 'package:flutter_uis/Widgets/custom/CustomFlexibleSpaceBar.dart';
import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/UIDetailContent.dart';
import 'Dimensions.dart';
import 'Provider.dart';

class UIDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final UIItem uiItem = ModalRoute.of(context).settings.arguments;

    return ChangeNotifierProvider<UIDetailStateProvider>(
      create: (_) => UIDetailStateProvider(),
      child: Screen(
        overlayBuilders: [
          OverlayGradientFade<UIDetailStateProvider>(
            height: Dimensions.cardHeight * 0.6,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + AppDimensions.padding,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: BackButton(
                color: Colors.black,
                onPressed: () => Navigator.of(context).popUntil(
                  ModalRoute.withName("uiList"),
                ),
              ),
            ),
          ),
        ],
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(opacity: 0.0),
              expandedHeight: Dimensions.coverImageHeight,
              flexibleSpace: CustomFlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                stretchModes: [
                  StretchMode.zoomBackground,
                ],
                background: Hero(
                  transitionOnUserGestures: true,
                  tag: "thumbnail-${uiItem.id}",
                  child: Image.asset(
                    uiItem.thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: UIDetailContent(
                uiItem: uiItem,
              ),
            )
          ],
        ),
      ),
    );
  }
}
