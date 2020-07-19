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
}
