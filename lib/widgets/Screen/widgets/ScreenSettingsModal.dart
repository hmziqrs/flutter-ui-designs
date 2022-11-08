import 'package:flutter/material.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter_uis/Providers/AppProvider.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/UI.dart';

import 'ScreenSettingsModalBody.dart';
import '../Provider.dart';

class ScreenSettingsModal extends StatelessWidget {
  Color getBackgroundColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Colors.white.withOpacity(0.90);
    }
    return Colors.black.withOpacity(0.90);
  }

  @override
  Widget build(BuildContext context) {
    final state = ScreenStateProvider.state(context);
    AppProvider.state(context, true);

    final isSettingsOpen =
        ScreenStateProvider.state(context, true).isSettingsOpen;

    return AnimatedPositioned(
      duration: 200.milliseconds,
      top: !isSettingsOpen
          ? UI.getSize().height - (20 + UI.padding.bottom)
          : 0.0,
      // bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        // onDoubleTap: ()this.openModal,
        onDoubleTap: () => state.setSettingsOpen(true),
        child: ConditionalWillPopScope(
          shouldAddCallback: Platform.isAndroid,
          onWillPop: () async {
            if (isSettingsOpen) {
              state.setSettingsOpen(false);
            }
            return !isSettingsOpen;
          },
          child: ClipRect(
            child: AnimatedOpacity(
              onEnd: () async {
                await 100.milliseconds.delay;
                if (!isSettingsOpen) {
                  state.setSettingsOpen(false);
                }
              },
              duration: 400.milliseconds,
              opacity: isSettingsOpen ? 1.0 : 0.0,
              child: Container(
                alignment: Alignment.topCenter,
                color: this.getBackgroundColor(context),
                child: SizedBox(
                  height: UI.height,
                  child: ScreenSettingsModalBody(
                    isModalOpen: isSettingsOpen,
                    onClose: () => state.setSettingsOpen(false),
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
