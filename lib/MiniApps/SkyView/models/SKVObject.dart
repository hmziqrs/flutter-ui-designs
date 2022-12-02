class SKVObject {
  SKVObject(
    this.name,
    this.nickname,
    this.positionInSystem,
    this.image, {
    required this.testKey,
    required this.distanceInKm,
    required this.distanceFromSun,
    required this.lightTimeFromSun,
    required this.lengthOfYears,
  });

  String name;
  String nickname;
  String positionInSystem;
  String image;
  String testKey;
  String distanceInKm;
  String distanceFromSun;
  String lightTimeFromSun;
  String lengthOfYears;
}
