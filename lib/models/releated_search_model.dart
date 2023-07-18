class RelatedSearchModel {
  String? query;

  RelatedSearchModel({
    this.query,
  });

  factory RelatedSearchModel.fromJson(Map<String, dynamic> json) {
    return RelatedSearchModel(
      query: json["query"],
    );
  }

  Map<String, dynamic> toJson() => {
        "query": query,
      };
}
