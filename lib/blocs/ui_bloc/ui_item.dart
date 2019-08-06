class UIItem {
  int id;
  String name;
  String designer;
  String source;
  String miniApp;
  String link;
  String thumbnail;

  UIItem({
    this.id,
    this.name,
    this.designer,
    this.source,
    this.miniApp,
    this.link,
    this.thumbnail,
  });

  UIItem.fromMap(Map json) {
    this.id = json["id"];
    this.name = json["name"];
    this.designer = json["designer"];
    this.source = json["source"];
    this.miniApp = json["miniApp"];
    this.link = json["link"];
    this.thumbnail = json["thumbnail"];
  }
}
