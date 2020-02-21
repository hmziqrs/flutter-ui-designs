import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../data/data.dart' as data;
import '../../../configs/theme.dart' as theme;

class FilterBar extends StatefulWidget {
  final String activeFilter;
  final void Function(String) onChange;

  FilterBar(this.activeFilter, this.onChange, {Key key}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List toggles = List.generate(data.fliters.length, (index) => false);

  void onFocus(bool focus, String filter) {
    setState(() {
      toggles[data.fliters.indexOf(filter)] = focus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: data.fliters.map(
          (filter) {
            final isActive = filter == widget.activeFilter;
            return InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHover: (focus) => this.onFocus(focus, filter),
              onFocusChange: (focus) => this.onFocus(focus, filter),
              onTap: () {
                widget.onChange(filter);
              },
              child: ControlledAnimation(
                startPosition: 0.0,
                playback: toggles[data.fliters.indexOf(filter)]
                    ? Playback.PLAY_FORWARD
                    : Playback.PLAY_REVERSE,
                duration: Duration(milliseconds: 280),
                tween: ColorTween(
                  begin: Colors.transparent,
                  end: Colors.black.withOpacity(0.08),
                ),
                builder: (ctx, animation) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 4,
                    vertical: AppDimensions.padding * 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? theme.primary : animation,
                    boxShadow: [
                      BoxShadow(
                        color: isActive
                            ? Colors.black.withOpacity(0.25)
                            : Colors.transparent,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      color: isActive ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
