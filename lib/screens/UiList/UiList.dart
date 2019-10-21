import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

// import 'Widgets/Card.dart';
import 'Dimensions.dart';

class UiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => UiBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: theme.primary,
            accentColor: theme.primary,
            // textTheme: TextTheme(body1: Theme.of(context).textTheme.body1),
          ),
          child: OrientationBuilder(
            builder: (BuildContext ctx, Orientation orientation) {
              Dimensions.init(ctx, orientation);

              return SafeArea(
                bottom: false,
                top: false,
                child: BlocBuilder<UiBloc, UiState>(
                  builder: (blocCtx, state) {
                    final List<UIItem> list = state.list;
                    return CustomScrollView(
                      slivers: <Widget>[
                        Utils.safePadding(ctx, 'top', true),
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
                        SliverPadding(
                          padding: EdgeInsets.all(AppDimensions.padding),
                          sliver: SliverToBoxAdapter(
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              children: list
                                  .map(
                                    (ui) => UICard(
                                      ui,
                                      padding: AppDimensions.padding * 2,
                                      cardWidth: Dimensions.cardWidth,
                                      cardHeight: Dimensions.cardHeight,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(AppDimensions.padding * 3),
                        ),
                        Utils.safePadding(context, 'bottom', true),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
