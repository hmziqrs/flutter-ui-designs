import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/utils/Utils.dart';

class HomeStateProvider extends ChangeNotifier {
  static HomeStateProvider state(BuildContext context, [listen = false]) =>
      Provider.of<HomeStateProvider>(context, listen: listen);

  bool _isWebPopUpOpen = kIsWeb;
  bool get isWebPopUpOpen => this._isWebPopUpOpen;
  setWebPopUpOpen(bool flag) {
    if (flag == this._isWebPopUpOpen) {
      return;
    }
    this._isWebPopUpOpen = flag;
    notifyListeners();
  }

  bool _isDesktopPopUpOpen = Utils.isDesktop();
  bool get isDesktopPopUpOpen => this._isDesktopPopUpOpen;
  setDesktopPopUpOpen(bool flag) {
    if (flag == this._isDesktopPopUpOpen) {
      return;
    }
    this._isDesktopPopUpOpen = flag;
    notifyListeners();
  }
}
