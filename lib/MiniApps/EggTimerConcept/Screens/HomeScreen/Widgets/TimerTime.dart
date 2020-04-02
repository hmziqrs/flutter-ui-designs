import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import '../../../data/data.dart' as data;

class TimerTime extends StatefulWidget {
  TimerTime(this.timer);

  final data.Timer timer;

  @override
  _TimerTimeState createState() => _TimerTimeState();
}

class _TimerTimeState extends State<TimerTime> {
  String format(String str, Duration duration) {
    final dateFormat = DateFormat(str);
    final dateTime =
        DateTime(DateTime.now().year, 0, 0, 0, 0, duration.inSeconds);
    return dateFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final isReady = this.widget.timer.state == data.TimerState.ready;

    final style = TextStyle(
      fontSize: 35 + AppDimensions.ratio * 35,
      fontWeight: FontWeight.w800,
    );
    return ControlledAnimation(
      startPosition: 1.0,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 200),
      playback: isReady ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      builder: (context, animation) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              transform: Matrix4.identity()
                ..translate(
                  0.0,
                  Utils.rangeMap(animation, 0.0, 1.0, -100.0, 0.0),
                ),
              child: Opacity(
                opacity: animation,
                child: Text(
                  "${this.format("mm", this.widget.timer.currentTime)}",
                  style: style,
                ),
              ),
            ),
            Opacity(
              opacity: (1.0 - animation).clamp(0.0, 1.0),
              child: Text(
                "${this.format("mm:ss", this.widget.timer.currentTime)}",
                style: style,
              ),
            )
          ],
        );
      },
    );
  }
}
