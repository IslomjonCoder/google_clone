import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_clone/models/search_model.dart';
import 'package:google_clone/models/universal_model.dart';
import 'package:google_clone/network/failed_responses.dart';
import 'package:google_clone/utils/constants.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<UniversalModel> searchFromGoogle(
      {required String query, required int page, int count = 5}) async {
    String url = '$baseUrl/search';
    try {
      final response = await dio.post(
        url,
        queryParameters: {'q': query, "page": page, "num": count},
        options: Options(
          headers: {
            'X-API-KEY': 'f0ad8a233ec84eb6f9833b53c47ac133ec60676a',
            'Content-Type': 'application/json',
          },
        ),
      );
      return (response.statusCode == HttpStatus.ok)
          ? UniversalModel(
              data: SearchModel.fromJson(response.data), statusCode: 200)
          : onError(
              response: response,
            );

      // } on DioException {
      //   return UniversalModel(
      //     error: "Internet Error!",
      //   );
      // } on FormatException {
      //   return UniversalModel(error: "Format error");
    } catch (e) {
      return UniversalModel(error: e.toString());
    } catch (e) {
      return UniversalModel(error: e.toString());
    }
  }
}
