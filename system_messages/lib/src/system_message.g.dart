// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemMessage _$_$_SystemMessageFromJson(Map json) {
  return _$_SystemMessage(
    id: json['id'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    langCode: json['langCode'] as String,
    type: _$enumDecodeNullable(_$SystemMessageTypeEnumMap, json['type']),
    package: json['package'] as String,
    testMode: json['testMode'] as bool,
    expirationDate:
        const UtcIsoDateConverter().fromJson(json['expirationDate'] as String),
  );
}

Map<String, dynamic> _$_$_SystemMessageToJson(_$_SystemMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'langCode': instance.langCode,
      'type': _$SystemMessageTypeEnumMap[instance.type],
      'package': instance.package,
      'testMode': instance.testMode,
      'expirationDate':
          const UtcIsoDateConverter().toJson(instance.expirationDate),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SystemMessageTypeEnumMap = {
  SystemMessageType.normal: 'normal',
  SystemMessageType.dialog: 'dialog',
};
