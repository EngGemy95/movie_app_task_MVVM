import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/constants.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> _headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: _headers,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
    );

    if (!kReleaseMode) {
      // It is debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
