class SearchParametersModel {
  String? q;
  String? gl;
  String? hl;
  int? num;
  bool? autocorrect;
  int? page;
  String? type;

  SearchParametersModel({
    this.q,
    this.gl,
    this.hl,
    this.num,
    this.autocorrect,
    this.page,
    this.type,
  });

  factory SearchParametersModel.fromJson(Map<String, dynamic> json) {
    return SearchParametersModel(
      q: json["q"],
      gl: json["gl"],
      hl: json["hl"],
      num: json["num"],
      autocorrect: json["autocorrect"],
      page: json["page"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "q": q,
        "gl": gl,
        "hl": hl,
        "num": num,
        "autocorrect": autocorrect,
        "page": page,
        "type": type,
      };
}
