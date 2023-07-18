import 'package:google_clone/models/site_link_model.dart';

class OrganicModel {
  String title;
  String link;
  String snippet;
  List<SitelinkModel>? sitelinks;
  int position;

  OrganicModel({
    required this.title,
    required this.link,
    required this.snippet,
    this.sitelinks,
    required this.position,
  });

  factory OrganicModel.fromJson(Map<String, dynamic> json) {
    return OrganicModel(
      title: json["title"],
      link: json["link"],
      snippet: json["snippet"],
      sitelinks: List<SitelinkModel>.from(
          json["sitelinks"]?.map((x) => SitelinkModel.fromJson(x)).toList() ??
              []),
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "snippet": snippet,
        "sitelinks": List<dynamic>.from(sitelinks!.map((x) => x.toJson())),
        "position": position,
      };
}
