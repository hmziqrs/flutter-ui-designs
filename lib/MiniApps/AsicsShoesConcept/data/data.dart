import 'package:pigment/pigment.dart';

import '../ models/ASCItem.dart';
export '../ models/ASCItem.dart';
import '../messages/keys.dart';

final List<ASCItem> list = [
  ASCItem(
      stars: 3,
      logoLink: "assets/ma-asc/Asics_Logo_1.png",
      shoeImage: "assets/ma-asc/red.png",
      headerHeading: 'GEL KAYANO TRAINER',
      headerDescription: ASCRootMessages.defaultDescription,
      contentHeading: "ASICS GEL KAYANO",
      contentSubHeading: ASCRootMessages.defaultSubHeading,
      price: 158.0,
      colors: ["#bfeb84", "#82d4f1", "#363158"]
          .map((String color) => Pigment.fromString(color))
          .toList()),
  ASCItem(
    stars: 4,
    logoLink: "assets/ma-asc/Asics_Logo_2.png",
    shoeImage: "assets/ma-asc/yellow.png",
    headerHeading: 'GEL KAYANO TRAINER',
    headerDescription: ASCRootMessages.defaultDescription,
    contentHeading: "ASICS GEL KAYANO",
    contentSubHeading: ASCRootMessages.defaultSubHeading,
    price: 135.0,
    colors: ['#d4d9a0', 'rgb(148, 137, 117)', '#59524a']
        .map((String color) => Pigment.fromString(color))
        .toList(),
  ),
  ASCItem(
    stars: 5,
    logoLink: "assets/ma-asc/Asics_Logo_3.png",
    shoeImage: "assets/ma-asc/blue.png",
    headerHeading: 'GEL KAYANO TRAINER',
    headerDescription: ASCRootMessages.defaultDescription,
    contentHeading: "ASICS GEL KAYANO",
    contentSubHeading: ASCRootMessages.defaultSubHeading,
    price: 135.0,
    colors: ['#6899c0', '#38499d', '#7b2e48']
        .map((String color) => Pigment.fromString(color))
        .toList(),
  ),
];
