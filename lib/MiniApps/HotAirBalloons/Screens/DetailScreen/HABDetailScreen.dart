import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppTheme.dart';


import 'package:flutter_uis/widgets/BackButton4Stack/BackButton4Stack.dart';
import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/HABDetailScreenFlightHeader.dart';
import 'widgets/HABDetailScreenFlightView.dart';

import '../../data/flights.dart' as data;

import 'Provider.dart';
import 'Dimensions.dart';
import 'TestKeys.dart';

class HABDetailScreen extends StatelessWidget {
  HABDetailScreen(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HABDetailState>(
      create: (_) => HABDetailState(
        activePage: this.index,
        pageController: PageController(
          initialPage: this.index,
          keepPage: true,
        ),
        backgroundController: ScrollController(),
      ),
      child: _HABDetailBody(),
    );
  }
}

class _HABDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final state = HABDetailState.state(context);

    final fontStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontFamily: 'Montserrat',
        );
    final rootTheme = Theme.of(context).copyWith(
      primaryColor: AppTheme.primary,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppTheme.primary),
    );

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      // onKey: this.onKeyHandler,
      child: Screen(
        theme: rootTheme,
        textStyle: fontStyle,
        fontFamily: 'Montserrat',
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Parallax Image Background
            Positioned.fill(
              bottom: null,
              child: Container(
                height: Dimensions.backgroundImageHeight,
                foregroundDecoration: BoxDecoration(
                  color: AppTheme.background.withOpacity(0.44),
                  // color: theme.background2.withOpacity(0.8),
                ),
                child: ListView.builder(
                  itemCount: Dimensions.noOfImages,
                  scrollDirection: Axis.horizontal,
                  controller: state.backgroundController,
                  itemBuilder: (_, i) => Image.asset(
                    "assets/ma-hab/mountains.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            // Header
            Consumer<HABDetailState>(
              builder: (context, consumed, child) {
                return HABDetailScreenFlightHeader(
                  pageViewOffset: consumed.offset,
                  activePage: consumed.activePage,
                );
              },
            ),
            // Horizontal PageView Builder
            PageView.builder(
              pageSnapping: true,
              controller: state.pageController,
              itemCount: data.flights.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: state.setActivePage,
              key: Key(HABDetailScreenTestKeys.rootPageView),
              itemBuilder: (context, index) {
                final flight = data.flights[index];
                return HABDetailScreenFlightView(flight, fontStyle);
              },
            ),
            // Back Button 4 Stack
            BackButton4Stack(),
          ],
        ),
      ),
    );
  }
}
