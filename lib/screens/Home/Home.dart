import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:provider/provider.dart';

import 'Provider.dart';
import 'widgets/HomeAlertModal.dart';

import 'messages/keys.dart';
import 'Dimensions.dart';
import 'widgets/HomeBody.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return ChangeNotifierProvider<HomeStateProvider>(
      create: (_) => HomeStateProvider(),
      child: Screen(
        scaffoldBackgroundColor: Colors.white,
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              HomeBody(),
              Selector<HomeStateProvider, bool>(
                selector: (_, state) => state.isWebPopUpOpen,
                builder: (context, isWebPopUpOpen, snapshot) {
                  return HomeAlertModal(
                    title: App.translate(
                      HomeScreenMessages.modalWebTitle,
                      context,
                    ),
                    description: App.translate(
                      HomeScreenMessages.modalWebDesc,
                      context,
                    ),
                    primaryText: App.translate(
                      HomeScreenMessages.modalWebButton1,
                      context,
                    ),
                    secondaryText: App.translate(
                      HomeScreenMessages.modalWebButton2,
                      context,
                    ),
                    initialMount: kIsWeb,
                    isOpen: isWebPopUpOpen,
                    onPrimary: () =>
                        Navigator.of(context).pushNamed("download"),
                    onSecondary: () =>
                        HomeStateProvider.state(context).setWebPopUpOpen(false),
                  );
                },
              ),
              Selector<HomeStateProvider, bool>(
                selector: (_, state) => state.isDesktopPopUpOpen,
                builder: (context, isDesktopPopUpOpen, snapshot) {
                  return HomeAlertModal(
                    title: App.translate(
                      HomeScreenMessages.modalDesktopTitle,
                      context,
                    ),
                    description: App.translate(
                      HomeScreenMessages.modalDesktopDesc,
                      context,
                    ),
                    secondaryText: App.translate(
                      HomeScreenMessages.modalDesktopButton,
                      context,
                    ),
                    initialMount: Utils.isDesktop(),
                    isOpen: isDesktopPopUpOpen,
                    onPrimary: () =>
                        Navigator.of(context).pushNamed("download"),
                    onSecondary: () => HomeStateProvider.state(context)
                        .setDesktopPopUpOpen(false),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
