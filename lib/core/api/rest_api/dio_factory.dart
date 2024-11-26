import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const timeoutTimeMilliseconds = 30 * 1000;
const api_key = '2743e704710b4b0da9a124553242611';

class DioFactory {
  static Dio newInstance() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: timeoutTimeMilliseconds),
        receiveTimeout: const Duration(milliseconds: timeoutTimeMilliseconds),
        sendTimeout: const Duration(milliseconds: timeoutTimeMilliseconds),
        receiveDataWhenStatusError: true,
      ),
    );

    dio.options.baseUrl = 'http://api.weatherapi.com/v1/';
    dio.options.queryParameters = {'key': api_key, 'lang': 'ru'};

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
