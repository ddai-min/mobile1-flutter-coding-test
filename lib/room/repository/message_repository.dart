import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile1_flutter_coding_test/common/util/json_to_model.dart';
import 'package:mobile1_flutter_coding_test/main.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';

class MessageRepository {
  Future<MessagesModel> getMessages({
    required String roomId,
  }) async {
    MessagesModel messageList = MessagesModel.fromJson(
      box.get('room/$roomId') ??
          MessagesModel(
            messages: [],
          ).toJson(),
    );

    if (messageList.messages.isEmpty) {
      messageList = await JsonToModel<MessagesModel>().toModel(
        key: 'api/messages.json',
        fromJson: (json) => MessagesModel.fromJson(json),
      );

      final jsonString = await rootBundle.loadString('api/messages.json');

      final Map<String, dynamic> jsonList = json.decode(jsonString);

      box.put('room/$roomId', jsonList);
    }

    return MessagesModel(
      messages: messageList.messages
          .where((message) => message.roomId == roomId)
          .toList(),
    );
  }

  Future<MessageModel> postMessage({
    required String userId,
    required String roomId,
    required String content,
  }) async {
    MessagesModel messageList = MessagesModel.fromJson(
      box.get('room/$roomId'),
    );

    final newMessage = MessageModel(
      roomId: roomId,
      messageId: DateTime.now().millisecondsSinceEpoch.toString(),
      sender: userId,
      content: content,
      timestamp: DateTime.now(),
    );

    messageList.messages.add(newMessage);

    box.put(
      'room/$roomId',
      messageList.toJson(),
    );

    return newMessage;
  }
}
