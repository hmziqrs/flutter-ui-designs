import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

class ScreenStateProvider extends ChangeNotifier {
  double baseOffset = UI.height - 20;
  double _offset = UI.height - 20;
  double startOffset = 0.0;

  double get offset => this._offset;

  set offset(double newOffset) {
    this._offset = newOffset;
    notifyListeners();
  }

  void reset() {
    this._offset = this.baseOffset;
    notifyListeners();
  }

  void onLayoutChange() {
    this.baseOffset = UI.height - 20;
    if (this._offset != 0.0) {
      this._offset = UI.height - 20;
      this.startOffset = 0.0;
    }
  }
}
