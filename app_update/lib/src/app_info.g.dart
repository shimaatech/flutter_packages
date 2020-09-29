// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactInfo _$_$_ContactInfoFromJson(Map<String, dynamic> json) {
  return _$_ContactInfo(
    subtitle: json['subtitle'] as String,
    url: json['url'] as String,
    hidden: json['hidden'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_ContactInfoToJson(_$_ContactInfo instance) =>
    <String, dynamic>{
      'subtitle': instance.subtitle,
      'url': instance.url,
      'hidden': instance.hidden,
    };

_$_AppInfo _$_$_AppInfoFromJson(Map<String, dynamic> json) {
  return _$_AppInfo(
    latestVersion: (json['latestVersion'] as num)?.toDouble(),
    priority: json['priority'] as int,
    contactInfo: json['contactInfo'] == null
        ? null
        : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppInfoToJson(_$_AppInfo instance) =>
    <String, dynamic>{
      'latestVersion': instance.latestVersion,
      'priority': instance.priority,
      'contactInfo': instance.contactInfo,
    };
