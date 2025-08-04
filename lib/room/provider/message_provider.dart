import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/room/model/message_parameter.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';
import 'package:mobile1_flutter_coding_test/room/repository/message_repository.dart';

final _messageRepository = MessageRepository();

final messageProvider =
    AsyncNotifierProvider.family<MessageNotifier, MessagesModel, String>(
  MessageNotifier.new,
);

class MessageNotifier extends FamilyAsyncNotifier<MessagesModel, String> {
  @override
  FutureOr<MessagesModel> build(String arg) async {
    return await _messageRepository.getMessages(
      roomId: arg,
    );
  }

  Future<MessageModel> postMessage(
    PostMessageParams params,
  ) async {
    final newMessage = await _messageRepository.postMessage(
      userId: params.userId,
      roomId: params.roomId,
      content: params.content,
    );

    state = AsyncData(
      state.value!.copyWith(
        messages: [...state.value!.messages, newMessage],
      ),
    );

    return newMessage;
  }
}
