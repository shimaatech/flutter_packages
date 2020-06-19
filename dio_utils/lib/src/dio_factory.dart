import 'package:dio/dio.dart';
import 'package:diou_tils/dio_utils.dart';

class DioFactory {

  static Dio create(ApiProperties properties, [List<Interceptor> interceptors]) {
    BaseOptions options = BaseOptions(
      baseUrl: properties.baseUrl,
      receiveTimeout: properties.receiveTimeout,
      connectTimeout: properties.connectTimeout,
    );
    return Dio(options)..interceptors.addAll(interceptors);
  }
}