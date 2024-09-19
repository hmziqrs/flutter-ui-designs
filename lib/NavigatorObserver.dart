import 'package:flutter/material.dart';

class AppNavigatorObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) async {
    // var screenName = route.settings.name;
    // final context = route.navigator.context;
    // await 1200.milliseconds.delay;
    // // StatusBarHandler.init(context, screenName);
    // UIUtils.lightStatusBar();
    // await 1200.milliseconds.delay;
    // UIUtils.lightStatusBar();
    // print('screenName $screenName');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // print('super.didReplace');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // print('super.didPop');
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}
