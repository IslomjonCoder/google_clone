class SitelinkModel {
  String? title;
  String? link;

  SitelinkModel({
    this.title,
    this.link,
  });

  factory SitelinkModel.fromJson(Map<String, dynamic> json) {
    return SitelinkModel(
      title: json["title"],
      link: json["link"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
      };
}
