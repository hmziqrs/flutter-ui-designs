import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart' as quiver;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class UiListScreen extends StatefulWidget {
  @override
  _UiListScreenState createState() => _UiListScreenState();
}

class _UiListScreenState extends State<UiListScreen>
    with SingleTickerProviderStateMixin {
  double scrollStart = 0.0;
  double offset = 0.0;

  ScrollController scrollController;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    this.animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    this.animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.animationController.reset();
        setState(() {
          this.offset = 0.0;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UiBloc(),
      child: Screen(
        Dimensions.init,
        builder: (_) => SafeArea(
          bottom: false,
          top: false,
          child: BlocBuilder<UiBloc, UiState>(
            builder: (blocContext, state) {
              final List<UIItem> list = state.list;
              final chunked =
                  quiver.partition<UIItem>(list, Dimensions.chunks).toList();

              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  setState(() {
                    if (notification.runtimeType == ScrollStartNotification) {
                      this.scrollStart = notification.metrics.pixels;
                    }
                    if (notification.runtimeType == ScrollUpdateNotification) {
                      this.offset =
                          ((this.scrollStart - notification.metrics.pixels) *
                                  0.5)
                              .clamp(-120.0, 120.0);
                    }
                    if (notification.runtimeType == ScrollEndNotification) {
                      this.animation = new Tween(begin: this.offset, end: 0.0)
                          .animate(this.animationController);

                      this.animation.addListener(() {
                        setState(() {
                          this.offset = this.animation.value;
                        });
                      });

                      this.animationController.forward();
                    }
                  });

                  return true;
                },
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    Utils.safePadding(blocContext, 'top', true),
                    SliverPadding(
                      padding: EdgeInsets.all(AppDimensions.padding),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.padding * 3,
                        ),
                        child: Text(
                          "Explore UIs",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.padding * 3,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(AppDimensions.padding),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((ctx, index) {
                          return Row(
                            children: chunked[index]
                                .map((ui) => UICard(
                                      ui,
                                      prespectiveScale: this.offset,
                                      cardWidth: Dimensions.cardWidth,
                                      cardHeight: Dimensions.cardHeight,
                                      padding: AppDimensions.padding * 2,
                                    ))
                                .toList(),
                          );
                        }, childCount: chunked.length),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(AppDimensions.padding * 3),
                    ),
                    Utils.safePadding(context, 'bottom', true),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
