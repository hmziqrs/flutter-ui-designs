import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

class HomeAlertModal extends StatelessWidget {
  HomeAlertModal({
    this.title,
    this.description,
    this.mount,
    this.opacity,
    this.onEnd,
    this.primaryText,
    this.onPrimary,
    this.secondaryText,
    this.onSecondary,
  });

  final String title;
  final String description;
  final bool mount;
  final double opacity;
  final VoidCallback onEnd;
  final String primaryText;
  final VoidCallback onPrimary;
  final String secondaryText;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    if (!mount) {
      return Positioned(
        child: Container(),
      );
    }
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 280),
        onEnd: onEnd,
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.4),
          child: Container(
            margin: EdgeInsets.all(AppDimensions.padding * 3),
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.sta,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black.withOpacity(0.12),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppDimensions.padding * 2),
                    child: Text(
                      description,
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
                        primaryText != null
                            ? RaisedButton(
                                color: theme.primary,
                                onPressed: onPrimary,
                                child: Text(
                                  primaryText,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: onSecondary,
                          child: Text(
                            secondaryText,
                            style: TextStyle(
                              color: theme.primary,
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
