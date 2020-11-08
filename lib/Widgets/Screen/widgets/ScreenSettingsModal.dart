import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_uis/Providers/AppProvider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/UI.dart';

import 'ScreenSettingsModalBody.dart';
import '../Provider.dart';

class ScreenSettingsModal extends StatefulWidget {
  ScreenSettingsModal({
    Key key,
    @required this.isSettingsOpen,
  }) : super(key: key);

  final bool isSettingsOpen;

  @override
  ScreenSettingsModalState createState() => ScreenSettingsModalState();
}

class ScreenSettingsModalState extends State<ScreenSettingsModal> {
  bool isSettingsMounted = false;

  @override
  void didUpdateWidget(covariant ScreenSettingsModal oldWidget) {
    if (oldWidget.isSettingsOpen && !widget.isSettingsOpen) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await 400.milliseconds.delay;
        setState(() {
          this.isSettingsMounted = false;
        });
      });
    }
    if (!oldWidget.isSettingsOpen && widget.isSettingsOpen) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        setState(() {
          this.isSettingsMounted = true;
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Color getBackgroundColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Colors.white.withOpacity(0.40);
    }
    return Colors.black.withOpacity(0.10);
  }

  @override
  Widget build(BuildContext context) {
    final state = ScreenStateProvider.state(context);
    final appState = AppProvider.state(context);

    return Positioned.fill(
      top: !this.isSettingsMounted ? UI.height - 20 : 0.0,
      child: GestureDetector(
        // onDoubleTap: ()this.openModal,
        onDoubleTap: () => state.setSettingsOpen(true),
        child: WillPopScope(
          onWillPop: () async {
            if (widget.isSettingsOpen) {
              state.setSettingsOpen(false);
            }
            return !widget.isSettingsOpen;
          },
          child: ClipRect(
            child: Container(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: AnimatedOpacity(
                  onEnd: () async {
                    await 100.milliseconds.delay;
                    if (!widget.isSettingsOpen) {
                      state.setSettingsOpen(false);
                    }
                  },
                  duration: 400.milliseconds,
                  opacity: widget.isSettingsOpen ? 1.0 : 0.0,
                  child: Container(
                    alignment: Alignment.topCenter,
                    color: this.getBackgroundColor(context),
                    child: Container(
                      height: UI.height,
                      child: ScreenSettingsModalBody(
                        appState: appState,
                        isModalOpen: widget.isSettingsOpen,
                        onClose: () => state.setSettingsOpen(false),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
