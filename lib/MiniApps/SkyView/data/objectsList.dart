import '../models/SKVObject.dart';
export '../models/SKVObject.dart';

import '../messages/keys.dart';

final List<SKVObject> objectList = [
  new SKVObject(
    "MERCURY",
    SKVRootMessages.objectMercuryNick,
    SKVRootMessages.objectMercuryPosition,
    "assets/ma-sk/mercury.png",
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "36,116,057",
    lightTimeFromSun: "3.231326",
    lengthOfYears: "88",
  ),
  new SKVObject(
    "VENUS",
    SKVRootMessages.objectVenusNick,
    SKVRootMessages.objectVenusPosition,
    "assets/ma-sk/venus.png",
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "EARTH",
    SKVRootMessages.objectEarthNick,
    SKVRootMessages.objectEarthPosition,
    "assets/ma-sk/earth.png",
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "MARS",
    SKVRootMessages.objectMarsNick,
    SKVRootMessages.objectMarsPosition,
    "assets/ma-sk/mars.png",
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "JUPITER",
    SKVRootMessages.objectJupiterNick,
    SKVRootMessages.objectJupiterPosition,
    "assets/ma-sk/jupiter.png",
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
];
