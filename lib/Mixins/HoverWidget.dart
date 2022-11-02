import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
export 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

@optionalTypeArgs
mixin HoverWidgetMixin<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  Ticker _ticker;
  Animation<double> animation;
  bool isFocused = false;
  bool forceFocus = false;

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: 800.milliseconds,
      vsync: this,
    );
    controller.addListener(() => setState(() {}));
    animation = 0.0.tweenTo(1.0).animate(controller);

    super.initState();
  }

  void onFocus(bool focus) {
    isFocused = focus;
    this.controller.animateTo(
          focus ? 1.0 : 0.0,
          duration: Duration(
            milliseconds: 180,
          ),
        );
    // controller.reset([
    //   FromToTask(
    //     to: ,

    //   )
    // ]);
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
    required Widget child,
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
    bool isButton = false,
    Key key,
  }) {
    return InkWell(
      key: key,
      child: child,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      hoverColor: isButton ? null : Colors.transparent,
      focusColor: isButton ? null : Colors.transparent,
      highlightColor: isButton ? null : Colors.transparent,
      splashColor: isButton ? null : Colors.transparent,
      onTap: () {
        this.removeForceFocus();
        onTap();
      },
      onTapDown: (value) {
        this.addForceFocus();
        onTapDown(value);
      },
      onTapCancel: () {
        this.removeForceFocus();
        onTapCancel();
      },
      onHover: (value) {
        this.onFocus(value);
        onHover(value);
      },
      onFocusChange: (value) {
        this.onFocus(value);
        onFocusChange(value);
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
      if (!_ticker.isActive) return true;
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
    _ticker.muted = !TickerMode.of(context);
    super.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    String tickerDescription;
    if (_ticker.isActive && _ticker.muted)
      tickerDescription = 'active but muted';
    else if (_ticker.isActive)
      tickerDescription = 'active';
    else if (_ticker.muted)
      tickerDescription = 'inactive and muted';
    else
      tickerDescription = 'inactive';
    properties.add(DiagnosticsProperty<Ticker>('ticker', _ticker,
        description: tickerDescription,
        showSeparator: false,
        defaultValue: null));
  }
}
