import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:fluttery_dart2/gestures.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../models/ETCTimer.dart';
import 'messages/keys.dart';
import 'TestKeys.dart';
import 'Theme.dart';

import 'widgets/ETCHomeScreenTimerTime.dart';
import 'widgets/ETCHomeScreenTimerDial.dart';
import 'widgets/ETCHomeScreenButton.dart';
import 'Dimensions.dart';

class ETCHomeScreen extends StatefulWidget {
  @override
  _ETCHomeScreenState createState() => _ETCHomeScreenState();
}

class _ETCHomeScreenState extends State<ETCHomeScreen> {
  _ETCHomeScreenState() {
    timer = ETCTimer(
      maxTime: Duration(minutes: 35),
      onTimerUpdate: () => setState(() {}),
    );
  }
  ETCTimer timer;
  PolarCoord dragStartCord;
  Duration dragStartTime;
  Duration selectedTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.dispose();
    super.dispose();
  }

  onRadialDragStart(PolarCoord cord) {
    this.dragStartCord = cord;
    this.dragStartTime = this.timer.currentTime;
  }

  onRadialDragUpdate(PolarCoord cord) {
    if (this.dragStartCord != null) {
      final factor = math.pi * 2;
      final angleDiff = cord.angle - dragStartCord.angle;
      final anglePercent =
          (angleDiff + (angleDiff < 0.0 ? factor : 0.0)) / factor;
      final timeDiffInSecs =
          (anglePercent * this.timer.maxTime.inSeconds).round();
      this.selectedTime =
          Duration(seconds: this.dragStartTime.inSeconds + timeDiffInSecs);

      setState(() {
        this.timer.setCurrentTime(this.selectedTime);
      });
    }
  }

  onRadialDragEnd() {
    setState(() {
      this.timer.resume();
      this.dragStartCord = null;
      this.dragStartTime = null;
      this.selectedTime = null;
    });
  }

  playPauseAnimationState() {
    switch (this.timer.state) {
      case ETCTimerState.running:
        return CustomAnimationControl.PLAY;
      case ETCTimerState.paused:
        return CustomAnimationControl.STOP;
      default:
        return CustomAnimationControl.PLAY_REVERSE;
    }
  }

  resetRestartAnimationState() {
    switch (this.timer.state) {
      case ETCTimerState.paused:
        return CustomAnimationControl.PLAY;
      default:
        return CustomAnimationControl.PLAY_REVERSE;
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final gradient = LinearGradient(
      colors: [ETCTheme.color1, ETCTheme.color2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final isRunning = this.timer.state == ETCTimerState.running;
    final isReady = this.timer.state == ETCTimerState.ready;

    return Screen(
      fontFamily: 'BebasNeue',
      scaffoldBackgroundColor: Colors.transparent,
      belowBuilder: (_) => Positioned.fill(
        child: Container(
          decoration: BoxDecoration(gradient: gradient),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            ETCHomeScreenTimerTime(this.timer),
            Expanded(child: Container()),
            RadialDragGestureDetector(
              onRadialDragEnd: this.onRadialDragEnd,
              onRadialDragStart: this.onRadialDragStart,
              onRadialDragUpdate: this.onRadialDragUpdate,
              child: CustomAnimation(
                key: Key(this.timer.state.toString()),
                tween: Tween<double>(
                  end: 0.0,
                  begin: this.timer.cache4Reset.inSeconds.toDouble(),
                ),
                duration: Duration(
                  milliseconds: (this.timer.cache4Reset.inSeconds * 0.3)
                      .clamp(200.0, 400.0)
                      .toInt(),
                ),
                control: isReady
                    ? CustomAnimationControl.PLAY
                    : CustomAnimationControl.PLAY_REVERSE,
                builder: (context, child, animation) {
                  return ETCHomeScreenTimerDial(
                    gradient,
                    ticksPerSection: 5,
                    maxTime: this.timer.maxTime,
                    currentTime: isReady && animation > 0
                        ? Duration(seconds: animation.toInt())
                        : this.timer.currentTime,
                  );
                },
              ),
            ),
            Expanded(child: Container()),
            CustomAnimation(
              tween: Tween(begin: 0.0, end: 1.0),
              control: this.resetRestartAnimationState(),
              duration: Duration(milliseconds: 280),
              child: Container(
                width: AppDimensions.miniContainerWidth,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ETCHomeScreenButton(
                        testKey: Key(ETCHomeScreenTestKeys.restartBtn),
                        label: App.translate(
                          ETCHomeScreenMessages.restart,
                          context,
                        ),
                        icon: Icons.refresh,
                        onPress: this.timer.restart,
                      ),
                    ),
                    Expanded(
                      child: ETCHomeScreenButton(
                        testKey: Key(ETCHomeScreenTestKeys.resetBtn),
                        label: App.translate(
                          ETCHomeScreenMessages.reset,
                          context,
                        ),
                        icon: Icons.arrow_back,
                        onPress: this.timer.reset,
                      ),
                    ),
                  ],
                ),
              ),
              builder: (context, child, animation) {
                return Opacity(
                  opacity: animation,
                  child: child,
                );
              },
            ),
            CustomAnimation(
              tween: Tween(begin: 0.0, end: 1.0),
              control: this.playPauseAnimationState(),
              duration: Duration(milliseconds: 280),
              child: ETCHomeScreenButton(
                testKey: Key(ETCHomeScreenTestKeys.playPauseBtn),
                label: App.translate(
                  isRunning
                      ? ETCHomeScreenMessages.pause
                      : ETCHomeScreenMessages.play,
                  context,
                ),
                icon: isRunning ? Icons.pause : Icons.play_arrow,
                onPress: () =>
                    isRunning ? this.timer.pause() : this.timer.resume(),
              ),
              builder: (context, child, animation) {
                return Container(
                  width: AppDimensions.miniContainerWidth,
                  transform: Matrix4.identity()
                    ..translate(
                      0.0,
                      Utils.rangeMap(
                        animation,
                        0.0,
                        1.0,
                        AppDimensions.ratio * 16,
                        0,
                      ),
                    ),
                  child: Opacity(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
