import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import '../data.dart' as data;

class AboutDeveloperShowSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        left: AppDimensions.padding * 1,
        right: AppDimensions.padding * 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.showSupport
            .map(
              (support) => GestureDetector(
                onTap: () => Utils.launchUrl(support["link"]),
                child: Text(
                  "* ${App.translate(support["text"])}",
                  style: TextStyle(
                    height: 1 + AppDimensions.ratio * 0.5,
                    fontSize: 10 + AppDimensions.ratio * 5,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
