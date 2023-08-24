import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  void set(Dio dio) {
    final Dio dio = Dio();
    dio.options.baseUrl = 'https://jsonplaceholder.org/';
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
        ),
      );
    }
  }
}