import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/utils/Utils.dart';
import 'package:flutter_uis/UI.dart';

import '../../data/flights.dart' as data;

class HABDetailState extends ChangeNotifier {
  static HABDetailState state(BuildContext context, [listen = false]) =>
      Provider.of<HABDetailState>(context, listen: listen);

  HABDetailState({this.activePage, this.backgroundController, pageController}) {
    this.pageController = pageController;
    this.pageController.addListener(() {
      final __offset = this.pageController.offset;
      final screenWidth = UI.getSize().width;
      final totalScroll = (data.flights.length - 1) * screenWidth;

      this.backgroundController.jumpTo(
            Utils.rangeMap(
              __offset,
              0,
              totalScroll,
              0,
              this.backgroundController.position.maxScrollExtent,
            ),
          );
      this.setOffset(__offset);
    });

    // this.init();
  }
  init() async {
    await 1400.milliseconds.delay;
    this.pageRendered = true;
    this.notifyListeners();
  }

  int activePage;
  bool pageRendered = false;
  PageController pageController;
  ScrollController backgroundController;

  setActivePage(int index) {
    this.activePage = index;
    this.notifyListeners();
  }

  double _offset = 0.0;
  double get offset => this._offset;
  setOffset(double pixels) {
    this._offset = pixels;
    this.notifyListeners();
  }

  @override
  void dispose() {
    this.pageController.dispose();
    this.backgroundController.dispose();
    super.dispose();
  }
}
