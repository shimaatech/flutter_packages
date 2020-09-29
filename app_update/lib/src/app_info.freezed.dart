// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

class _$ContactInfoTearOff {
  const _$ContactInfoTearOff();

// ignore: unused_element
  _ContactInfo call(
      {String title, String subtitle, String url, bool hidden = false}) {
    return _ContactInfo(
      title: title,
      subtitle: subtitle,
      url: url,
      hidden: hidden,
    );
  }
}

// ignore: unused_element
const $ContactInfo = _$ContactInfoTearOff();

mixin _$ContactInfo {
  String get title;
  String get subtitle;
  String get url;
  bool get hidden;

  Map<String, dynamic> toJson();
  $ContactInfoCopyWith<ContactInfo> get copyWith;
}

abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res>;
  $Res call({String title, String subtitle, String url, bool hidden});
}

class _$ContactInfoCopyWithImpl<$Res> implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  final ContactInfo _value;
  // ignore: unused_field
  final $Res Function(ContactInfo) _then;

  @override
  $Res call({
    Object title = freezed,
    Object subtitle = freezed,
    Object url = freezed,
    Object hidden = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      url: url == freezed ? _value.url : url as String,
      hidden: hidden == freezed ? _value.hidden : hidden as bool,
    ));
  }
}

abstract class _$ContactInfoCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$ContactInfoCopyWith(
          _ContactInfo value, $Res Function(_ContactInfo) then) =
      __$ContactInfoCopyWithImpl<$Res>;
  @override
  $Res call({String title, String subtitle, String url, bool hidden});
}

class __$ContactInfoCopyWithImpl<$Res> extends _$ContactInfoCopyWithImpl<$Res>
    implements _$ContactInfoCopyWith<$Res> {
  __$ContactInfoCopyWithImpl(
      _ContactInfo _value, $Res Function(_ContactInfo) _then)
      : super(_value, (v) => _then(v as _ContactInfo));

  @override
  _ContactInfo get _value => super._value as _ContactInfo;

  @override
  $Res call({
    Object title = freezed,
    Object subtitle = freezed,
    Object url = freezed,
    Object hidden = freezed,
  }) {
    return _then(_ContactInfo(
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      url: url == freezed ? _value.url : url as String,
      hidden: hidden == freezed ? _value.hidden : hidden as bool,
    ));
  }
}

@JsonSerializable()
class _$_ContactInfo implements _ContactInfo {
  _$_ContactInfo({this.title, this.subtitle, this.url, this.hidden = false})
      : assert(hidden != null);

  factory _$_ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ContactInfoFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String url;
  @JsonKey(defaultValue: false)
  @override
  final bool hidden;

  @override
  String toString() {
    return 'ContactInfo(title: $title, subtitle: $subtitle, url: $url, hidden: $hidden)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContactInfo &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.hidden, hidden) ||
                const DeepCollectionEquality().equals(other.hidden, hidden)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(hidden);

  @override
  _$ContactInfoCopyWith<_ContactInfo> get copyWith =>
      __$ContactInfoCopyWithImpl<_ContactInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContactInfoToJson(this);
  }
}

abstract class _ContactInfo implements ContactInfo {
  factory _ContactInfo(
      {String title,
      String subtitle,
      String url,
      bool hidden}) = _$_ContactInfo;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$_ContactInfo.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get url;
  @override
  bool get hidden;
  @override
  _$ContactInfoCopyWith<_ContactInfo> get copyWith;
}

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

class _$UpdateInfoTearOff {
  const _$UpdateInfoTearOff();

// ignore: unused_element
  _UpdateInfo call({bool active = true, int priority = 3}) {
    return _UpdateInfo(
      active: active,
      priority: priority,
    );
  }
}

// ignore: unused_element
const $UpdateInfo = _$UpdateInfoTearOff();

mixin _$UpdateInfo {
  bool get active;
  int get priority;

  Map<String, dynamic> toJson();
  $UpdateInfoCopyWith<UpdateInfo> get copyWith;
}

abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res>;
  $Res call({bool active, int priority});
}

class _$UpdateInfoCopyWithImpl<$Res> implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  final UpdateInfo _value;
  // ignore: unused_field
  final $Res Function(UpdateInfo) _then;

  @override
  $Res call({
    Object active = freezed,
    Object priority = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed ? _value.active : active as bool,
      priority: priority == freezed ? _value.priority : priority as int,
    ));
  }
}

abstract class _$UpdateInfoCopyWith<$Res> implements $UpdateInfoCopyWith<$Res> {
  factory _$UpdateInfoCopyWith(
          _UpdateInfo value, $Res Function(_UpdateInfo) then) =
      __$UpdateInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool active, int priority});
}

class __$UpdateInfoCopyWithImpl<$Res> extends _$UpdateInfoCopyWithImpl<$Res>
    implements _$UpdateInfoCopyWith<$Res> {
  __$UpdateInfoCopyWithImpl(
      _UpdateInfo _value, $Res Function(_UpdateInfo) _then)
      : super(_value, (v) => _then(v as _UpdateInfo));

  @override
  _UpdateInfo get _value => super._value as _UpdateInfo;

  @override
  $Res call({
    Object active = freezed,
    Object priority = freezed,
  }) {
    return _then(_UpdateInfo(
      active: active == freezed ? _value.active : active as bool,
      priority: priority == freezed ? _value.priority : priority as int,
    ));
  }
}

@JsonSerializable()
class _$_UpdateInfo implements _UpdateInfo {
  _$_UpdateInfo({this.active = true, this.priority = 3})
      : assert(active != null),
        assert(priority != null);

  factory _$_UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateInfoFromJson(json);

  @JsonKey(defaultValue: true)
  @override
  final bool active;
  @JsonKey(defaultValue: 3)
  @override
  final int priority;

  @override
  String toString() {
    return 'UpdateInfo(active: $active, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateInfo &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(priority);

  @override
  _$UpdateInfoCopyWith<_UpdateInfo> get copyWith =>
      __$UpdateInfoCopyWithImpl<_UpdateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateInfoToJson(this);
  }
}

abstract class _UpdateInfo implements UpdateInfo {
  factory _UpdateInfo({bool active, int priority}) = _$_UpdateInfo;

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfo.fromJson;

  @override
  bool get active;
  @override
  int get priority;
  @override
  _$UpdateInfoCopyWith<_UpdateInfo> get copyWith;
}

AppInfo _$AppInfoFromJson(Map<String, dynamic> json) {
  return _AppInfo.fromJson(json);
}

class _$AppInfoTearOff {
  const _$AppInfoTearOff();

// ignore: unused_element
  _AppInfo call(
      {double latestVersion, ContactInfo contactInfo, UpdateInfo updateInfo}) {
    return _AppInfo(
      latestVersion: latestVersion,
      contactInfo: contactInfo,
      updateInfo: updateInfo,
    );
  }
}

// ignore: unused_element
const $AppInfo = _$AppInfoTearOff();

mixin _$AppInfo {
  double get latestVersion;
  ContactInfo get contactInfo;
  UpdateInfo get updateInfo;

  Map<String, dynamic> toJson();
  $AppInfoCopyWith<AppInfo> get copyWith;
}

abstract class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) then) =
      _$AppInfoCopyWithImpl<$Res>;
  $Res call(
      {double latestVersion, ContactInfo contactInfo, UpdateInfo updateInfo});

  $ContactInfoCopyWith<$Res> get contactInfo;
  $UpdateInfoCopyWith<$Res> get updateInfo;
}

class _$AppInfoCopyWithImpl<$Res> implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._value, this._then);

  final AppInfo _value;
  // ignore: unused_field
  final $Res Function(AppInfo) _then;

  @override
  $Res call({
    Object latestVersion = freezed,
    Object contactInfo = freezed,
    Object updateInfo = freezed,
  }) {
    return _then(_value.copyWith(
      latestVersion: latestVersion == freezed
          ? _value.latestVersion
          : latestVersion as double,
      contactInfo: contactInfo == freezed
          ? _value.contactInfo
          : contactInfo as ContactInfo,
      updateInfo:
          updateInfo == freezed ? _value.updateInfo : updateInfo as UpdateInfo,
    ));
  }

  @override
  $ContactInfoCopyWith<$Res> get contactInfo {
    if (_value.contactInfo == null) {
      return null;
    }
    return $ContactInfoCopyWith<$Res>(_value.contactInfo, (value) {
      return _then(_value.copyWith(contactInfo: value));
    });
  }

  @override
  $UpdateInfoCopyWith<$Res> get updateInfo {
    if (_value.updateInfo == null) {
      return null;
    }
    return $UpdateInfoCopyWith<$Res>(_value.updateInfo, (value) {
      return _then(_value.copyWith(updateInfo: value));
    });
  }
}

abstract class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) then) =
      __$AppInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {double latestVersion, ContactInfo contactInfo, UpdateInfo updateInfo});

  @override
  $ContactInfoCopyWith<$Res> get contactInfo;
  @override
  $UpdateInfoCopyWith<$Res> get updateInfo;
}

class __$AppInfoCopyWithImpl<$Res> extends _$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(_AppInfo _value, $Res Function(_AppInfo) _then)
      : super(_value, (v) => _then(v as _AppInfo));

  @override
  _AppInfo get _value => super._value as _AppInfo;

  @override
  $Res call({
    Object latestVersion = freezed,
    Object contactInfo = freezed,
    Object updateInfo = freezed,
  }) {
    return _then(_AppInfo(
      latestVersion: latestVersion == freezed
          ? _value.latestVersion
          : latestVersion as double,
      contactInfo: contactInfo == freezed
          ? _value.contactInfo
          : contactInfo as ContactInfo,
      updateInfo:
          updateInfo == freezed ? _value.updateInfo : updateInfo as UpdateInfo,
    ));
  }
}

@JsonSerializable()
class _$_AppInfo implements _AppInfo {
  _$_AppInfo({this.latestVersion, this.contactInfo, this.updateInfo});

  factory _$_AppInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_AppInfoFromJson(json);

  @override
  final double latestVersion;
  @override
  final ContactInfo contactInfo;
  @override
  final UpdateInfo updateInfo;

  @override
  String toString() {
    return 'AppInfo(latestVersion: $latestVersion, contactInfo: $contactInfo, updateInfo: $updateInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppInfo &&
            (identical(other.latestVersion, latestVersion) ||
                const DeepCollectionEquality()
                    .equals(other.latestVersion, latestVersion)) &&
            (identical(other.contactInfo, contactInfo) ||
                const DeepCollectionEquality()
                    .equals(other.contactInfo, contactInfo)) &&
            (identical(other.updateInfo, updateInfo) ||
                const DeepCollectionEquality()
                    .equals(other.updateInfo, updateInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latestVersion) ^
      const DeepCollectionEquality().hash(contactInfo) ^
      const DeepCollectionEquality().hash(updateInfo);

  @override
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppInfoToJson(this);
  }
}

abstract class _AppInfo implements AppInfo {
  factory _AppInfo(
      {double latestVersion,
      ContactInfo contactInfo,
      UpdateInfo updateInfo}) = _$_AppInfo;

  factory _AppInfo.fromJson(Map<String, dynamic> json) = _$_AppInfo.fromJson;

  @override
  double get latestVersion;
  @override
  ContactInfo get contactInfo;
  @override
  UpdateInfo get updateInfo;
  @override
  _$AppInfoCopyWith<_AppInfo> get copyWith;
}
