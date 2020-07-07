import '../models/HABFlight.dart';
export '../models/HABFlight.dart';

final flights = [
  new HABFlight(
    id: 1,
    name: "Standard",
    people: "20-24 people",
    basketSize: "20 or 24 people baskets with 4 compartments",
    shortDesc: "One hour in a 20 people basket",
    time: "Minimum 1 hour in our standard flight",
    price: "Our Standard flight is 190€ per person",
    desc:
        "The flight is minimum one hour and we will ascend anywhere from rock formations to several thousand feet. Once you’re airborne your pilot will point out the spectacular sites of Cappadocia, from Red Valley to the Goreme and vineyards to rock formations, absolutely beauty of the nature. Our flying area has many wonderful things to see.",
  ),
  new HABFlight(
    id: 2,
    name: "Ultra Comfort",
    people: "8-16 people",
    basketSize: "8 or 16 people baskets with 4 compartments",
    shortDesc: "75 to 90 minutes in 16 people basket",
    time: "Min. 75 minutes to 90 minutes flight in our ultra comfort flight",
    price: "Our Ultra Comfort flight is 230€ per person",
    desc:
        "The flight is minimum 75 to 90 minutes hour and we will ascend anywhere from rock formations to several thousand feet. Once you’re airborne your pilot will point out the spectacular sites of Cappadocia, from Red Valley to the Goreme and vineyards to rock formations, absolutely beauty of the nature. Our flying area has many wonderful things to see.",
  ),
  new HABFlight(
    id: 3,
    name: "Exclusive",
    people: "4 people",
    basketSize: "4 people baskets with 1 compartment",
    breakFastType: "In-flight breakfast",
    breakFast:
        "The breakfast of Vista basket is in-flight service and before the flight we offer you a hot drinks and during the flight you can enjoy your breakfast. We promise you that it will be an unforgettable breakfast in the open sky.",
    shortDesc: "One hour and a half in a 4 people basket",
    time: "Minimum 1 and a half hour in our Exclusive flight",
    price: "Our Exclusive Flights is 3600€ for the basket, per flight.",
    desc:
        '''We fly through the Cappadocian Valleys for one and a half hours in a private balloon up to four passengers. Our personal touch and professional experience will definitely make your flight “a memorable event” for long years to come.
\n
Our Vista basket is the only example in the world for hot air balloon flights. Its a seated basket which you can enjoy the scenery while you are having your champagne. The seated basket price is 2000€ and it is not per person. Max. capacity of the basket is 4 persons and it can be one person or 4 persons.
\n
Your exclusive balloon ride will be created to your desires and wishes from the time we collect you from your location.''',
  ),
];
