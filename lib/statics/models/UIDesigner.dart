class UIDesigner {
  // Database
  int id;
  String username;

  // Personal Info
  String? avatar;
  String cover;
  String name;
  String? description;

  // Location
  String? job;
  String? address;
  String? location;

  // Soical Media
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedin;
  String? linkedinCompany;

  // Portfolio
  String? website;
  String? dribbble;
  String? behance;

  // Freelance
  String? fiverr;
  String? upwork;
  String? upworkCompany;

  // Direct
  String? skype;
  List<String> emails;
  List<String> phone;

  UIDesigner({
    required this.id,
    required this.username,
    this.avatar,
    this.cover = "assets/user/cover.jpg",
    required this.name,
    this.description,
    this.address,
    this.job,
    this.location,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.linkedinCompany,
    this.skype,
    this.dribbble,
    this.behance,
    this.website,
    this.fiverr,
    this.upwork,
    this.upworkCompany,
    this.emails = const [],
    this.phone = const [],
  });
}
