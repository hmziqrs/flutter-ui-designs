import 'dart:isolate';

const String scope = 'HABDetailScreen';

const Map strings = {
  '$scope/flight': "Flight",
  '$scope/basketSize': "Basket Size",
  '$scope/flightTime': "Flight Time",
  '$scope/price': "Price",
  '$scope/bookNow': "BOOK NOW",
  '$scope/tabFlightDetails': "FLIGHT DETAILS",
  '$scope/tabPreFlightInfo': "PRE-FLIGHT INFORMATION",
  '$scope/tabInFlightInfo': "IN-FLIGHT INFORMATION",
  '$scope/tabPostFlightInfo': "POST-FLIGHT INFORMATION",
  '$scope/celebration': "Celebration",
  '$scope/flightCertificate': "Flight Certificate",
  '$scope/serviceBack': "Service back to your hotel",
  '$scope/pickUp': "Pick-up from your hotel",
  '$scope/watchingInflation': "Watching the inflation",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
