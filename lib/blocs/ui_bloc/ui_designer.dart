class UIDesigner {
  // Database
  int id;
  String username;

  // Personal Info
  String avatar;
  String cover;
  String name;
  String description;

  // Location
  String job;
  String address;
  String location;

  // Soical Media
  String facebook;
  String twitter;
  String instagram;
  String linkedin;

  // Portfolio
  String website;
  String dribbble;
  String behance;

  // Freelance
  String fiverr;
  String upwork;

  // Direct
  String skype;
  List<String> emails;
  List<String> phone;

  UIDesigner({
    this.id,
    this.username,
    this.avatar,
    this.cover = "assets/user/cover.jpg",
    this.name,
    this.description,
    this.address,
    this.job,
    this.location,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.skype,
    this.dribbble,
    this.behance,
    this.website,
    this.fiverr,
    this.upwork,
    this.emails,
    this.phone,
  });

  UIDesigner.fromMap(Map json) {
    this.id = json["id"];
    this.username = json["username"];
    this.avatar = json["avatar"];
    this.cover = json["cover"];
    this.name = json["name"];
    this.description = json["description"];
    this.address = json["address"];
    this.job = json["job"];
    this.location = json["location"];
    this.facebook = json["facebook"];
    this.twitter = json["twitter"];
    this.instagram = json["instagram"];
    this.linkedin = json["linkedin"];
    this.skype = json["skype"];
    this.dribbble = json["dribbble"];
    this.behance = json["behance"];
    this.website = json["website"];
    this.fiverr = json["fiverr"];
    this.upwork = json["upwork"];
    this.emails = json["emails"];
    this.phone = json["phone"];
  }
}
