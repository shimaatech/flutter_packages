// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'system_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SystemMessage _$SystemMessageFromJson(Map<String, dynamic> json) {
  return _SystemMessage.fromJson(json);
}

class _$SystemMessageTearOff {
  const _$SystemMessageTearOff();

// ignore: unused_element
  _SystemMessage call(
      {String id,
      String title,
      String content,
      String langCode,
      SystemMessageType type,
      String package,
      double minAppVersion,
      double maxAppVersion,
      bool testMode,
      @UtcIsoDateConverter() DateTime expirationDate}) {
    return _SystemMessage(
      id: id,
      title: title,
      content: content,
      langCode: langCode,
      type: type,
      package: package,
      minAppVersion: minAppVersion,
      maxAppVersion: maxAppVersion,
      testMode: testMode,
      expirationDate: expirationDate,
    );
  }
}

// ignore: unused_element
const $SystemMessage = _$SystemMessageTearOff();

mixin _$SystemMessage {
  String get id;
  String get title;
  String get content;
  String get langCode;
  SystemMessageType get type;
  String get package;
  double get minAppVersion;
  double get maxAppVersion;
  bool get testMode;
  @UtcIsoDateConverter()
  DateTime get expirationDate;

  Map<String, dynamic> toJson();
  $SystemMessageCopyWith<SystemMessage> get copyWith;
}

abstract class $SystemMessageCopyWith<$Res> {
  factory $SystemMessageCopyWith(
          SystemMessage value, $Res Function(SystemMessage) then) =
      _$SystemMessageCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String content,
      String langCode,
      SystemMessageType type,
      String package,
      double minAppVersion,
      double maxAppVersion,
      bool testMode,
      @UtcIsoDateConverter() DateTime expirationDate});
}

class _$SystemMessageCopyWithImpl<$Res>
    implements $SystemMessageCopyWith<$Res> {
  _$SystemMessageCopyWithImpl(this._value, this._then);

  final SystemMessage _value;
  // ignore: unused_field
  final $Res Function(SystemMessage) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object content = freezed,
    Object langCode = freezed,
    Object type = freezed,
    Object package = freezed,
    Object minAppVersion = freezed,
    Object maxAppVersion = freezed,
    Object testMode = freezed,
    Object expirationDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      type: type == freezed ? _value.type : type as SystemMessageType,
      package: package == freezed ? _value.package : package as String,
      minAppVersion: minAppVersion == freezed
          ? _value.minAppVersion
          : minAppVersion as double,
      maxAppVersion: maxAppVersion == freezed
          ? _value.maxAppVersion
          : maxAppVersion as double,
      testMode: testMode == freezed ? _value.testMode : testMode as bool,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate as DateTime,
    ));
  }
}

abstract class _$SystemMessageCopyWith<$Res>
    implements $SystemMessageCopyWith<$Res> {
  factory _$SystemMessageCopyWith(
          _SystemMessage value, $Res Function(_SystemMessage) then) =
      __$SystemMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String content,
      String langCode,
      SystemMessageType type,
      String package,
      double minAppVersion,
      double maxAppVersion,
      bool testMode,
      @UtcIsoDateConverter() DateTime expirationDate});
}

class __$SystemMessageCopyWithImpl<$Res>
    extends _$SystemMessageCopyWithImpl<$Res>
    implements _$SystemMessageCopyWith<$Res> {
  __$SystemMessageCopyWithImpl(
      _SystemMessage _value, $Res Function(_SystemMessage) _then)
      : super(_value, (v) => _then(v as _SystemMessage));

  @override
  _SystemMessage get _value => super._value as _SystemMessage;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object content = freezed,
    Object langCode = freezed,
    Object type = freezed,
    Object package = freezed,
    Object minAppVersion = freezed,
    Object maxAppVersion = freezed,
    Object testMode = freezed,
    Object expirationDate = freezed,
  }) {
    return _then(_SystemMessage(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      type: type == freezed ? _value.type : type as SystemMessageType,
      package: package == freezed ? _value.package : package as String,
      minAppVersion: minAppVersion == freezed
          ? _value.minAppVersion
          : minAppVersion as double,
      maxAppVersion: maxAppVersion == freezed
          ? _value.maxAppVersion
          : maxAppVersion as double,
      testMode: testMode == freezed ? _value.testMode : testMode as bool,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_SystemMessage implements _SystemMessage {
  _$_SystemMessage(
      {this.id,
      this.title,
      this.content,
      this.langCode,
      this.type,
      this.package,
      this.minAppVersion,
      this.maxAppVersion,
      this.testMode,
      @UtcIsoDateConverter() this.expirationDate});

  factory _$_SystemMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SystemMessageFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String langCode;
  @override
  final SystemMessageType type;
  @override
  final String package;
  @override
  final double minAppVersion;
  @override
  final double maxAppVersion;
  @override
  final bool testMode;
  @override
  @UtcIsoDateConverter()
  final DateTime expirationDate;

  @override
  String toString() {
    return 'SystemMessage(id: $id, title: $title, content: $content, langCode: $langCode, type: $type, package: $package, minAppVersion: $minAppVersion, maxAppVersion: $maxAppVersion, testMode: $testMode, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SystemMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.langCode, langCode) ||
                const DeepCollectionEquality()
                    .equals(other.langCode, langCode)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.package, package) ||
                const DeepCollectionEquality()
                    .equals(other.package, package)) &&
            (identical(other.minAppVersion, minAppVersion) ||
                const DeepCollectionEquality()
                    .equals(other.minAppVersion, minAppVersion)) &&
            (identical(other.maxAppVersion, maxAppVersion) ||
                const DeepCollectionEquality()
                    .equals(other.maxAppVersion, maxAppVersion)) &&
            (identical(other.testMode, testMode) ||
                const DeepCollectionEquality()
                    .equals(other.testMode, testMode)) &&
            (identical(other.expirationDate, expirationDate) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDate, expirationDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(langCode) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(package) ^
      const DeepCollectionEquality().hash(minAppVersion) ^
      const DeepCollectionEquality().hash(maxAppVersion) ^
      const DeepCollectionEquality().hash(testMode) ^
      const DeepCollectionEquality().hash(expirationDate);

  @override
  _$SystemMessageCopyWith<_SystemMessage> get copyWith =>
      __$SystemMessageCopyWithImpl<_SystemMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SystemMessageToJson(this);
  }
}

abstract class _SystemMessage implements SystemMessage {
  factory _SystemMessage(
      {String id,
      String title,
      String content,
      String langCode,
      SystemMessageType type,
      String package,
      double minAppVersion,
      double maxAppVersion,
      bool testMode,
      @UtcIsoDateConverter() DateTime expirationDate}) = _$_SystemMessage;

  factory _SystemMessage.fromJson(Map<String, dynamic> json) =
      _$_SystemMessage.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get langCode;
  @override
  SystemMessageType get type;
  @override
  String get package;
  @override
  double get minAppVersion;
  @override
  double get maxAppVersion;
  @override
  bool get testMode;
  @override
  @UtcIsoDateConverter()
  DateTime get expirationDate;
  @override
  _$SystemMessageCopyWith<_SystemMessage> get copyWith;
}