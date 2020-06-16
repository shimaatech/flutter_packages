import 'dart:convert';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:hive/hive.dart';
import 'package:serializer/serializer.dart';

class JsonTypeAdapter<T> implements TypeAdapter<T> {
  static int _nextTypeId = 0;
  final int typeId;

  JsonTypeAdapter() : typeId = _nextTypeId++;

  @override
  T read(BinaryReader reader) {
    return JsonMapper.deserialize<T>(reader.readString());
  }

  @override
  void write(BinaryWriter writer, T obj) {
    writer.writeString(JsonMapper.serialize(obj));
  }
}
