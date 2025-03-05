import 'dart:async';
import 'package:dio/dio.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';
import 'package:happy_grocers/utils/logger/logger.dart';

class ErrorInterceptor implements InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Do something before request is sent
    handler.next(options);
  }

  @override
  Future onResponse(Response response, handler) async {
    log.d("OnResponse");
    // Do something with response data
    handler.next(response);
  }

  @override
  Future onError(DioException e, handler) async {
    log.d("OnError", e);
    if (e.response != null) {
      int statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 401) {
        log.d("Unauthorised --- 401 ---");
        StorageManager.getInstance().clear();
        // eventBus.fire(const UnauthorisedEventBus());
      }
    }
    handler.next(e);
  }
}
