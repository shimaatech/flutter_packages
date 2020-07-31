// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'system_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SystemMessageClickSpec _$SystemMessageClickSpecFromJson(
    Map<String, dynamic> json) {
  return _SystemMessageClickSpec.fromJson(json);
}

class _$SystemMessageClickSpecTearOff {
  const _$SystemMessageClickSpecTearOff();

// ignore: unused_element
  _SystemMessageClickSpec call(
      {NavigationType navigationType, String url, Map<String, dynamic> args}) {
    return _SystemMessageClickSpec(
      navigationType: navigationType,
      url: url,
      args: args,
    );
  }
}

// ignore: unused_element
const $SystemMessageClickSpec = _$SystemMessageClickSpecTearOff();

mixin _$SystemMessageClickSpec {
  NavigationType get navigationType;
  String get url;
  Map<String, dynamic> get args;

  Map<String, dynamic> toJson();
  $SystemMessageClickSpecCopyWith<SystemMessageClickSpec> get copyWith;
}

abstract class $SystemMessageClickSpecCopyWith<$Res> {
  factory $SystemMessageClickSpecCopyWith(SystemMessageClickSpec value,
          $Res Function(SystemMessageClickSpec) then) =
      _$SystemMessageClickSpecCopyWithImpl<$Res>;
  $Res call(
      {NavigationType navigationType, String url, Map<String, dynamic> args});
}

class _$SystemMessageClickSpecCopyWithImpl<$Res>
    implements $SystemMessageClickSpecCopyWith<$Res> {
  _$SystemMessageClickSpecCopyWithImpl(this._value, this._then);

  final SystemMessageClickSpec _value;
  // ignore: unused_field
  final $Res Function(SystemMessageClickSpec) _then;

  @override
  $Res call({
    Object navigationType = freezed,
    Object url = freezed,
    Object args = freezed,
  }) {
    return _then(_value.copyWith(
      navigationType: navigationType == freezed
          ? _value.navigationType
          : navigationType as NavigationType,
      url: url == freezed ? _value.url : url as String,
      args: args == freezed ? _value.args : args as Map<String, dynamic>,
    ));
  }
}

abstract class _$SystemMessageClickSpecCopyWith<$Res>
    implements $SystemMessageClickSpecCopyWith<$Res> {
  factory _$SystemMessageClickSpecCopyWith(_SystemMessageClickSpec value,
          $Res Function(_SystemMessageClickSpec) then) =
      __$SystemMessageClickSpecCopyWithImpl<$Res>;
  @override
  $Res call(
      {NavigationType navigationType, String url, Map<String, dynamic> args});
}

class __$SystemMessageClickSpecCopyWithImpl<$Res>
    extends _$SystemMessageClickSpecCopyWithImpl<$Res>
    implements _$SystemMessageClickSpecCopyWith<$Res> {
  __$SystemMessageClickSpecCopyWithImpl(_SystemMessageClickSpec _value,
      $Res Function(_SystemMessageClickSpec) _then)
      : super(_value, (v) => _then(v as _SystemMessageClickSpec));

  @override
  _SystemMessageClickSpec get _value => super._value as _SystemMessageClickSpec;

  @override
  $Res call({
    Object navigationType = freezed,
    Object url = freezed,
    Object args = freezed,
  }) {
    return _then(_SystemMessageClickSpec(
      navigationType: navigationType == freezed
          ? _value.navigationType
          : navigationType as NavigationType,
      url: url == freezed ? _value.url : url as String,
      args: args == freezed ? _value.args : args as Map<String, dynamic>,
    ));
  }
}

@JsonSerializable()
class _$_SystemMessageClickSpec implements _SystemMessageClickSpec {
  _$_SystemMessageClickSpec({this.navigationType, this.url, this.args});

  factory _$_SystemMessageClickSpec.fromJson(Map<String, dynamic> json) =>
      _$_$_SystemMessageClickSpecFromJson(json);

  @override
  final NavigationType navigationType;
  @override
  final String url;
  @override
  final Map<String, dynamic> args;

  @override
  String toString() {
    return 'SystemMessageClickSpec(navigationType: $navigationType, url: $url, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SystemMessageClickSpec &&
            (identical(other.navigationType, navigationType) ||
                const DeepCollectionEquality()
                    .equals(other.navigationType, navigationType)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.args, args) ||
                const DeepCollectionEquality().equals(other.args, args)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(navigationType) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(args);

  @override
  _$SystemMessageClickSpecCopyWith<_SystemMessageClickSpec> get copyWith =>
      __$SystemMessageClickSpecCopyWithImpl<_SystemMessageClickSpec>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SystemMessageClickSpecToJson(this);
  }
}

abstract class _SystemMessageClickSpec implements SystemMessageClickSpec {
  factory _SystemMessageClickSpec(
      {NavigationType navigationType,
      String url,
      Map<String, dynamic> args}) = _$_SystemMessageClickSpec;

  factory _SystemMessageClickSpec.fromJson(Map<String, dynamic> json) =
      _$_SystemMessageClickSpec.fromJson;

  @override
  NavigationType get navigationType;
  @override
  String get url;
  @override
  Map<String, dynamic> get args;
  @override
  _$SystemMessageClickSpecCopyWith<_SystemMessageClickSpec> get copyWith;
}

SystemMessageImage _$SystemMessageImageFromJson(Map<String, dynamic> json) {
  return _SystemMessageImage.fromJson(json);
}

class _$SystemMessageImageTearOff {
  const _$SystemMessageImageTearOff();

// ignore: unused_element
  _SystemMessageImage call({String url, double width, double height}) {
    return _SystemMessageImage(
      url: url,
      width: width,
      height: height,
    );
  }
}

// ignore: unused_element
const $SystemMessageImage = _$SystemMessageImageTearOff();

mixin _$SystemMessageImage {
  String get url;
  double get width;
  double get height;

  Map<String, dynamic> toJson();
  $SystemMessageImageCopyWith<SystemMessageImage> get copyWith;
}

abstract class $SystemMessageImageCopyWith<$Res> {
  factory $SystemMessageImageCopyWith(
          SystemMessageImage value, $Res Function(SystemMessageImage) then) =
      _$SystemMessageImageCopyWithImpl<$Res>;
  $Res call({String url, double width, double height});
}

class _$SystemMessageImageCopyWithImpl<$Res>
    implements $SystemMessageImageCopyWith<$Res> {
  _$SystemMessageImageCopyWithImpl(this._value, this._then);

  final SystemMessageImage _value;
  // ignore: unused_field
  final $Res Function(SystemMessageImage) _then;

  @override
  $Res call({
    Object url = freezed,
    Object width = freezed,
    Object height = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed ? _value.url : url as String,
      width: width == freezed ? _value.width : width as double,
      height: height == freezed ? _value.height : height as double,
    ));
  }
}

abstract class _$SystemMessageImageCopyWith<$Res>
    implements $SystemMessageImageCopyWith<$Res> {
  factory _$SystemMessageImageCopyWith(
          _SystemMessageImage value, $Res Function(_SystemMessageImage) then) =
      __$SystemMessageImageCopyWithImpl<$Res>;
  @override
  $Res call({String url, double width, double height});
}

class __$SystemMessageImageCopyWithImpl<$Res>
    extends _$SystemMessageImageCopyWithImpl<$Res>
    implements _$SystemMessageImageCopyWith<$Res> {
  __$SystemMessageImageCopyWithImpl(
      _SystemMessageImage _value, $Res Function(_SystemMessageImage) _then)
      : super(_value, (v) => _then(v as _SystemMessageImage));

  @override
  _SystemMessageImage get _value => super._value as _SystemMessageImage;

  @override
  $Res call({
    Object url = freezed,
    Object width = freezed,
    Object height = freezed,
  }) {
    return _then(_SystemMessageImage(
      url: url == freezed ? _value.url : url as String,
      width: width == freezed ? _value.width : width as double,
      height: height == freezed ? _value.height : height as double,
    ));
  }
}

@JsonSerializable()
class _$_SystemMessageImage implements _SystemMessageImage {
  _$_SystemMessageImage({this.url, this.width, this.height});

  factory _$_SystemMessageImage.fromJson(Map<String, dynamic> json) =>
      _$_$_SystemMessageImageFromJson(json);

  @override
  final String url;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'SystemMessageImage(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SystemMessageImage &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height);

  @override
  _$SystemMessageImageCopyWith<_SystemMessageImage> get copyWith =>
      __$SystemMessageImageCopyWithImpl<_SystemMessageImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SystemMessageImageToJson(this);
  }
}

abstract class _SystemMessageImage implements SystemMessageImage {
  factory _SystemMessageImage({String url, double width, double height}) =
      _$_SystemMessageImage;

  factory _SystemMessageImage.fromJson(Map<String, dynamic> json) =
      _$_SystemMessageImage.fromJson;

  @override
  String get url;
  @override
  double get width;
  @override
  double get height;
  @override
  _$SystemMessageImageCopyWith<_SystemMessageImage> get copyWith;
}

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
      String linkText,
      int titleIcon,
      int backgroundColor,
      SystemMessageImage image,
      SystemMessageClickSpec titleIconClickSpec,
      SystemMessageClickSpec linkClickSpec,
      SystemMessageClickSpec cardClickSpec,
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
      linkText: linkText,
      titleIcon: titleIcon,
      backgroundColor: backgroundColor,
      image: image,
      titleIconClickSpec: titleIconClickSpec,
      linkClickSpec: linkClickSpec,
      cardClickSpec: cardClickSpec,
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
  String get linkText;
  int get titleIcon;
  int get backgroundColor;
  SystemMessageImage get image;
  SystemMessageClickSpec get titleIconClickSpec;
  SystemMessageClickSpec get linkClickSpec;
  SystemMessageClickSpec get cardClickSpec;
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
      String linkText,
      int titleIcon,
      int backgroundColor,
      SystemMessageImage image,
      SystemMessageClickSpec titleIconClickSpec,
      SystemMessageClickSpec linkClickSpec,
      SystemMessageClickSpec cardClickSpec,
      @UtcIsoDateConverter() DateTime expirationDate});

  $SystemMessageImageCopyWith<$Res> get image;
  $SystemMessageClickSpecCopyWith<$Res> get titleIconClickSpec;
  $SystemMessageClickSpecCopyWith<$Res> get linkClickSpec;
  $SystemMessageClickSpecCopyWith<$Res> get cardClickSpec;
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
    Object linkText = freezed,
    Object titleIcon = freezed,
    Object backgroundColor = freezed,
    Object image = freezed,
    Object titleIconClickSpec = freezed,
    Object linkClickSpec = freezed,
    Object cardClickSpec = freezed,
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
      linkText: linkText == freezed ? _value.linkText : linkText as String,
      titleIcon: titleIcon == freezed ? _value.titleIcon : titleIcon as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      image: image == freezed ? _value.image : image as SystemMessageImage,
      titleIconClickSpec: titleIconClickSpec == freezed
          ? _value.titleIconClickSpec
          : titleIconClickSpec as SystemMessageClickSpec,
      linkClickSpec: linkClickSpec == freezed
          ? _value.linkClickSpec
          : linkClickSpec as SystemMessageClickSpec,
      cardClickSpec: cardClickSpec == freezed
          ? _value.cardClickSpec
          : cardClickSpec as SystemMessageClickSpec,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate as DateTime,
    ));
  }

  @override
  $SystemMessageImageCopyWith<$Res> get image {
    if (_value.image == null) {
      return null;
    }
    return $SystemMessageImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }

  @override
  $SystemMessageClickSpecCopyWith<$Res> get titleIconClickSpec {
    if (_value.titleIconClickSpec == null) {
      return null;
    }
    return $SystemMessageClickSpecCopyWith<$Res>(_value.titleIconClickSpec,
        (value) {
      return _then(_value.copyWith(titleIconClickSpec: value));
    });
  }

  @override
  $SystemMessageClickSpecCopyWith<$Res> get linkClickSpec {
    if (_value.linkClickSpec == null) {
      return null;
    }
    return $SystemMessageClickSpecCopyWith<$Res>(_value.linkClickSpec, (value) {
      return _then(_value.copyWith(linkClickSpec: value));
    });
  }

  @override
  $SystemMessageClickSpecCopyWith<$Res> get cardClickSpec {
    if (_value.cardClickSpec == null) {
      return null;
    }
    return $SystemMessageClickSpecCopyWith<$Res>(_value.cardClickSpec, (value) {
      return _then(_value.copyWith(cardClickSpec: value));
    });
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
      String linkText,
      int titleIcon,
      int backgroundColor,
      SystemMessageImage image,
      SystemMessageClickSpec titleIconClickSpec,
      SystemMessageClickSpec linkClickSpec,
      SystemMessageClickSpec cardClickSpec,
      @UtcIsoDateConverter() DateTime expirationDate});

  @override
  $SystemMessageImageCopyWith<$Res> get image;
  @override
  $SystemMessageClickSpecCopyWith<$Res> get titleIconClickSpec;
  @override
  $SystemMessageClickSpecCopyWith<$Res> get linkClickSpec;
  @override
  $SystemMessageClickSpecCopyWith<$Res> get cardClickSpec;
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
    Object linkText = freezed,
    Object titleIcon = freezed,
    Object backgroundColor = freezed,
    Object image = freezed,
    Object titleIconClickSpec = freezed,
    Object linkClickSpec = freezed,
    Object cardClickSpec = freezed,
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
      linkText: linkText == freezed ? _value.linkText : linkText as String,
      titleIcon: titleIcon == freezed ? _value.titleIcon : titleIcon as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      image: image == freezed ? _value.image : image as SystemMessageImage,
      titleIconClickSpec: titleIconClickSpec == freezed
          ? _value.titleIconClickSpec
          : titleIconClickSpec as SystemMessageClickSpec,
      linkClickSpec: linkClickSpec == freezed
          ? _value.linkClickSpec
          : linkClickSpec as SystemMessageClickSpec,
      cardClickSpec: cardClickSpec == freezed
          ? _value.cardClickSpec
          : cardClickSpec as SystemMessageClickSpec,
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
      this.linkText,
      this.titleIcon,
      this.backgroundColor,
      this.image,
      this.titleIconClickSpec,
      this.linkClickSpec,
      this.cardClickSpec,
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
  final String linkText;
  @override
  final int titleIcon;
  @override
  final int backgroundColor;
  @override
  final SystemMessageImage image;
  @override
  final SystemMessageClickSpec titleIconClickSpec;
  @override
  final SystemMessageClickSpec linkClickSpec;
  @override
  final SystemMessageClickSpec cardClickSpec;
  @override
  @UtcIsoDateConverter()
  final DateTime expirationDate;

  @override
  String toString() {
    return 'SystemMessage(id: $id, title: $title, content: $content, langCode: $langCode, type: $type, package: $package, minAppVersion: $minAppVersion, maxAppVersion: $maxAppVersion, testMode: $testMode, linkText: $linkText, titleIcon: $titleIcon, backgroundColor: $backgroundColor, image: $image, titleIconClickSpec: $titleIconClickSpec, linkClickSpec: $linkClickSpec, cardClickSpec: $cardClickSpec, expirationDate: $expirationDate)';
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
            (identical(other.linkText, linkText) ||
                const DeepCollectionEquality()
                    .equals(other.linkText, linkText)) &&
            (identical(other.titleIcon, titleIcon) ||
                const DeepCollectionEquality()
                    .equals(other.titleIcon, titleIcon)) &&
            (identical(other.backgroundColor, backgroundColor) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundColor, backgroundColor)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.titleIconClickSpec, titleIconClickSpec) ||
                const DeepCollectionEquality()
                    .equals(other.titleIconClickSpec, titleIconClickSpec)) &&
            (identical(other.linkClickSpec, linkClickSpec) ||
                const DeepCollectionEquality()
                    .equals(other.linkClickSpec, linkClickSpec)) &&
            (identical(other.cardClickSpec, cardClickSpec) ||
                const DeepCollectionEquality()
                    .equals(other.cardClickSpec, cardClickSpec)) &&
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
      const DeepCollectionEquality().hash(linkText) ^
      const DeepCollectionEquality().hash(titleIcon) ^
      const DeepCollectionEquality().hash(backgroundColor) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(titleIconClickSpec) ^
      const DeepCollectionEquality().hash(linkClickSpec) ^
      const DeepCollectionEquality().hash(cardClickSpec) ^
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
      String linkText,
      int titleIcon,
      int backgroundColor,
      SystemMessageImage image,
      SystemMessageClickSpec titleIconClickSpec,
      SystemMessageClickSpec linkClickSpec,
      SystemMessageClickSpec cardClickSpec,
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
  String get linkText;
  @override
  int get titleIcon;
  @override
  int get backgroundColor;
  @override
  SystemMessageImage get image;
  @override
  SystemMessageClickSpec get titleIconClickSpec;
  @override
  SystemMessageClickSpec get linkClickSpec;
  @override
  SystemMessageClickSpec get cardClickSpec;
  @override
  @UtcIsoDateConverter()
  DateTime get expirationDate;
  @override
  _$SystemMessageCopyWith<_SystemMessage> get copyWith;
}
