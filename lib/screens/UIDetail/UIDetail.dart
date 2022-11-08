import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:flutter_uis/widgets/ScreenAnimation/Base.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/statics/data/uiList.dart';

import 'package:flutter_uis/widgets/custom/CustomFlexibleSpaceBar.dart';
import 'package:flutter_uis/widgets/Overlay/GradientFade.dart';
import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/UIDetailContent.dart';
import 'Dimensions.dart';
import 'Provider.dart';

class UIDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return ChangeNotifierProvider<UIDetailStateProvider>(
      create: (_) => UIDetailStateProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  void onClose(BuildContext context) =>
      UIDetailStateProvider.state(context).close(callback: () {
        Navigator.of(context).popUntil(
          ModalRoute.withName("uiList"),
        );
      });

  @override
  Widget build(BuildContext context) {
    final UIItem uiItem = ModalRoute.of(context)!.settings.arguments! as UIItem;

    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        this.onClose(context);
        return false;
      },
      child: Screen(
        overlayBuilders: [
          OverlayGradientFade<UIDetailStateProvider>(
            height: (Dimensions.cardHeight * 0.6) +
                MediaQuery.of(context).padding.top,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + AppDimensions.padding,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: ScreenAnimationBase<UIDetailStateProvider>(
                delay: 500,
                builder: (_, animation, child) {
                  return Opacity(
                    child: child,
                    opacity: animation,
                  );
                },
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                    uiItem.thumbnail!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
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
