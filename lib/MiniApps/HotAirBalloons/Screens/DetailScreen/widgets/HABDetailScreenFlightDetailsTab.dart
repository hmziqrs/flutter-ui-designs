import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/UI.dart';

import '../../../data/flights.dart' as data;
import '../messages/keys.dart';

import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenFlightDetailsTab extends StatelessWidget {
  HABDetailScreenFlightDetailsTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.basketSize,
            context,
          ),
          App.translate(
            flight.basketSize,
            context,
          ),
          Feather.users,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.flightTime,
            context,
          ),
          App.translate(
            flight.time,
            context,
          ),
          Feather.clock,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.price,
            context,
          ),
          App.translate(
            flight.price,
            context,
          ),
          Feather.tag,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding * 5,
            vertical: AppDimensions.padding * 4,
          ),
          child: Text(
            App.translate(
              flight.desc,
              context,
            ),
            style: TextStyles.body3.copyWith(
              height: 1.7,
              color: AppTheme.subText,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 2,
            horizontal: AppDimensions.padding * 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0, 15),
                color: AppTheme.primary.withOpacity(0.35),
              )
            ],
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppTheme.primary,
              padding:
                  EdgeInsets.symmetric(
                vertical: AppDimensions.padding * 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              textStyle: TextStyle(
                color: Colors.white,
              ),
            ).copyWith(
              overlayColor: MaterialStateColor.resolveWith(
                (states) => Colors.white.withOpacity(0.1),
              ),
            ),
            child: Text(
              App.translate(
                HABDetailScreenMessages.bookNow,
                context,
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: UI.vertical * 5,
        )
      ],
    );
  }
}
