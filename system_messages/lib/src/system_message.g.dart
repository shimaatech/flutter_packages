// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemMessageClickSpec _$_$_SystemMessageClickSpecFromJson(Map json) {
  return _$_SystemMessageClickSpec(
    navigationType:
        _$enumDecodeNullable(_$NavigationTypeEnumMap, json['navigationType']),
    url: json['url'] as String,
    args: (json['args'] as Map)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
  );
}

Map<String, dynamic> _$_$_SystemMessageClickSpecToJson(
        _$_SystemMessageClickSpec instance) =>
    <String, dynamic>{
      'navigationType': _$NavigationTypeEnumMap[instance.navigationType],
      'url': instance.url,
      'args': instance.args,
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

const _$NavigationTypeEnumMap = {
  NavigationType.internal: 'internal',
  NavigationType.external: 'external',
};

_$_SystemMessageImage _$_$_SystemMessageImageFromJson(Map json) {
  return _$_SystemMessageImage(
    url: json['url'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_SystemMessageImageToJson(
        _$_SystemMessageImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$_SystemMessage _$_$_SystemMessageFromJson(Map json) {
  return _$_SystemMessage(
    id: json['id'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    langCode: json['langCode'] as String,
    type: _$enumDecodeNullable(_$SystemMessageTypeEnumMap, json['type']),
    package: json['package'] as String,
    minAppVersion: (json['minAppVersion'] as num)?.toDouble(),
    maxAppVersion: (json['maxAppVersion'] as num)?.toDouble(),
    testMode: json['testMode'] as bool,
    linkText: json['linkText'] as String,
    titleIcon: json['titleIcon'] as int,
    backgroundColor: json['backgroundColor'] as int,
    image: json['image'] == null
        ? null
        : SystemMessageImage.fromJson((json['image'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    titleIconClickSpec: json['titleIconClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson(
            (json['titleIconClickSpec'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    linkClickSpec: json['linkClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson((json['linkClickSpec'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    cardClickSpec: json['cardClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson((json['cardClickSpec'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
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
      'minAppVersion': instance.minAppVersion,
      'maxAppVersion': instance.maxAppVersion,
      'testMode': instance.testMode,
      'linkText': instance.linkText,
      'titleIcon': instance.titleIcon,
      'backgroundColor': instance.backgroundColor,
      'image': instance.image?.toJson(),
      'titleIconClickSpec': instance.titleIconClickSpec?.toJson(),
      'linkClickSpec': instance.linkClickSpec?.toJson(),
      'cardClickSpec': instance.cardClickSpec?.toJson(),
      'expirationDate':
          const UtcIsoDateConverter().toJson(instance.expirationDate),
    };

const _$SystemMessageTypeEnumMap = {
  SystemMessageType.normal: 'normal',
  SystemMessageType.dialog: 'dialog',
};
