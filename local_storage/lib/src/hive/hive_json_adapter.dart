import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:serializer/serializer.dart';

class JsonTypeAdapter<T> implements TypeAdapter<T> {
  static int _nextTypeId = 0;
  final int typeId;

  final Serializer<T> serializer;

  JsonTypeAdapter(this.serializer) : typeId = _nextTypeId++;

  @override
  T read(BinaryReader reader) {
    return serializer.deserialize(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, T obj) {
    writer.writeString(jsonEncode(serializer.serialize(obj)));
  }
}
