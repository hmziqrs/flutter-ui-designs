import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class HFDHomeState extends ChangeNotifier {
  static HFDHomeState state(BuildContext context, [listen = false]) =>
      Provider.of<HFDHomeState>(context, listen: listen);

  int _activeTab = 0;
  int get activeTab => this._activeTab;
  setActiveTab(int tab) {
    if (tab == this._activeTab) {
      return;
    }
    this._activeTab = tab;
    notifyListeners();
  }
}
