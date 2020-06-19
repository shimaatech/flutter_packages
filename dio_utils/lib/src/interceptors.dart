import 'dart:convert';

import 'package:dio/dio.dart';

class BasicAuthInterceptor extends Interceptor {
  final String username;
  final String password;

  BasicAuthInterceptor(this.username, this.password);

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['authorization'] =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }
}


class QueryParamsNormalizationInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    options.queryParameters = options.queryParameters.map((k, v) {
      if (v is List) {
        return MapEntry(k, v.join(','));
      } else {
        return MapEntry(k, v);
      }
    });
  }
}
