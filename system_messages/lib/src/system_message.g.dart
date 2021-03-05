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
    args: (json['args'] as Map?)?.map(
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

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$NavigationTypeEnumMap = {
  NavigationType.internal: 'internal',
  NavigationType.external: 'external',
  NavigationType.embedded: 'embedded',
  NavigationType.upgrade: 'upgrade',
  NavigationType.rate: 'rate',
};

_$_SystemMessageImage _$_$_SystemMessageImageFromJson(Map json) {
  return _$_SystemMessageImage(
    url: json['url'] as String,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
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
    type: _$enumDecode(_$SystemMessageTypeEnumMap, json['type']),
    package: json['package'] as String,
    minAppVersion: (json['minAppVersion'] as num).toDouble(),
    maxAppVersion: (json['maxAppVersion'] as num).toDouble(),
    langCode: json['langCode'] as String?,
    testMode: json['testMode'] as bool?,
    linkText: json['linkText'] as String?,
    titleIcon: json['titleIcon'] as int?,
    backgroundColor: json['backgroundColor'] as int?,
    image: json['image'] == null
        ? null
        : SystemMessageImage.fromJson(
            Map<String, dynamic>.from(json['image'] as Map)),
    titleIconClickSpec: json['titleIconClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson(
            Map<String, dynamic>.from(json['titleIconClickSpec'] as Map)),
    linkClickSpec: json['linkClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson(
            Map<String, dynamic>.from(json['linkClickSpec'] as Map)),
    cardClickSpec: json['cardClickSpec'] == null
        ? null
        : SystemMessageClickSpec.fromJson(
            Map<String, dynamic>.from(json['cardClickSpec'] as Map)),
    expirationTime:
        const UtcIsoDateConverter().fromJson(json['expirationTime'] as String),
    startTime:
        const UtcIsoDateConverter().fromJson(json['startTime'] as String),
    installedBefore:
        const UtcIsoDateConverter().fromJson(json['installedBefore'] as String),
  );
}

Map<String, dynamic> _$_$_SystemMessageToJson(_$_SystemMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': _$SystemMessageTypeEnumMap[instance.type],
      'package': instance.package,
      'minAppVersion': instance.minAppVersion,
      'maxAppVersion': instance.maxAppVersion,
      'langCode': instance.langCode,
      'testMode': instance.testMode,
      'linkText': instance.linkText,
      'titleIcon': instance.titleIcon,
      'backgroundColor': instance.backgroundColor,
      'image': instance.image?.toJson(),
      'titleIconClickSpec': instance.titleIconClickSpec?.toJson(),
      'linkClickSpec': instance.linkClickSpec?.toJson(),
      'cardClickSpec': instance.cardClickSpec?.toJson(),
      'expirationTime':
          const UtcIsoDateConverter().toJson(instance.expirationTime!),
      'startTime': const UtcIsoDateConverter().toJson(instance.startTime!),
      'installedBefore':
          const UtcIsoDateConverter().toJson(instance.installedBefore!),
    };

const _$SystemMessageTypeEnumMap = {
  SystemMessageType.normal: 'normal',
  SystemMessageType.dialog: 'dialog',
};
