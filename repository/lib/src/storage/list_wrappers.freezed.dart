// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'list_wrappers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StringList _$StringListFromJson(Map<String, dynamic> json) {
  return _StringList.fromJson(json);
}

/// @nodoc
class _$StringListTearOff {
  const _$StringListTearOff();

  _StringList call(List<String>? data) {
    return _StringList(
      data,
    );
  }

  StringList fromJson(Map<String, Object> json) {
    return StringList.fromJson(json);
  }
}

/// @nodoc
const $StringList = _$StringListTearOff();

/// @nodoc
mixin _$StringList {
  List<String>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StringListCopyWith<StringList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringListCopyWith<$Res> {
  factory $StringListCopyWith(
          StringList value, $Res Function(StringList) then) =
      _$StringListCopyWithImpl<$Res>;
  $Res call({List<String>? data});
}

/// @nodoc
class _$StringListCopyWithImpl<$Res> implements $StringListCopyWith<$Res> {
  _$StringListCopyWithImpl(this._value, this._then);

  final StringList _value;
  // ignore: unused_field
  final $Res Function(StringList) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$StringListCopyWith<$Res> implements $StringListCopyWith<$Res> {
  factory _$StringListCopyWith(
          _StringList value, $Res Function(_StringList) then) =
      __$StringListCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? data});
}

/// @nodoc
class __$StringListCopyWithImpl<$Res> extends _$StringListCopyWithImpl<$Res>
    implements _$StringListCopyWith<$Res> {
  __$StringListCopyWithImpl(
      _StringList _value, $Res Function(_StringList) _then)
      : super(_value, (v) => _then(v as _StringList));

  @override
  _StringList get _value => super._value as _StringList;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_StringList(
      data == freezed ? _value.data : data as List<String>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StringList with DiagnosticableTreeMixin implements _StringList {
  _$_StringList(this.data);

  factory _$_StringList.fromJson(Map<String, dynamic> json) =>
      _$_$_StringListFromJson(json);

  @override
  final List<String>? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StringList(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StringList'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StringList &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$StringListCopyWith<_StringList> get copyWith =>
      __$StringListCopyWithImpl<_StringList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StringListToJson(this);
  }
}

abstract class _StringList implements StringList {
  factory _StringList(List<String>? data) = _$_StringList;

  factory _StringList.fromJson(Map<String, dynamic> json) =
      _$_StringList.fromJson;

  @override
  List<String>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StringListCopyWith<_StringList> get copyWith =>
      throw _privateConstructorUsedError;
}

IntList _$IntListFromJson(Map<String, dynamic> json) {
  return _IntList.fromJson(json);
}

/// @nodoc
class _$IntListTearOff {
  const _$IntListTearOff();

  _IntList call(List<int>? data) {
    return _IntList(
      data,
    );
  }

  IntList fromJson(Map<String, Object> json) {
    return IntList.fromJson(json);
  }
}

/// @nodoc
const $IntList = _$IntListTearOff();

/// @nodoc
mixin _$IntList {
  List<int>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntListCopyWith<IntList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntListCopyWith<$Res> {
  factory $IntListCopyWith(IntList value, $Res Function(IntList) then) =
      _$IntListCopyWithImpl<$Res>;
  $Res call({List<int>? data});
}

/// @nodoc
class _$IntListCopyWithImpl<$Res> implements $IntListCopyWith<$Res> {
  _$IntListCopyWithImpl(this._value, this._then);

  final IntList _value;
  // ignore: unused_field
  final $Res Function(IntList) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<int>?,
    ));
  }
}

/// @nodoc
abstract class _$IntListCopyWith<$Res> implements $IntListCopyWith<$Res> {
  factory _$IntListCopyWith(_IntList value, $Res Function(_IntList) then) =
      __$IntListCopyWithImpl<$Res>;
  @override
  $Res call({List<int>? data});
}

/// @nodoc
class __$IntListCopyWithImpl<$Res> extends _$IntListCopyWithImpl<$Res>
    implements _$IntListCopyWith<$Res> {
  __$IntListCopyWithImpl(_IntList _value, $Res Function(_IntList) _then)
      : super(_value, (v) => _then(v as _IntList));

  @override
  _IntList get _value => super._value as _IntList;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_IntList(
      data == freezed ? _value.data : data as List<int>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_IntList with DiagnosticableTreeMixin implements _IntList {
  _$_IntList(this.data);

  factory _$_IntList.fromJson(Map<String, dynamic> json) =>
      _$_$_IntListFromJson(json);

  @override
  final List<int>? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IntList(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IntList'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IntList &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$IntListCopyWith<_IntList> get copyWith =>
      __$IntListCopyWithImpl<_IntList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IntListToJson(this);
  }
}

abstract class _IntList implements IntList {
  factory _IntList(List<int>? data) = _$_IntList;

  factory _IntList.fromJson(Map<String, dynamic> json) = _$_IntList.fromJson;

  @override
  List<int>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IntListCopyWith<_IntList> get copyWith =>
      throw _privateConstructorUsedError;
}

DoubleList _$DoubleListFromJson(Map<String, dynamic> json) {
  return _DoubleList.fromJson(json);
}

/// @nodoc
class _$DoubleListTearOff {
  const _$DoubleListTearOff();

  _DoubleList call(List<double>? data) {
    return _DoubleList(
      data,
    );
  }

  DoubleList fromJson(Map<String, Object> json) {
    return DoubleList.fromJson(json);
  }
}

/// @nodoc
const $DoubleList = _$DoubleListTearOff();

/// @nodoc
mixin _$DoubleList {
  List<double>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoubleListCopyWith<DoubleList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoubleListCopyWith<$Res> {
  factory $DoubleListCopyWith(
          DoubleList value, $Res Function(DoubleList) then) =
      _$DoubleListCopyWithImpl<$Res>;
  $Res call({List<double>? data});
}

/// @nodoc
class _$DoubleListCopyWithImpl<$Res> implements $DoubleListCopyWith<$Res> {
  _$DoubleListCopyWithImpl(this._value, this._then);

  final DoubleList _value;
  // ignore: unused_field
  final $Res Function(DoubleList) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<double>?,
    ));
  }
}

/// @nodoc
abstract class _$DoubleListCopyWith<$Res> implements $DoubleListCopyWith<$Res> {
  factory _$DoubleListCopyWith(
          _DoubleList value, $Res Function(_DoubleList) then) =
      __$DoubleListCopyWithImpl<$Res>;
  @override
  $Res call({List<double>? data});
}

/// @nodoc
class __$DoubleListCopyWithImpl<$Res> extends _$DoubleListCopyWithImpl<$Res>
    implements _$DoubleListCopyWith<$Res> {
  __$DoubleListCopyWithImpl(
      _DoubleList _value, $Res Function(_DoubleList) _then)
      : super(_value, (v) => _then(v as _DoubleList));

  @override
  _DoubleList get _value => super._value as _DoubleList;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_DoubleList(
      data == freezed ? _value.data : data as List<double>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DoubleList with DiagnosticableTreeMixin implements _DoubleList {
  _$_DoubleList(this.data);

  factory _$_DoubleList.fromJson(Map<String, dynamic> json) =>
      _$_$_DoubleListFromJson(json);

  @override
  final List<double>? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoubleList(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoubleList'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DoubleList &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$DoubleListCopyWith<_DoubleList> get copyWith =>
      __$DoubleListCopyWithImpl<_DoubleList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DoubleListToJson(this);
  }
}

abstract class _DoubleList implements DoubleList {
  factory _DoubleList(List<double>? data) = _$_DoubleList;

  factory _DoubleList.fromJson(Map<String, dynamic> json) =
      _$_DoubleList.fromJson;

  @override
  List<double>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DoubleListCopyWith<_DoubleList> get copyWith =>
      throw _privateConstructorUsedError;
}
