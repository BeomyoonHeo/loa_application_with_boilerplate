import 'package:dio/dio.dart';

class NetworkException extends DioError {
  NetworkException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);

  @override
  String get message => '네트워크 에러가 발생했습니다.\n 인터넷 연결을 확인해주세요.';

  @override
  String toString() {
    return message;
  }
}
