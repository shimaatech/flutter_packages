library serializer;

import 'package:json_annotation/json_annotation.dart';

typedef Deserialize<T> = T Function(Map<String, dynamic> json);
typedef Serialize<T> = Map<String, dynamic> Function(T obj);

class Serializer<T> {

  final Serialize<T> serialize;
  final Deserialize<T> deserialize;

  Serializer(this.serialize, this.deserialize);

}


class UtcIsoDateConverter implements JsonConverter<DateTime, String> {
  const UtcIsoDateConverter();

  @override
  DateTime fromJson(String json) {
    if (json == null) {
      return null;
    }
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime datetime) {
    if (datetime == null) {
      return null;
    }
    if (!datetime.isUtc) {
      throw Exception('DateTime must be in utc');
    }
    String json = datetime.toIso8601String();
    if (json.contains('.')) {
      json = '${json.replaceRange(json.indexOf('.'), json.length, '')}Z';
    }
    return json;
  }
}

