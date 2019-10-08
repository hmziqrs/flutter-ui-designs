class SpaceObject {
  SpaceObject(
    this.name,
    this.nickname,
    this.positionInSystem,
    this.image, {
    this.distanceInKm,
    this.distanceFromSun,
    this.lightTimeFromSun,
    this.lengthOfYears,
  });

  String name;
  String nickname;
  String positionInSystem;
  String image;
  String distanceInKm;
  String distanceFromSun;
  String lightTimeFromSun;
  String lengthOfYears;
}
