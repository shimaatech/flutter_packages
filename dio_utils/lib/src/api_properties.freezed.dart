// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'api_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ApiPropertiesTearOff {
  const _$ApiPropertiesTearOff();

  _ApiProperties call(
      {String baseUrl,
      int version,
      int receiveTimeout,
      int connectTimeout,
      String username,
      String password}) {
    return _ApiProperties(
      baseUrl: baseUrl,
      version: version,
      receiveTimeout: receiveTimeout,
      connectTimeout: connectTimeout,
      username: username,
      password: password,
    );
  }
}

// ignore: unused_element
const $ApiProperties = _$ApiPropertiesTearOff();

mixin _$ApiProperties {
  String get baseUrl;
  int get version;
  int get receiveTimeout;
  int get connectTimeout;
  String get username;
  String get password;

  $ApiPropertiesCopyWith<ApiProperties> get copyWith;
}

abstract class $ApiPropertiesCopyWith<$Res> {
  factory $ApiPropertiesCopyWith(
          ApiProperties value, $Res Function(ApiProperties) then) =
      _$ApiPropertiesCopyWithImpl<$Res>;
  $Res call(
      {String baseUrl,
      int version,
      int receiveTimeout,
      int connectTimeout,
      String username,
      String password});
}

class _$ApiPropertiesCopyWithImpl<$Res>
    implements $ApiPropertiesCopyWith<$Res> {
  _$ApiPropertiesCopyWithImpl(this._value, this._then);

  final ApiProperties _value;
  // ignore: unused_field
  final $Res Function(ApiProperties) _then;

  @override
  $Res call({
    Object baseUrl = freezed,
    Object version = freezed,
    Object receiveTimeout = freezed,
    Object connectTimeout = freezed,
    Object username = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      baseUrl: baseUrl == freezed ? _value.baseUrl : baseUrl as String,
      version: version == freezed ? _value.version : version as int,
      receiveTimeout: receiveTimeout == freezed
          ? _value.receiveTimeout
          : receiveTimeout as int,
      connectTimeout: connectTimeout == freezed
          ? _value.connectTimeout
          : connectTimeout as int,
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

abstract class _$ApiPropertiesCopyWith<$Res>
    implements $ApiPropertiesCopyWith<$Res> {
  factory _$ApiPropertiesCopyWith(
          _ApiProperties value, $Res Function(_ApiProperties) then) =
      __$ApiPropertiesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String baseUrl,
      int version,
      int receiveTimeout,
      int connectTimeout,
      String username,
      String password});
}

class __$ApiPropertiesCopyWithImpl<$Res>
    extends _$ApiPropertiesCopyWithImpl<$Res>
    implements _$ApiPropertiesCopyWith<$Res> {
  __$ApiPropertiesCopyWithImpl(
      _ApiProperties _value, $Res Function(_ApiProperties) _then)
      : super(_value, (v) => _then(v as _ApiProperties));

  @override
  _ApiProperties get _value => super._value as _ApiProperties;

  @override
  $Res call({
    Object baseUrl = freezed,
    Object version = freezed,
    Object receiveTimeout = freezed,
    Object connectTimeout = freezed,
    Object username = freezed,
    Object password = freezed,
  }) {
    return _then(_ApiProperties(
      baseUrl: baseUrl == freezed ? _value.baseUrl : baseUrl as String,
      version: version == freezed ? _value.version : version as int,
      receiveTimeout: receiveTimeout == freezed
          ? _value.receiveTimeout
          : receiveTimeout as int,
      connectTimeout: connectTimeout == freezed
          ? _value.connectTimeout
          : connectTimeout as int,
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_ApiProperties implements _ApiProperties {
  _$_ApiProperties(
      {this.baseUrl,
      this.version,
      this.receiveTimeout,
      this.connectTimeout,
      this.username,
      this.password});

  @override
  final String baseUrl;
  @override
  final int version;
  @override
  final int receiveTimeout;
  @override
  final int connectTimeout;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'ApiProperties(baseUrl: $baseUrl, version: $version, receiveTimeout: $receiveTimeout, connectTimeout: $connectTimeout, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiProperties &&
            (identical(other.baseUrl, baseUrl) ||
                const DeepCollectionEquality()
                    .equals(other.baseUrl, baseUrl)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.receiveTimeout, receiveTimeout) ||
                const DeepCollectionEquality()
                    .equals(other.receiveTimeout, receiveTimeout)) &&
            (identical(other.connectTimeout, connectTimeout) ||
                const DeepCollectionEquality()
                    .equals(other.connectTimeout, connectTimeout)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(baseUrl) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(receiveTimeout) ^
      const DeepCollectionEquality().hash(connectTimeout) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$ApiPropertiesCopyWith<_ApiProperties> get copyWith =>
      __$ApiPropertiesCopyWithImpl<_ApiProperties>(this, _$identity);
}

abstract class _ApiProperties implements ApiProperties {
  factory _ApiProperties(
      {String baseUrl,
      int version,
      int receiveTimeout,
      int connectTimeout,
      String username,
      String password}) = _$_ApiProperties;

  @override
  String get baseUrl;
  @override
  int get version;
  @override
  int get receiveTimeout;
  @override
  int get connectTimeout;
  @override
  String get username;
  @override
  String get password;
  @override
  _$ApiPropertiesCopyWith<_ApiProperties> get copyWith;
}
