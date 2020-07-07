import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../data/flights.dart' as data;
import 'RowInfo.dart';

class PreFlightInfoTab extends StatelessWidget {
  const PreFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowInfo(
          "Pick-up from your hotel",
          flight.pickUp,
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
        RowInfo(
          flight.breakFastType,
          flight.breakFast,
          Feather.coffee,
          fullWidth: true,
        ),
        RowInfo(
          "Watching the inflation",
          flight.inflation,
          MaterialCommunityIcons.airballoon,
          fullWidth: true,
        ),
      ],
    );
  }
}
