import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import '../../../configs/theme.dart' as theme;
import '../../../models/SKVStory.dart';
import '../Dimensions.dart';

class SKVHomeScreenStory extends StatelessWidget {
  SKVHomeScreenStory({required this.story});

  final SKVStory story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(this.story.testKey),
      child: Container(
        width: Dimensions.storyBaseWidth,
        margin: EdgeInsets.all(
          AppDimensions.padding * 1.5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              this.story.image,
              fit: BoxFit.cover,
              height: Dimensions.storyImageHeight,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      App.translate(
                        this.story.name,
                        context,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 7 + AppDimensions.padding * 2.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppDimensions.padding,
                        bottom: AppDimensions.padding,
                      ),
                      child: Row(
                        children: List<Widget>.generate(
                          5,
                          (index) {
                            final bool isEnabled =
                                (index + 1) <= this.story.stars;
                            return Container(
                              child: Icon(
                                isEnabled
                                    ? Icons.star
                                    : MaterialIcons.star_border,
                                size: 18,
                                color: theme.primary,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      App.translate(
                        this.story.desc,
                        context,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.8,
                        fontSize: 8 + AppDimensions.ratio * 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
