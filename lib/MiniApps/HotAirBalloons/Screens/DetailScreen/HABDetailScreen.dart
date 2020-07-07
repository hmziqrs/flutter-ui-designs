import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/Widgets/BackButton4Stack/BackButton4Stack.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import '../../configs/theme.dart' as theme;
import '../../data/flights.dart' as data;
import 'widgets/HABDetailScreenFlightView.dart';
import 'Dimensions.dart';

class HABDetailScreen extends StatefulWidget {
  HABDetailScreen(this.index, {Key key}) : super(key: key);
  final int index;

  _HABDetailScreenState createState() => _HABDetailScreenState();
}

class _HABDetailScreenState extends State<HABDetailScreen> {
  PageController pageController;
  int activePage;
  double imageAlign;

  @override
  void initState() {
    int listSize = data.flights.length - 1;

    this.activePage = widget.index;
    this.pageController = PageController(initialPage: widget.index);
    this.imageAlign = this.imageAlign = Utils.rangeMap(
        widget.index.toDouble(), 0, listSize.toDouble(), -1.0, 1.0);

    this.pageController.addListener(() {
      final offset = this.pageController.offset;
      final totalSize = UI.width * (listSize);
      setState(() {
        this.imageAlign = Utils.rangeMap(offset, 0, totalSize, -1.0, 1.0);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    this.pageController.dispose();
    super.dispose();
  }

  setActivePage(int index) {
    setState(() {
      this.activePage = index;
    });
  }

  void onKeyHandler(RawKeyEvent event) {
    final key = event.logicalKey.debugName;
    final rightKeys = ['Key K', 'Arrow Right'];
    final leftKeys = ['Key I', 'Arrow Left'];

    if (event.runtimeType.toString() == 'RawKeyUpEvent') {
      if (rightKeys.contains(key) && activePage < data.flights.length - 1) {
        this.pageController.animateToPage(
              this.activePage + 1,
              duration: Duration(milliseconds: 280),
              curve: Curves.easeIn,
            );
      } else if (leftKeys.contains(key) && activePage > 0) {
        this.pageController.animateToPage(
              this.activePage - 1,
              duration: Duration(milliseconds: 280),
              curve: Curves.easeIn,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Montserrat',
        );
    final rootTheme = Theme.of(context).copyWith(
      primaryColor: theme.primary,
      accentColor: theme.primary,
    );

    final flight = data.flights[this.activePage];

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: this.onKeyHandler,
      child: Screen(
        Dimensions.init,
        textStyle: fontStyle,
        theme: rootTheme,
        builder: (_) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Parallax Image Background
              Positioned.fill(
                bottom: null,
                child: Container(
                  height: Dimensions.backgroudImageHeight,
                  foregroundDecoration: BoxDecoration(
                    color: theme.background2.withOpacity(0.8),
                  ),
                  child: Image.asset(
                    "assets/ma-hab/mountains.jpg",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment(this.imageAlign, 0.0),
                    repeat: ImageRepeat.repeatX,
                  ),
                ),
              ),
              // Header
              Positioned(
                left: 0,
                right: 0,
                top: Dimensions.headerSpace,
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            flight.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            " Flight",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        flight.shortDesc,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      this.buildIndicators(),
                    ],
                  ),
                ),
              ),
              // Horizontal PageView Builder
              PageView.builder(
                pageSnapping: true,
                controller: this.pageController,
                itemCount: data.flights.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: this.setActivePage,
                itemBuilder: (context, index) {
                  final flight = data.flights[index];
                  return HABDetailScreenFlightView(flight, fontStyle);
                },
              ),
              // Back Button 4 Stack
              BackButton4Stack(),
            ],
          );
        },
      ),
    );
  }

  buildIndicators() {
    return Padding(
      padding: EdgeInsets.only(top: UI.vertical * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.flights
            .asMap()
            .entries
            .map(
              (entry) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 0.5,
                ),
                width: AppDimensions.ratio * 3.5,
                height: AppDimensions.ratio * 3.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: entry.key == this.activePage
                      ? theme.primary
                      : theme.indicator,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
