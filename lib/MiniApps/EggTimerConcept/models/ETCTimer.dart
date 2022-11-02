import 'dart:async' as aSync;

enum ETCTimerState {
  ready,
  running,
  paused,
}

class ETCTimer {
  ETCTimer({
    required this.maxTime,
    required this.onTimerUpdate,
  });

  final Duration maxTime;
  aSync.Timer? internalTimer;
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

    onTimerUpdate();
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

    onTimerUpdate();
  }

  tick() {
    currentTime = lastStartTime - stopwatch.elapsed;
    cache4Reset = currentTime;
    onTimerUpdate();
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
