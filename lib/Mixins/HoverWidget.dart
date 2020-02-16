import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'package:simple_animations/simple_animations.dart';

@optionalTypeArgs
mixin HoverWidgetMixin<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  Ticker _ticker;
  Animation<double> animation;
  bool isFocused = false;
  bool forceFocus = false;

  AnimationControllerX controller = AnimationControllerX();

  @override
  void initState() {
    controller.configureVsync(this);
    controller.addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    super.initState();
  }

  void onFocus(bool focus) {
    isFocused = focus;
    controller.reset([
      FromToTask(
        to: focus ? 1.0 : 0.0,
        duration: Duration(
          milliseconds: 180,
        ),
      )
    ]);
  }

  void removeForceFocus() {
    if (this.forceFocus) {
      this.forceFocus = false;
      this.onFocus(false);
    }
  }

  void addForceFocus() {
    if (!this.isFocused) {
      this.forceFocus = true;
      this.onFocus(true);
    }
  }

  Widget buildInkWell({
    @required Widget child,
    GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    ValueChanged<bool> onHover,
    ValueChanged<bool> onFocusChange,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
  }) {
    return InkWell(
      child: child,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        this.removeForceFocus();
        if (onTap != null) {
          onTap();
        }
      },
      onTapDown: (value) {
        this.addForceFocus();
        if (onTapDown != null) {
          onTapDown(value);
        }
      },
      onTapCancel: () {
        this.removeForceFocus();
        if (onTapCancel != null) {
          onTapCancel();
        }
      },
      onHover: (value) {
        this.onFocus(value);
        if (onHover != null) {
          onHover(value);
        }
      },
      onFocusChange: (value) {
        this.onFocus(value);
        if (onFocusChange != null) {
          onFocusChange(value);
        }
      },
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) return true;
      throw FlutterError(
          '$runtimeType is a SingleTickerProviderStateMixin but multiple tickers were created.\n'
          'A SingleTickerProviderStateMixin can only be used as a TickerProvider once. If a '
          'State is used for multiple AnimationController objects, or if it is passed to other '
          'objects and those objects might use it more than one time in total, then instead of '
          'mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.');
    }());
    _ticker = Ticker(onTick, debugLabel: 'created by $this');
    return _ticker;
  }

  @override
  void dispose() {
    controller.dispose();
    assert(() {
      if (_ticker == null || !_ticker.isActive) return true;
      throw FlutterError('$this was disposed with an active Ticker.\n'
          '$runtimeType created a Ticker via its SingleTickerProviderStateMixin, but at the time '
          'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
          'be disposed before calling super.dispose(). Tickers used by AnimationControllers '
          'should be disposed by calling dispose() on the AnimationController itself. '
          'Otherwise, the ticker will leak.\n'
          'The offending ticker was: ${_ticker.toString(debugIncludeStack: true)}');
    }());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_ticker != null) _ticker.muted = !TickerMode.of(context);
    super.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    String tickerDescription;
    if (_ticker != null) {
      if (_ticker.isActive && _ticker.muted)
        tickerDescription = 'active but muted';
      else if (_ticker.isActive)
        tickerDescription = 'active';
      else if (_ticker.muted)
        tickerDescription = 'inactive and muted';
      else
        tickerDescription = 'inactive';
    }
    properties.add(DiagnosticsProperty<Ticker>('ticker', _ticker,
        description: tickerDescription,
        showSeparator: false,
        defaultValue: null));
  }
}
