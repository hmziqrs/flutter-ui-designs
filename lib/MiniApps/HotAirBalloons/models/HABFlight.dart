import '../messages/keys.dart';

class HABFlight {
  HABFlight({
    required this.id,
    required this.name,
    required this.testKey,
    required this.people,
    required this.basketSize,
    required this.shortDesc,
    breakFast,
    breakFastType,
    required this.time,
    required this.price,
    required this.desc,
  })  : this.breakFast = breakFast ?? HABRootMessages.defaultBreakFast,
        this.breakFastType =
            breakFastType ?? HABRootMessages.defaultBreakFastType;

  final int id;
  final String name;
  final String testKey;
  final String people;
  final String basketSize;
  final String shortDesc;
  final String time;
  final String price;
  final String desc;

  // Pre Flight
  final String pickUp = HABRootMessages.defaultPickUp;
  final String breakFastType;
  final String breakFast;
  final String inflation = HABRootMessages.defaultInflation;

  final String inFlightInfo = HABRootMessages.defaultInFlighInfo;

  // Post Flight
  final String celebration = HABRootMessages.defaultCelebration;
  final String certificate = HABRootMessages.defaultCertificate;
  final String serviceBack = HABRootMessages.defaultServiceBack;
}
