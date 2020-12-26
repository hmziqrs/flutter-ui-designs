import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/CommonProps.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../../HealtyFoodDelivery/Screens/HomeScreen/data.dart' as data;
import 'messages/keys.dart';
import 'Dimensions.dart';

class CCNHomeScreen extends StatelessWidget {
  static final catAssets = [
    'assets/food/breakfast.jpg',
    'assets/food/lunch.jpg',
    'assets/food/dinner.jpg',
    'assets/food/snacks.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final space = AppDimensions.padding * 3;
    return Screen(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Material(
          child: ListView(
            children: [
              SizedBox(height: space),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: space),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          App.translate(CCNHomeScreenMessages.heading, context),
                          style: TextStyles.heading3,
                        ),
                      ),
                    ),
                    InkResponse(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications_outlined,
                        size: TextStyles.heading1.fontSize,
                      ),
                    ),
                    SizedBox(width: space),
                    InkResponse(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        size: TextStyles.heading1.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: space,
              ),
              SizedBox(
                height: Dimensions.smallBox * 1.30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.categories.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: space / 2,
                  ),
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: space / 2),
                      width: Dimensions.smallBox,
                      height: Dimensions.smallBox,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: CommonProps.cardRadius,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: CommonProps.cardRadius,
                              child: Image.asset(
                                catAssets[index],
                                fit: BoxFit.fitWidth,
                                height: Dimensions.smallBox,
                                width: Dimensions.smallBox,
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  App.translate(
                                      CCNHomeScreenMessages.cat1.replaceFirst(
                                        '1',
                                        (index + 1).toString(),
                                      ),
                                      context),
                                  style: TextStyles.heading56,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: space),
              SizedBox(
                height: Dimensions.largeBox * 1.25,
                child: ListView.builder(
                  itemCount: data.items.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: space / 2,
                  ),
                  itemBuilder: (context, index) {
                    final item = data.items[index];

                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: space / 2,
                      ),
                      width: Dimensions.largeBox,
                      height: Dimensions.largeBox,
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          "ccnDetail",
                          arguments: item,
                        ),
                        borderRadius: CommonProps.cardRadius,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: CommonProps.cardRadius,
                              child: Image.asset(
                                item.image,
                                width: Dimensions.largeBox,
                                height: Dimensions.largeBox,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(height: AppDimensions.padding * 2),
                            Text(
                              item.name,
                              style: TextStyles.heading56,
                            ),
                            SizedBox(height: AppDimensions.padding * 0.5),
                            Text(
                              'By ${item.author}',
                              style: TextStyles.heading6.copyWith(
                                color: AppTheme.subText3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: space),
            ],
          ),
        ),
      ),
    );
  }
}
