import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';

import '../../configs/theme.dart' as theme;
import '../../data/flights.dart' as data;
import 'Widgets/FlightView.dart';
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
      final totalSize = Dimensions.getSize().width * (listSize);
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

  Widget renderHeader(data.HABFlight flight, TextStyle fontStyle) {
    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.headerSpace,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  flight.name,
                  style: fontStyle.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  " Flight",
                  style: fontStyle.copyWith(
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
            this.indicators(),
          ],
        ),
      ),
    );
  }

  renderImageBackground() {
    return Positioned.fill(
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
    );
  }

  indicators() {
    int indexCount = -1;
    return Padding(
      padding: EdgeInsets.only(top: UI.vertical * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.flights.map((f) {
          indexCount++;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indexCount == this.activePage
                  ? theme.primary
                  : theme.indicator,
            ),
          );
        }).toList(),
      ),
    );
  }

  buildPageViews(TextStyle fontStyle) {
    return PageView.builder(
      pageSnapping: true,
      controller: this.pageController,
      itemCount: data.flights.length,
      scrollDirection: Axis.horizontal,
      onPageChanged: this.setActivePage,
      itemBuilder: (context, index) {
        final flight = data.flights[index];
        return FlightView(flight, fontStyle);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    final flight = data.flights[this.activePage];

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
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
      },
      child: OrientationBuilder(builder: (
        BuildContext context,
        Orientation orientation,
      ) {
        UI.init(context);
        Dimensions.init(context, orientation: orientation);
        return Scaffold(
          body: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: theme.primary,
              accentColor: theme.primary,
            ),
            child: DefaultTextStyle(
              style: fontStyle,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  this.renderImageBackground(),
                  this.renderHeader(flight, fontStyle),
                  this.buildPageViews(fontStyle),
                  Positioned.fill(
                    bottom: null,
                    right: null,
                    child: SafeArea(
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        child: BackButton(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
