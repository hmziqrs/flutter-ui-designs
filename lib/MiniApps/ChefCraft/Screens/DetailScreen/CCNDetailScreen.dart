import 'dart:math';

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:flutter_uis/widgets/Buttons/AppButton.dart';
import 'package:flutter_uis/widgets/Overlay/GradientFade.dart';
import 'package:flutter_uis/widgets/ScreenAnimation/Base.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/CommonProps.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../../HealtyFoodDelivery/Screens/HomeScreen/data.dart' as data;
import 'messages/keys.dart';
import 'Provider.dart';
import 'Dimensions.dart';

class CCNDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CCNDetailState>(
      create: (_) => CCNDetailState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  static final info = [
    CCNDetailScreenMessages.calories,
    CCNDetailScreenMessages.ingredients,
    CCNDetailScreenMessages.totalTime
  ];

  void onClose(BuildContext context) => CCNDetailState.state(context).close(
        callback: () {
          Navigator.of(context).pop();
        },
      );

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final data.HFDFoodItem item =
        ModalRoute.of(context)!.settings.arguments! as data.HFDFoodItem;

    final space = AppDimensions.padding * 3;

    final r = Random();
    final infoVal = [
      "${item.dailyCal} Cal",
      r.nextInt(20).toString(),
      "${r.nextInt(60)} mins",
    ];

    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        this.onClose(context);
        return false;
      },
      child: Screen(
        belowBuilders: [
          Consumer<CCNDetailState>(
            builder: (context, state, child) {
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: Dimensions.coverImage +
                      -state.getSafe(Dimensions.coverImage),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
        overlayBuilders: [
          OverlayGradientFade<CCNDetailState>(
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.0),
            ],
            height: MediaQuery.of(context).padding.top + space * 4,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + AppDimensions.padding,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: ScreenAnimationBase<CCNDetailState>(
                delay: 500,
                builder: (_, animation, child) {
                  return Opacity(
                    child: child,
                    opacity: animation,
                  );
                },
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          OverlayGradientFade<CCNDetailState>(
            bottom: 0,
            fromTop: false,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.background.withOpacity(0.2),
              AppTheme.background,
            ],
            height: MediaQuery.of(context).padding.top + space * 7,
          ),
          Positioned(
            left: space + MediaQuery.of(context).padding.left,
            right: space + MediaQuery.of(context).padding.right,
            bottom: MediaQuery.of(context).padding.bottom +
                AppDimensions.padding * 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: ScreenAnimationBase<CCNDetailState>(
                delay: 500,
                builder: (_, animation, child) {
                  return Opacity(
                    child: child,
                    opacity: animation,
                  );
                },
                child: AppButton(
                  onTap: () {},
                  theme: 'mode',
                  label: App.translate(CCNDetailScreenMessages.cook),
                ),
              ),
            ),
          ),
        ],
        child: SafeArea(
          top: false,
          bottom: false,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              CCNDetailState.state(context)
                  .setOffset(notification.metrics.pixels);
              return true;
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: Dimensions.coverImage * 0.85,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppTheme.cartRadius * 2.5),
                    ),
                  ),
                  padding: EdgeInsets.all(
                    space,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyles.heading3,
                      ),
                      SizedBox(height: AppDimensions.padding * 1.0),
                      Text(
                        'By ${item.author}',
                        style: TextStyles.heading56.copyWith(
                          color: AppTheme.subText3,
                        ),
                      ),
                      SizedBox(height: AppDimensions.padding * 1.0),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding * 0.2,
                            ),
                            child: Icon(
                              Icons.star,
                              color: item.stars.round() >= index
                                  ? Colors.orange
                                  : AppTheme.text02,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: space),
                      Row(
                        children: List.generate(
                          info.length,
                          (index) {
                            return Flexible(
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 0 : space / 2,
                                  right: index == 2 ? 0 : space / 2,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: space * 0.8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppTheme.text02,
                                  ),
                                  borderRadius: CommonProps.buttonRadius,
                                ),
                                child: Ink(
                                  child: InkWell(
                                    onTap: () {
                                      //
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          App.translate(info[index], context),
                                        ),
                                        SizedBox(
                                          height: AppDimensions.padding / 2,
                                        ),
                                        Text(
                                          infoVal[index],
                                          style: TextStyles.heading66,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: space),
                      Text(
                        App.translate(CCNDetailScreenMessages.about),
                        style: TextStyles.heading3,
                      ),
                      Text(
                        item.description,
                        maxLines: 6,
                        style: TextStyles.body1.copyWith(
                          color: AppTheme.subText,
                          height: TextStyles.body1.fontSize! * 0.12,
                        ),
                      ),
                      SizedBox(height: space),
                      Row(
                        children: [
                          Text(
                            App.translate(CCNDetailScreenMessages.about),
                            style: TextStyles.heading3,
                          ),
                          Flexible(
                            child: SizedBox(width: double.infinity),
                          ),
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(
                            width: AppDimensions.padding,
                          ),
                          Text(item.stars.toStringAsFixed(1)),
                        ],
                      ),
                      ...List.generate(
                        10,
                        (index) {
                          final fake = Faker();
                          final r = Random();
                          return Padding(
                            padding: EdgeInsets.only(
                                top: space * (index != 0 ? 0.75 : 0.45)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fake.person.name(),
                                  style: TextStyles.heading56,
                                ),
                                SizedBox(height: AppDimensions.padding * 0.5),
                                Text(
                                  faker.lorem
                                      .sentences(1 + r.nextInt(3))
                                      .join(" "),
                                  // style: TextStyles.heading66,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimensions.padding * 12),
                      Utils.safePadding(context, "bottom"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
