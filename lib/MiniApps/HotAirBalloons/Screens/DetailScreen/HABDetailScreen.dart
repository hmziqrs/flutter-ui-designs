import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../configs/theme.dart' as theme;
import '../../data/flights.dart' as data;
import 'FlightView.dart';

class HABDetailScreen extends StatefulWidget {
  HABDetailScreen(this.index, {Key key}) : super(key: key);
  final int index;

  _HABDetailScreenState createState() => _HABDetailScreenState();
}

class _HABDetailScreenState extends State<HABDetailScreen> {
  PageController pageController;
  int activePage;
  Alignment imageAlign;

  @override
  void initState() {
    this.activePage = widget.index;
    this.pageController = PageController(initialPage: widget.index);
    this.imageAlign = Alignment(-1.0, -1.0);
    this.pageController.addListener(() {
      final x = this.pageController.offset;
      if (x < UI.width) {
        setState(() {
          final double calculate = x / UI.width;
          this.imageAlign = Alignment(calculate - 1, -1.0);
        });
      } else if (x > UI.width) {
        final double calculate = (x * .5) / UI.width;
        setState(() {
          this.imageAlign = Alignment(calculate, -calculate);
        });
      }
    });
    super.initState();
  }

  setActivePage(int index) {
    setState(() {
      this.activePage = index;
    });
  }

  imageBackground() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: UI.vertical * 40,
        foregroundDecoration: BoxDecoration(
          color: theme.background2.withOpacity(0.8),
        ),
        child: Image.asset(
          "assets/ma-hab/mountains.png",
          fit: BoxFit.fitHeight,
          alignment: this.imageAlign,
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

  pageViews(TextStyle fontStyle) {
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
    UI.init(context);
    print("SIZE");
    print(Alignment.centerLeft);

    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    final flight = data.flights[this.activePage];

    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: theme.primary,
          accentColor: theme.primary,
          // textTheme: TextTheme(body1: Theme.of(context).textTheme.body1),
        ),
        child: DefaultTextStyle(
          style: fontStyle,
          child: Stack(
            fit: StackFit.expand,
            children: [
              this.imageBackground(),
              Positioned.fill(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      // Container(height: 48),
                      Container(height: UI.vertical * 7),
                      ControlledAnimation(
                        key: Key(this.activePage.toString()),
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 400),
                        builder: (ctx, animation) => Opacity(
                          opacity: animation,
                          child: Row(
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: UI.vertical * 0.4),
                        child: Text(
                          flight.shortDesc,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      this.indicators(),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: this.pageViews(fontStyle),
              ),
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
  }
}
