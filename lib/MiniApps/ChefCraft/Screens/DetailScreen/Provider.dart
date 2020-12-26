import 'package:flutter/material.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';
import 'package:provider/provider.dart';

class CCNDetailState extends FadeScreenProvider {
  static CCNDetailState state(BuildContext context, [listen = false]) =>
      Provider.of<CCNDetailState>(context, listen: listen);

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
