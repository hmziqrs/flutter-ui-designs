import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../data/flights.dart' as data;
import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenPreFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPreFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          "Pick-up from your hotel",
          flight.pickUp,
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          flight.breakFastType,
          flight.breakFast,
          Feather.coffee,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          "Watching the inflation",
          flight.inflation,
          MaterialCommunityIcons.airballoon,
          fullWidth: true,
        ),
      ],
    );
  }
}
