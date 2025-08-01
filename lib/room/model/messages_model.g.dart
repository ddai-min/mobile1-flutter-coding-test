// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      roomId: json['roomId'] as String,
      messageId: json['messageId'] as String,
      sender: json['sender'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'messageId': instance.messageId,
      'sender': instance.sender,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
    };

LastMessageModel _$LastMessageModelFromJson(Map<String, dynamic> json) =>
    LastMessageModel(
      sender: json['sender'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$LastMessageModelToJson(LastMessageModel instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
    };
