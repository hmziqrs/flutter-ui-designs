import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'Dimensions.dart';
import 'TestKeys.dart';
import 'Provider.dart';

import 'widgets/SKVDetailScreenSpaceBackground.dart';
import 'widgets/SKVDetailScreenTextContent.dart';
import 'widgets/SKVDetailScreenPlanet.dart';
import 'widgets/SKVDetailScreenOrbit.dart';

class SKVDetailScreen extends StatelessWidget {
  final int index;
  SKVDetailScreen(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UI.init(context);
    Dimensions.init(context);

    return ChangeNotifierProvider<SKVDetailState>(
      create: (_) => SKVDetailState(
        activePage: this.index,
        starsController: ScrollController(),
        pageController: PageController(
          initialPage: this.index,
          keepPage: true,
        ),
      ),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  void onKeyHandler(event) {
    // final duration =
    //     (AppDimensions.size.width * 0.5).clamp(500.0, 800.0).toInt();

    // if (event.runtimeType == RawKeyDownEvent) {
    //   return;
    // }

    // if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
    //     activePage < data.objectList.length - 1) {
    //   this.pageController.animateToPage(
    //         this.activePage + 1,
    //         duration: Duration(milliseconds: duration),
    //         curve: Curves.linear,
    //       );
    // }
    // if (event.logicalKey == LogicalKeyboardKey.arrowLeft && activePage > 0) {
    //   this.pageController.animateToPage(
    //         this.activePage - 1,
    //         duration: Duration(milliseconds: duration),
    //         curve: Curves.linear,
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: 'Montserrat',
        );

    final rootTheme = Theme.of(context).copyWith(
      primaryColor: theme.secondary,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: theme.secondary),
    );

    final state = SKVDetailState.state(context);

    return Screen(
      theme: rootTheme,
      textStyle: fontStyle,
      fontFamily: 'Montserrat',
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: this.onKeyHandler,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SKVDetailScreenSpaceBackground(),
            Selector<SKVDetailState, bool>(
              selector: (_, s) => s.pageRendered,
              builder: (context, pageRendered, _) {
                return Positioned.fill(
                  child: PageView.builder(
                    key: Key(SKVDetailScreenTestKeys.rootScroll),
                    controller: state.pageController,
                    itemCount: data.objectList.length,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) => state.setActivePage(index),
                    pageSnapping: true,
                    physics: pageRendered
                        ? new ClampingScrollPhysics()
                        : new NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      data.SKVObject item = data.objectList[index];
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          SKVDetailScreenOrbit(
                            index: index,
                            pageRendered: pageRendered,
                          ),
                          SKVDetailScreenPlanet(
                            item: item,
                            index: index,
                            pageRendered: pageRendered,
                          ),
                          SKVDetailScreenTextContent(
                            item: item,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
