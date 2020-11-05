import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/App.dart';

import '../../../data/flights.dart' as data;
import 'HABDetailScreenRowInfo.dart';
import '../messages/keys.dart';

class HABDetailScreenPreFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPreFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.pickUp),
          App.translate(flight.pickUp),
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(flight.breakFastType),
          App.translate(flight.breakFast),
          MaterialCommunityIcons.coffee_outline,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.watchingInflation),
          App.translate(flight.inflation),
          MaterialCommunityIcons.airballoon,
          fullWidth: true,
        ),
      ],
    );
  }
}
