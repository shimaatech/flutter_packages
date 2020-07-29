import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

part 'system_message.freezed.dart';
part 'system_message.g.dart';

// TODO maybe we can use dynamic widgets package?

enum SystemMessageType {
  normal,
  dialog
}

@freezed
abstract class SystemMessage extends Entity<String>  with _$SystemMessage {
  factory SystemMessage({
    String id,
    String title,
    String content,
    String langCode,
    SystemMessageType type,
    @UtcIsoDateConverter() DateTime expirationDate,
  }) = _SystemMessage;

  factory SystemMessage.fromJson(Map<String, dynamic> json) => _$SystemMessageFromJson(json);

    static final Serializer<SystemMessage> serializer = Serializer(
    (obj) => obj.toJson(),
    (json) => SystemMessage.fromJson(json),
  );
}