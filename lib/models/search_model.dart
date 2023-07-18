import 'package:google_clone/models/organic_model.dart';
import 'package:google_clone/models/releated_search_model.dart';
import 'package:google_clone/models/search_parametrs_model.dart';

class SearchModel {
  SearchParametersModel? searchParameters;
  List<OrganicModel> organic;
  List<RelatedSearchModel> relatedSearches;

  SearchModel({
    this.searchParameters,
    required this.organic,
    required this.relatedSearches,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      searchParameters:
          SearchParametersModel.fromJson(json["searchParameters"]),
      organic: List<OrganicModel>.from(
          json["organic"].map((x) => OrganicModel.fromJson(x)).toList() ?? []),
      relatedSearches: List<RelatedSearchModel>.from(json["relatedSearches"]
              ?.map((x) => RelatedSearchModel.fromJson(x))
              .toList() ??
          []),
    );
  }

  Map<String, dynamic> toJson() => {
        "searchParameters": searchParameters?.toJson(),
        "organic": List<dynamic>.from(organic!.map((x) => x.toJson())),
        "relatedSearches":
            List<dynamic>.from(relatedSearches!.map((x) => x.toJson())),
      };
}
