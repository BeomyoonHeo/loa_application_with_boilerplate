import 'dart:convert';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loa_application_with_boilerplate/app/environment/environment.dart';
import 'package:loa_application_with_boilerplate/data/remote/interceptors/request_interceptor.dart';
import 'package:loa_application_with_boilerplate/data/remote/interceptors/response_interceptor.dart';

dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

dynamic parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class AppDio {
  AppDio._internal();

  static Dio? _instance;

  static Dio getInstance() => _instance ??= _AppDio();
}

class _AppDio with DioMixin implements Dio {
  _AppDio() {
    httpClientAdapter = DefaultHttpClientAdapter();
    options = BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      receiveDataWhenStatusError: true,
      headers: <String, dynamic>{
        'accept': 'application/json',
      },
    );

    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: RequestInterceptor.onRequest,
        onResponse: ResponseInterceptor.onResponse,
      ),
    ]);
  }
}
