import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:serializer/serializer.dart';

part 'list_wrappers.freezed.dart';
part 'list_wrappers.g.dart';

@freezed
class StringList with _$StringList {
  factory StringList(List<String>? data) = _StringList;

  factory StringList.fromJson(Map<String, dynamic> json) =>
      _$StringListFromJson(json);

  static final Serializer<StringList> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => StringList.fromJson(json),
  );
}

@freezed
class IntList with _$IntList {
  factory IntList(List<int>? data) = _IntList;

  factory IntList.fromJson(Map<String, dynamic> json) =>
      _$IntListFromJson(json);

  static final Serializer<IntList> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => IntList.fromJson(json),
  );
}

@freezed
class DoubleList with _$DoubleList {
  factory DoubleList(List<double>? data) = _DoubleList;

  factory DoubleList.fromJson(Map<String, dynamic> json) =>
      _$DoubleListFromJson(json);

  static final Serializer<DoubleList> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => DoubleList.fromJson(json),
  );
}
