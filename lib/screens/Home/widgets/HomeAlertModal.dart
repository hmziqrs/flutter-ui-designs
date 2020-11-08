import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/screens/Home/TestKeys.dart';

class HomeAlertModal extends StatefulWidget {
  HomeAlertModal({
    this.title,
    this.isOpen,
    this.initialMount,
    this.description,
    this.primaryText,
    this.onPrimary,
    this.secondaryText,
    this.onSecondary,
  });

  final String title;
  final bool isOpen;
  final bool initialMount;
  final String description;
  final String primaryText;
  final VoidCallback onPrimary;
  final String secondaryText;
  final VoidCallback onSecondary;

  @override
  _HomeAlertModalState createState() => _HomeAlertModalState();
}

class _HomeAlertModalState extends State<HomeAlertModal> {
  bool didMount;
  @override
  void initState() {
    this.didMount = widget.initialMount;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeAlertModal oldWidget) {
    if (oldWidget.isOpen && !widget.isOpen) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        setState(() {
          this.didMount = false;
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!this.didMount) {
      return SizedBox();
    }
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: widget.isOpen ? 1.0 : 0.0,
        duration: 280.milliseconds,
        onEnd: () async {
          await 80.milliseconds.delay;
          setState(() {
            this.didMount = false;
          });
        },
        child: Container(
          alignment: Alignment.center,
          color: AppTheme.background.withOpacity(0.8),
          child: Container(
            margin: EdgeInsets.all(AppDimensions.padding * 3),
            width: 400,
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  color: AppTheme.shadow,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: AppTheme.text01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 10.0 + AppDimensions.ratio * 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: <Widget>[
                        widget.primaryText != null
                            ? RaisedButton(
                                color: AppTheme.primary,
                                onPressed: widget.onPrimary,
                                child: Text(
                                  widget.primaryText,
                                  style: TextStyle(
                                    color: AppTheme.text,
                                  ),
                                ),
                              )
                            : Container(),
                        RaisedButton(
                          color: AppTheme.background,
                          onPressed: widget.onSecondary,
                          key: Key(HomeScreenTestKeys.modalContinueBtn),
                          child: Text(
                            widget.secondaryText,
                            style: TextStyle(
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
