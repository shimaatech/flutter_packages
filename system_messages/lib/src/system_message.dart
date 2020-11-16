import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

part 'system_message.freezed.dart';
part 'system_message.g.dart';

// TODO maybe we can use dynamic widgets package?

enum NavigationType {
  internal,
  external,
  embedded,
  upgrade,
  rate,
}

enum SystemMessageType {
  normal,
  dialog
}

@freezed
abstract class SystemMessageClickSpec with _$SystemMessageClickSpec {
  factory SystemMessageClickSpec({
    NavigationType navigationType,
    String url,
    Map<String, dynamic> args,
  }) = _SystemMessageClickSpec;

  factory SystemMessageClickSpec.fromJson(Map<String, dynamic> json) => _$SystemMessageClickSpecFromJson(json);

    static final Serializer<SystemMessageClickSpec> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => SystemMessageClickSpec.fromJson(json),
  );
}


@freezed
abstract class SystemMessageImage with _$SystemMessageImage {
  factory SystemMessageImage({
    String url,
    double width,
    double height,
  }) = _SystemMessageImage;

  factory SystemMessageImage.fromJson(Map<String, dynamic> json) => _$SystemMessageImageFromJson(json);

    static final Serializer<SystemMessageImage> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => SystemMessageImage.fromJson(json),
  );
}

@freezed
abstract class SystemMessage extends Entity<String>  with _$SystemMessage {
  factory SystemMessage({
    String id,
    String title,
    String content,
    String langCode,
    SystemMessageType type,
    List<String> appsIds,
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
    @UtcIsoDateConverter() DateTime expirationTime,
    @UtcIsoDateConverter() DateTime startTime,
    @UtcIsoDateConverter() DateTime installedBefore,
  }) = _SystemMessage;

  factory SystemMessage.fromJson(Map<String, dynamic> json) => _$SystemMessageFromJson(json);

    static final Serializer<SystemMessage> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => SystemMessage.fromJson(json),
  );
}