import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class DesignerProfileHeading extends StatelessWidget {
  DesignerProfileHeading(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding),
      child: Text(
        this.label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
