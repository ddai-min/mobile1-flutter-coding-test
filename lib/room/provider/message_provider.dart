import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/room/model/message_parameter.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';
import 'package:mobile1_flutter_coding_test/room/repository/message_repository.dart';

final _messageRepository = MessageRepository();

final getMessageListProvider =
    FutureProvider.family<MessagesModel, String>((ref, roomId) async {
  final messageList = await _messageRepository.getMessages(
    roomId: roomId,
  );

  return messageList;
});

final postMessageProvider =
    FutureProvider.family<MessageModel, PostMessageParams>((ref, params) async {
  final result = await _messageRepository.postMessage(
    userId: params.userId,
    roomId: params.roomId,
    content: params.content,
  );

  return result;
});
