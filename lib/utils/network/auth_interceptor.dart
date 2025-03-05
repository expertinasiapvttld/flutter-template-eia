import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:happy_grocers/utils/logger/logger.dart';

class AuthInterceptor implements InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, handler) async {
    String apiKey = dotenv.env['API_KEY'] ?? '';
    options.headers.addAll({
      HttpHeaders.authorizationHeader:
          '', //ApiConstants.loadAuthorizationHeader(),
      'key': apiKey,
    });
    handler.next(options);
  }

  @override
  Future onResponse(Response response, handler) async {
    log.d("<< onResponse ${response.statusCode}");
    int statusCode = response.statusCode ?? 0;
    if (statusCode == 401) {
      // eventBus.fire(const UnauthorisedEventBus());
    }
    handler.next(response);
  }

  @override
  Future onError(DioException e, handler) async {
    log.d("<< onError", e);
    handler.next(e);
  }
}
