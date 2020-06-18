import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_properties.freezed.dart';

@freezed
abstract class ApiProperties with _$ApiProperties {
  factory ApiProperties({
    String baseUrl,
    int version,
    int receiveTimeout,
    int connectTimeout,
    String username,
    String password,
  }) = _ApiProperties;
}