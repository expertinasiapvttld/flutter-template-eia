import 'package:dio/dio.dart';
import 'package:happy_grocers/auth_module/data/datasources/auth_data_source.dart';
import 'package:happy_grocers/di/dependency_injection.dart';
import 'package:happy_grocers/utils/network/dio_api_client.dart';

class AuthDataSourceImpl extends AuthDataSource {
  int? defaultTimeout = 120;

  Dio? client;

  AuthDataSourceImpl() {
    client = getIt<DioApiClient>().getApiClient();
  }
}
