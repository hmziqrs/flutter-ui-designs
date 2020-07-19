import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/Widgets/Screen/ScreenStateProvider.dart';
import 'package:provider/provider.dart';

import 'ScreenSettingsModalBody.dart';

class ScreenSettingsModal extends StatefulWidget {
  @override
  _ScreenSettingsModalState createState() => _ScreenSettingsModalState();
}

class _ScreenSettingsModalState extends State<ScreenSettingsModal>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    this.controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 180),
    );
    Future.delayed(Duration.zero, () {
      this.controller.addListener(() {
        final state = Provider.of<ScreenStateProvider>(context, listen: false);
        state.offset = this.animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  void runAnimation({double begin, double end}) {
    this.animation = this.controller.drive(Tween(begin: begin, end: end));
    this.controller.reset();
    this.controller.forward();
  }

  void onVerticalDragStart(
    DragStartDetails event,
    ScreenStateProvider state,
  ) {
    state.startOffset = state.offset;
    // print(event);
  }

  void onVerticalDragUpdate(
    DragUpdateDetails event,
    ScreenStateProvider state,
  ) {
    state.offset = (state.offset + event.delta.dy).clamp(0.0, state.baseOffset);
  }

  void onVerticalDragEnd(
    DragEndDetails event,
    ScreenStateProvider state,
  ) {
    final threshold = (UI.height * 0.15).clamp(60.0, 260.0);
    final thresholdCheck = state.baseOffset - threshold;
    double newOffset;

    if (state.startOffset == state.baseOffset) {
      newOffset = thresholdCheck > state.offset ? 0 : state.baseOffset;
    } else {
      newOffset = state.offset < threshold ? 0 : state.baseOffset;
    }
    this.runAnimation(begin: state.offset, end: newOffset);
  }

  onDoubleTap(ScreenStateProvider state) {
    if (state.offset == 0.0) {
      this.runAnimation(begin: 0.0, end: state.baseOffset);
    } else if (state.offset == state.baseOffset) {
      this.runAnimation(begin: state.baseOffset, end: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenStateProvider>(
      builder: (context, state, _) {
        final opacity = Utils.rangeMap(
          state.offset,
          0.0,
          state.baseOffset,
          1.4,
          0.0,
        ).clamp(0.0, 1.0);

        return Positioned(
          top: state.offset,
          left: 0,
          right: 0,
          child: GestureDetector(
            onDoubleTap: () => this.onDoubleTap(
              state,
            ),
            onVerticalDragEnd: (obj) => this.onVerticalDragEnd(
              obj,
              state,
            ),
            onVerticalDragStart: (obj) => this.onVerticalDragStart(
              obj,
              state,
            ),
            onVerticalDragUpdate: (obj) => this.onVerticalDragUpdate(
              obj,
              state,
            ),
            child: NotificationListener<SizeChangedLayoutNotification>(
              onNotification: (SizeChangedLayoutNotification notification) {
                state.onLayoutChange();
                return true;
              },
              child: SizeChangedLayoutNotifier(
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    color: Colors.white,
                    height: UI.height,
                    width: double.infinity,
                    child: ScreenSettingsModalBody(
                      runAnimation: this.runAnimation,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
