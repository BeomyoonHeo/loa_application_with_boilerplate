import 'package:dio/dio.dart';

abstract class ResponseInterceptor {
  ResponseInterceptor._();

  static void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    final json = response.data;
    if (json is Map<String, dynamic>) {
      final responseMap = json['data'];
      response.data = responseMap;
    }
    handler.next(response);
  }
}
