import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serializer/serializer.dart';


part 'app_info.freezed.dart';
part 'app_info.g.dart';


@freezed
abstract class ContactInfo with _$ContactInfo {
  factory ContactInfo({
    String subtitle,
    String url,
    @Default(false) bool hidden,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);

    static final Serializer<ContactInfo> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => ContactInfo.fromJson(json),
  );
}

@freezed
abstract class AppInfo with _$AppInfo {
  factory AppInfo({
    double latestVersion,
    int priority,
    ContactInfo contactInfo
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

    static final Serializer<AppInfo> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => AppInfo.fromJson(json),
  );
}