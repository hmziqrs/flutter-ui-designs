class UIItem {
  int id;
  String name;
  String description;
  String designer;
  String source;
  String miniApp;
  String link;
  String thumbnail;
  bool tabletSupport;
  bool webSupport;
  bool landscapeSupport;
  bool desktopSupport;

  UIItem({
    this.id,
    this.name,
    this.description,
    this.designer,
    this.source,
    this.miniApp,
    this.link,
    this.thumbnail,
    this.landscapeSupport = false,
    this.tabletSupport = false,
    this.webSupport = false,
    this.desktopSupport = false,
  });

  UIItem.fromMap(Map json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
    this.designer = json["designer"];
    this.source = json["source"];
    this.miniApp = json["miniApp"];
    this.link = json["link"];
    this.thumbnail = json["thumbnail"];
    this.tabletSupport = json["thumbnail"];
    this.webSupport = json["thumbnail"];
    this.landscapeSupport = json["thumbnail"];
    this.desktopSupport = json["thumbnail"];
  }
}
