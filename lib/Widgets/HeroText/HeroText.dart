import 'package:flutter/material.dart';

import './ViewState.dart';
export './ViewState.dart';

class HeroText extends StatefulWidget {
  HeroText({
    @required this.title,
    @required this.viewState,
    this.smallFontSize = 15.0,
    this.largeFontSize = 48.0,
    this.maxLines = 2,
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle = const TextStyle(),
    this.isOverflow = false,
  });

  final String title;
  final ViewState viewState;
  final double smallFontSize;
  final double largeFontSize;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final bool isOverflow;

  _HeroTextState createState() => _HeroTextState();
}

class _HeroTextState extends State<HeroText>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> fontSizeTween;
  double fontSize;

  @override
  void initState() {
    this.animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.viewState == ViewState.shrink ? 180 : 440),
    )..addListener(() {
        setState(() {
          this.fontSize = fontSizeTween.value;
        });
      });

    switch (widget.viewState) {
      case ViewState.enlarge:
        this.fontSizeTween = Tween<double>(
          begin: widget.smallFontSize,
          end: widget.largeFontSize,
        ).animate(
          CurvedAnimation(
            curve: Curves.easeInOut,
            parent: this.animationController,
          ),
        );
        this.animationController.forward(from: 0.0);
        break;
      case ViewState.enlarged:
        fontSize = widget.largeFontSize;
        break;
      case ViewState.shrink:
        this.fontSizeTween = Tween<double>(
          begin: widget.largeFontSize,
          end: widget.smallFontSize,
        ).animate(
          CurvedAnimation(
            parent: this.animationController,
            curve: Curves.easeInOut,
          ),
        );
        this.animationController.forward(from: 0.0);
        break;
      case ViewState.shrunk:
        this.fontSize = widget.smallFontSize;
        break;
      default:
    }

    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  Widget buildText() => Text(
        widget.title,
        maxLines: widget.maxLines,
        overflow: widget.textOverflow,
        style: widget.textStyle.copyWith(
          fontSize: this.fontSize,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: widget.isOverflow
            ? OverflowBox(
                alignment: Alignment.topLeft,
                maxHeight: double.infinity,
                minHeight: double.infinity,
                child: this.buildText(),
              )
            : this.buildText(),
      ),
    );
  }
}
