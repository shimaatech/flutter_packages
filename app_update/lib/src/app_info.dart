import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serializer/serializer.dart';


part 'app_info.freezed.dart';
part 'app_info.g.dart';


@freezed
class ContactInfo with _$ContactInfo {
  factory ContactInfo({
    String? title,
    String? subtitle,
    String? url,
    @Default(false) bool hidden,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);

    static final Serializer<ContactInfo> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => ContactInfo.fromJson(json),
  );
}

@freezed
class UpdateInfo with _$UpdateInfo {
  factory UpdateInfo({
    @Default(true) bool active,
    @Default(3) int priority,
  }) = _UpdateInfo;

  factory UpdateInfo.fromJson(Map<String, dynamic> json) => _$UpdateInfoFromJson(json);

    static final Serializer<UpdateInfo> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => UpdateInfo.fromJson(json),
  );
}

@freezed
class AppInfo with _$AppInfo {
  factory AppInfo({
    required double latestVersion,
    ContactInfo? contactInfo,
    UpdateInfo? updateInfo,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

    static final Serializer<AppInfo> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => AppInfo.fromJson(json),
  );
}