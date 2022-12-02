import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HFDDetailState extends ChangeNotifier {
  static HFDDetailState state(BuildContext context, [listen = false]) =>
      Provider.of<HFDDetailState>(context, listen: listen);

  double _offset = 0.0;

  double get offset => this._offset;
  setOffset(double x) {
    this._offset = x;
    notifyListeners();
  }

  getSafe(double max) {
    double safeOffset = this.offset;
    if (safeOffset > max) {
      safeOffset = max;
    }
    return safeOffset;
  }
}
