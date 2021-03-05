// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'api_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApiPropertiesTearOff {
  const _$ApiPropertiesTearOff();

  _ApiProperties call(
      {required String baseUrl,
      required int version,
      required int receiveTimeout,
      required int connectTimeout,
      required String username,
      required String password,
      String? tenant}) {
    return _ApiProperties(
      baseUrl: baseUrl,
      version: version,
      receiveTimeout: receiveTimeout,
      connectTimeout: connectTimeout,
      username: username,
      password: password,
      tenant: tenant,
    );
  }
}

/// @nodoc
const $ApiProperties = _$ApiPropertiesTearOff();

/// @nodoc
mixin _$ApiProperties {
  String get baseUrl => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  int get receiveTimeout => throw _privateConstructorUsedError;
  int get connectTimeout => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get tenant => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiPropertiesCopyWith<ApiProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
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
      String password,
      String? tenant});
}

/// @nodoc
class _$ApiPropertiesCopyWithImpl<$Res>
    implements $ApiPropertiesCopyWith<$Res> {
  _$ApiPropertiesCopyWithImpl(this._value, this._then);

  final ApiProperties _value;
  // ignore: unused_field
  final $Res Function(ApiProperties) _then;

  @override
  $Res call({
    Object? baseUrl = freezed,
    Object? version = freezed,
    Object? receiveTimeout = freezed,
    Object? connectTimeout = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? tenant = freezed,
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
      tenant: tenant == freezed ? _value.tenant : tenant as String?,
    ));
  }
}

/// @nodoc
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
      String password,
      String? tenant});
}

/// @nodoc
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
    Object? baseUrl = freezed,
    Object? version = freezed,
    Object? receiveTimeout = freezed,
    Object? connectTimeout = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? tenant = freezed,
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
      tenant: tenant == freezed ? _value.tenant : tenant as String?,
    ));
  }
}

/// @nodoc
class _$_ApiProperties implements _ApiProperties {
  _$_ApiProperties(
      {required this.baseUrl,
      required this.version,
      required this.receiveTimeout,
      required this.connectTimeout,
      required this.username,
      required this.password,
      this.tenant});

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
  final String? tenant;

  @override
  String toString() {
    return 'ApiProperties(baseUrl: $baseUrl, version: $version, receiveTimeout: $receiveTimeout, connectTimeout: $connectTimeout, username: $username, password: $password, tenant: $tenant)';
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
                    .equals(other.password, password)) &&
            (identical(other.tenant, tenant) ||
                const DeepCollectionEquality().equals(other.tenant, tenant)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(baseUrl) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(receiveTimeout) ^
      const DeepCollectionEquality().hash(connectTimeout) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(tenant);

  @JsonKey(ignore: true)
  @override
  _$ApiPropertiesCopyWith<_ApiProperties> get copyWith =>
      __$ApiPropertiesCopyWithImpl<_ApiProperties>(this, _$identity);
}

abstract class _ApiProperties implements ApiProperties {
  factory _ApiProperties(
      {required String baseUrl,
      required int version,
      required int receiveTimeout,
      required int connectTimeout,
      required String username,
      required String password,
      String? tenant}) = _$_ApiProperties;

  @override
  String get baseUrl => throw _privateConstructorUsedError;
  @override
  int get version => throw _privateConstructorUsedError;
  @override
  int get receiveTimeout => throw _privateConstructorUsedError;
  @override
  int get connectTimeout => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String? get tenant => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiPropertiesCopyWith<_ApiProperties> get copyWith =>
      throw _privateConstructorUsedError;
}
