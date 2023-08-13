import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:loa_application_with_boilerplate/data/remote/network/exception/network_exception.dart';

abstract class RequestInterceptor {
  RequestInterceptor._();

  static void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.ethernet ||
        connectivity == ConnectivityResult.mobile) {
      handler.next(options);
    } else {
      handler.reject(NetworkException(requestOptions: options));
    }
  }
}
