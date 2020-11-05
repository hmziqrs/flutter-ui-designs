import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/UI.dart';

import 'ScreenSettingsModalBody.dart';
import '../ScreenStateProvider.dart';

class ScreenSettingsModal extends StatefulWidget {
  ScreenSettingsModal({
    Key key,
    @required this.isSettingsOpen,
    @required this.isSettingsMounted,
  }) : super(key: key);

  final bool isSettingsOpen;
  final bool isSettingsMounted;

  @override
  ScreenSettingsModalState createState() => ScreenSettingsModalState();
}

class ScreenSettingsModalState extends State<ScreenSettingsModal> {
  ScreenStateProvider getState([listen = false]) =>
      Provider.of<ScreenStateProvider>(context, listen: listen);

  void openModal() {
    this.getState().isSettingsOpen = true;
  }

  void closeModal() {
    this.getState().isSettingsOpen = false;
  }

  Future<bool> onWillPop() async {
    if (widget.isSettingsOpen) {
      this.closeModal();
    }
    return !widget.isSettingsOpen;
  }

  Color getBackgroundColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Colors.white.withOpacity(0.40);
    }
    return Colors.black.withOpacity(0.10);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: !widget.isSettingsMounted ? UI.height - 20 : 0.0,
      child: GestureDetector(
        onDoubleTap: this.openModal,
        child: WillPopScope(
          onWillPop: this.onWillPop,
          child: ClipRect(
            child: Container(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: AnimatedOpacity(
                  onEnd: () async {
                    await 200.milliseconds.delay;
                    if (!widget.isSettingsOpen) {
                      this.getState().isSettingsMounted = false;
                    }
                  },
                  duration: 400.milliseconds,
                  opacity: widget.isSettingsOpen ? 1.0 : 0.0,
                  child: Container(
                    alignment: Alignment.topCenter,
                    color: this.getBackgroundColor(context),
                    child: Container(
                      height: UI.height,
                      // width: AppDimensions.containerWidth,
                      child: ScreenSettingsModalBody(
                        onClose: this.closeModal,
                        isModalOpen: widget.isSettingsOpen,
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
