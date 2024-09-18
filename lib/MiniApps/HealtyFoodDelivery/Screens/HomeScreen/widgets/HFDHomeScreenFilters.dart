import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../configs/theme.dart' as theme;
import '../messages/keys.dart';
import '../Dimensions.dart';

final filters = [
  HFDHomeScreenMessages.nearBy,
  HFDHomeScreenMessages.recommended,
  HFDHomeScreenMessages.popular,
];

class HFDHomeScreenFilters extends StatefulWidget {
  HFDHomeScreenFilters();

  @override
  _HFDHomeScreenFiltersState createState() => _HFDHomeScreenFiltersState();
}

class _HFDHomeScreenFiltersState extends State<HFDHomeScreenFilters> {
  List toggles = List.generate(filters.length, (index) => false);
  String activeFilter = filters[0];

  void onFocus(bool focus, String filter) {
    setState(() {
      toggles[filters.indexOf(filter)] = focus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.chipsContainerWidth,
      constraints: BoxConstraints(
        maxWidth: Dimensions.chipsContainerWidth,
      ),
      padding: EdgeInsets.all(AppDimensions.padding * 1),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: AppDimensions.maxContainerWidth,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: filters.map(
              (filter) {
                final isActive = filter == this.activeFilter;
                return InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onHover: (focus) => this.onFocus(focus, filter),
                  onFocusChange: (focus) => this.onFocus(focus, filter),
                  onTap: () {
                    setState(() {
                      this.activeFilter = filter;
                    });
                  },
                  child: CustomAnimationBuilder(
                    startPosition: 0.0,
                    control: toggles[filters.indexOf(filter)]
                        ? Control.play
                        : Control.playReverse,
                    duration: Duration(milliseconds: 280),
                    tween: ColorTween(
                      begin: Colors.transparent,
                      end: Colors.black.withOpacity(0.08),
                    ),
                    builder: (ctx, animation, child) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.padding * 4,
                        vertical: AppDimensions.padding * 1.25,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? theme.primary : animation,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        App.translate(
                          filter,
                          context,
                        ),
                        style: TextStyle(
                          color: isActive ? Colors.white : null,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
