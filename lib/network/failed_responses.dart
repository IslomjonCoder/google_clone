import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_clone/models/universal_model.dart';

UniversalModel onError({required Response response}) {
  print('IN ON ERROR ------------------------------------------------');
  print(response.statusCode);
  switch (response.statusCode) {
    case HttpStatus.unauthorized:
      return UniversalModel(
          error: response.data['message'], statusCode: response.statusCode!);
    case HttpStatus.forbidden:
      {
        return UniversalModel(
            error: response.data['message'], statusCode: response.statusCode!);
      }

    case HttpStatus.badRequest:
      return UniversalModel(
          error: response.data['message'], statusCode: response.statusCode!);
    default:
      return UniversalModel(
          error: response.data['message'], statusCode: response.statusCode!);
  }
}
