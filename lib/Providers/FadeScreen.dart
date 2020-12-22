import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class FadeScreenProvider extends ChangeNotifier {
  static FadeScreenProvider state(BuildContext context, [listen = false]) =>
      Provider.of<FadeScreenProvider>(context, listen: listen);

  bool _fadeOff = false;
  bool get fadeOff => _fadeOff;

  close({VoidCallback callback, int delay = 700}) async {
    if (!this._fadeOff) {
      return;
    }
    this._fadeOff = false;
    await delay.milliseconds.delay;
    callback();
    notifyListeners();
  }
}
