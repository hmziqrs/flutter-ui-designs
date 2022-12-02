import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

abstract class FadeScreenProvider extends ChangeNotifier {
  static FadeScreenProvider state(BuildContext context, [listen = false]) =>
      Provider.of<FadeScreenProvider>(context, listen: listen);
  int dDelay = 300;

  bool _fadeOff = false;
  bool get fadeOff => _fadeOff;
  Future<void> get dDelayD => dDelay.milliseconds.delay;

  void close({required VoidCallback callback, int? delay}) async {
    if (this._fadeOff) {
      return;
    }
    this._fadeOff = true;
    this.notifyListeners();
    await (delay ?? dDelay).milliseconds.delay;
    callback();
  }

  Future<void> show() async {
    if (!this._fadeOff) {
      return;
    }
    this._fadeOff = false;
    this.notifyListeners();
  }

  Future<void> hide({int? delay}) async {
    if (this._fadeOff) {
      return;
    }
    this._fadeOff = true;
    this.notifyListeners();
    await (delay ?? dDelay).milliseconds.delay;
  }
}
