import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'DownloadLink.dart';

class DownloadPlatformWithLinks extends StatelessWidget {
  DownloadPlatformWithLinks(this.label, this.links);
  final String label;
  final List<Map> links;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.padding * 3,
            bottom: AppDimensions.padding * 1,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14 + AppDimensions.ratio * 5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Wrap(
          children: links.map((obj) => DownloadLink(obj)).toList(),
        ),
      ],
    );
  }
}
