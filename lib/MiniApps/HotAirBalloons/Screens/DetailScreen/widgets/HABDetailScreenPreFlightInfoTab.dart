import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/App.dart';

import '../../../data/flights.dart' as data;
import '../messages/keys.dart';

import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenPreFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPreFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.pickUp,
            context,
          ),
          App.translate(
            flight.pickUp,
            context,
          ),
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            flight.breakFastType,
            context,
          ),
          App.translate(
            flight.breakFast,
            context,
          ),
          MaterialCommunityIcons.coffee_outline,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.watchingInflation,
            context,
          ),
          App.translate(
            flight.inflation,
            context,
          ),
          MaterialCommunityIcons.airballoon,
          fullWidth: true,
        ),
      ],
    );
  }
}
