import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_uis/UI.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/utils/Utils.dart';

import '../../data/data.dart' as data;

class SKVDetailState extends ChangeNotifier {
  static SKVDetailState state(BuildContext context, [listen = false]) =>
      Provider.of<SKVDetailState>(context, listen: listen);

  SKVDetailState({this.activePage, this.starsController, pageController}) {
    this.pageController = pageController;
    this.pageController.addListener(() {
      final __offset = this.pageController.offset;
      final screenWidth = UI.getSize().width;
      final totalScroll = (data.objectList.length - 1) * screenWidth;
      final starsWidget = this.starsWidgetKey.currentContext;
      this.setOffset(__offset);

      if (starsWidget != null) {
        final starsOffset = starsWidget.size.width - screenWidth;
        this.starsController.jumpTo(
              Utils.rangeMap(
                __offset,
                0,
                totalScroll,
                0,
                starsOffset,
              ),
            );
      }
    });

    this.init();
  }
  init() async {
    await 1400.milliseconds.delay;
    this.pageRendered = true;
    this.notifyListeners();
  }

  int activePage;
  bool pageRendered = false;
  PageController pageController;
  ScrollController starsController;
  GlobalKey starsWidgetKey = GlobalKey();

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
    this.starsController.dispose();
    super.dispose();
  }
}
