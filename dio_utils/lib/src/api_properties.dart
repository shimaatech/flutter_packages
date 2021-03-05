import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_properties.freezed.dart';

@freezed
abstract class ApiProperties with _$ApiProperties {
  factory ApiProperties({
    required String baseUrl,
    required int version,
    required int receiveTimeout,
    required int connectTimeout,
    required String username,
    required String password,
    String? tenant,
  }) = _ApiProperties;
}