import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:fluttery_dart2/gestures.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;

import 'Widgets/TimerTime.dart';
import 'Widgets/TimerDail.dart';
import 'Dimensions.dart';

class ETCHomeScreen extends StatefulWidget {
  @override
  _ETCHomeScreenState createState() => _ETCHomeScreenState();
}

class _ETCHomeScreenState extends State<ETCHomeScreen> {
  _ETCHomeScreenState() {
    timer = data.Timer(
      maxTime: Duration(minutes: 35),
      onTimerUpdate: () => setState(() {}),
    );
  }
  data.Timer timer;
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
      final agnlePercent =
          (angleDiff + (angleDiff < 0.0 ? factor : 0.0)) / factor;
      final timeDiffInSecs =
          (agnlePercent * this.timer.maxTime.inSeconds).round();
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
      case data.TimerState.running:
        return Playback.PLAY_FORWARD;
      case data.TimerState.paused:
        return Playback.PAUSE;
      default:
        return Playback.PLAY_REVERSE;
    }
  }

  resetRestartAnimationState() {
    switch (this.timer.state) {
      case data.TimerState.paused:
        return Playback.PLAY_FORWARD;
      default:
        return Playback.PLAY_REVERSE;
    }
  }

  @override
  Widget build(BuildContext buildCtx) {
    final gradient = LinearGradient(
      colors: [theme.light1, theme.light2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'BebasNeue',
        );

    final isRunning = this.timer.state == data.TimerState.running;
    final isReady = this.timer.state == data.TimerState.ready;

    return Screen(
      Dimensions.init,
      scaffoldBackgroundColor: Colors.transparent,
      textStyle: fontStyle,
      belowBuilder: (_) => Positioned.fill(
        child: Container(
          decoration: BoxDecoration(gradient: gradient),
        ),
      ),
      builder: (_) => Column(
        children: <Widget>[
          TimerTime(this.timer),
          Expanded(child: Container()),
          RadialDragGestureDetector(
            onRadialDragEnd: this.onRadialDragEnd,
            onRadialDragStart: this.onRadialDragStart,
            onRadialDragUpdate: this.onRadialDragUpdate,
            child: ControlledAnimation(
              key: Key(this.timer.state.toString()),
              tween: Tween<double>(
                end: 0.0,
                begin: this.timer.cache4Reset.inSeconds.toDouble(),
              ),
              duration: Duration(
                  milliseconds: (this.timer.cache4Reset.inSeconds * 0.3)
                      .clamp(200.0, 400.0)
                      .toInt()),
              playback: isReady ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
              builder: (context, double animation) {
                return TimerDial(
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
          ControlledAnimation(
            tween: Tween(begin: 0.0, end: 1.0),
            playback: this.resetRestartAnimationState(),
            duration: Duration(milliseconds: 280),
            builder: (context, animation) {
              return Opacity(
                opacity: animation,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: this.buildButton(
                        "Restart",
                        Icons.refresh,
                        this.timer.restart,
                      ),
                    ),
                    Expanded(
                      child: this.buildButton(
                        "Reset",
                        Icons.arrow_back,
                        this.timer.reset,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ControlledAnimation(
            tween: Tween(begin: 0.0, end: 1.0),
            playback: this.playPauseAnimationState(),
            duration: Duration(milliseconds: 280),
            builder: (context, animation) {
              return Container(
                transform: Matrix4.identity()
                  ..translate(
                    0.0,
                    Utils.rangeMap(
                        animation, 0.0, 1.0, AppDimensions.ratio * 16, 0),
                  ),
                child: Opacity(
                  opacity: animation,
                  child: this.buildButton(
                    isRunning ? "pause" : "play",
                    isRunning ? Icons.pause : Icons.play_arrow,
                    () => isRunning ? this.timer.pause() : this.timer.resume(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label, IconData icon, VoidCallback onPress) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.padding),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12 + AppDimensions.ratio * 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
