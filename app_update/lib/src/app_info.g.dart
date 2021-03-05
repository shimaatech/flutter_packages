// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactInfo _$_$_ContactInfoFromJson(Map<String, dynamic> json) {
  return _$_ContactInfo(
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    url: json['url'] as String?,
    hidden: json['hidden'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_ContactInfoToJson(_$_ContactInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'url': instance.url,
      'hidden': instance.hidden,
    };

_$_UpdateInfo _$_$_UpdateInfoFromJson(Map<String, dynamic> json) {
  return _$_UpdateInfo(
    active: json['active'] as bool? ?? true,
    priority: json['priority'] as int? ?? 3,
  );
}

Map<String, dynamic> _$_$_UpdateInfoToJson(_$_UpdateInfo instance) =>
    <String, dynamic>{
      'active': instance.active,
      'priority': instance.priority,
    };

_$_AppInfo _$_$_AppInfoFromJson(Map<String, dynamic> json) {
  return _$_AppInfo(
    latestVersion: (json['latestVersion'] as num).toDouble(),
    contactInfo: json['contactInfo'] == null
        ? null
        : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
    updateInfo: json['updateInfo'] == null
        ? null
        : UpdateInfo.fromJson(json['updateInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppInfoToJson(_$_AppInfo instance) =>
    <String, dynamic>{
      'latestVersion': instance.latestVersion,
      'contactInfo': instance.contactInfo,
      'updateInfo': instance.updateInfo,
    };
