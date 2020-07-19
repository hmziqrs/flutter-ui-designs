import 'dart:async' as aSync;

enum ETCTimerState {
  ready,
  running,
  paused,
}

class ETCTimer {
  ETCTimer({this.maxTime, this.onTimerUpdate});

  final Duration maxTime;
  aSync.Timer internalTimer;
  final Function onTimerUpdate;
  final Stopwatch stopwatch = Stopwatch();

  ETCTimerState state = ETCTimerState.ready;
  Duration currentTime = Duration(minutes: 0);
  Duration lastStartTime = Duration(minutes: 0);
  Duration cache4Reset = Duration(minutes: 0);

  setCurrentTime(time) {
    if (state == ETCTimerState.ready) {
      currentTime = time;
      lastStartTime = currentTime;
    }
  }

  resume() {
    if (state == ETCTimerState.running) {
      return;
    }
    if (state == ETCTimerState.ready) {
      currentTime = Duration(minutes: (currentTime.inSeconds / 60).round());
      lastStartTime = currentTime;
    }
    state = ETCTimerState.running;

    stopwatch.start();
    tick();
  }

  pause() {
    if (state != ETCTimerState.running) {
      return;
    }

    state = ETCTimerState.paused;
    stopwatch.stop();

    if (onTimerUpdate != null) {
      onTimerUpdate();
    }
  }

  restart() {
    if (state != ETCTimerState.paused) {
      return;
    }
    state = ETCTimerState.running;
    currentTime = lastStartTime;

    stopwatch.reset();
    stopwatch.start();

    tick();
  }

  reset() {
    if (state != ETCTimerState.paused) {
      return;
    }

    state = ETCTimerState.ready;
    currentTime = Duration(seconds: 0);
    lastStartTime = currentTime;
    stopwatch.reset();

    if (onTimerUpdate != null) {
      onTimerUpdate();
    }
  }

  tick() {
    currentTime = lastStartTime - stopwatch.elapsed;
    cache4Reset = currentTime;
    if (onTimerUpdate != null) {
      onTimerUpdate();
    }
    if (currentTime.inSeconds > 0) {
      internalTimer = aSync.Timer(
        Duration(seconds: 1),
        () => state == ETCTimerState.running ? tick() : null,
      );
    } else {
      state = ETCTimerState.ready;
    }
  }

  dispose() {
    internalTimer?.cancel();
  }
}
