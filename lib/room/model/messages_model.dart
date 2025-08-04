import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable()
class MessagesModel {
  final List<MessageModel> messages;

  MessagesModel({
    required this.messages,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesModelToJson(this);

  MessagesModel copyWith({
    List<MessageModel>? messages,
  }) {
    return MessagesModel(
      messages: messages ?? this.messages,
    );
  }
}

@JsonSerializable()
class MessageModel {
  final String roomId;
  final String messageId;
  final String sender;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.roomId,
    required this.messageId,
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}

@JsonSerializable()
class LastMessageModel {
  final String sender;
  final String content;
  final DateTime timestamp;

  LastMessageModel({
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  factory LastMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LastMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageModelToJson(this);
}
