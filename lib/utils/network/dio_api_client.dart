import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:happy_grocers/utils/network/auth_interceptor.dart';
import 'package:happy_grocers/utils/network/dio_logger_interceptors.dart';
import 'package:happy_grocers/utils/network/error_interceptor.dart';

/// This is the singleton API client class which handlers all cloud  transactions
/// All the task raw queries is handle here and return a Future<T> with result
class DioApiClient {
  static const int timeout = 30000;

  bool? didInit = false;

  Dio? dio;

  Dio? getApiClient() {
    return dio;
  }

  DioApiClient() {
    String? baseUrl = dotenv.env['API_BASE_URL'];
    var options = BaseOptions(baseUrl: baseUrl ?? '');
    dio = Dio(options);
    dio?.interceptors.add(AuthInterceptor());
    dio?.interceptors.add(DioLogInterceptor());
    dio?.interceptors.add(ErrorInterceptor());
  }
}
