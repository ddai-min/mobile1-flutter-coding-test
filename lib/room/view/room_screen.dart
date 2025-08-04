import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_bubble.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_send_text_field.dart';
import 'package:mobile1_flutter_coding_test/room/model/message_parameter.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';
import 'package:mobile1_flutter_coding_test/room/provider/message_provider.dart';
import 'package:mobile1_flutter_coding_test/user/provider/user_me_provider.dart';

class RoomScreen extends ConsumerStatefulWidget {
  static String routeName = 'room';

  final String id;

  const RoomScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends ConsumerState<RoomScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userMe = ref.watch(userMeProvider);
    final messageList = ref.watch(
      messageProvider(widget.id),
    );

    return DefaultLayout(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: _Body(
        userId: userMe.userId,
        messageList: messageList,
        scrollController: scrollController,
        textFieldController: textEditingController,
        onMessageSend: () {
          _onMessageSend(
            userId: userMe.userId,
          );
        },
      ),
    );
  }

  void _onMessageSend({
    required String userId,
  }) async {
    if (textEditingController.text.isEmpty) return;

    await ref.read(messageProvider(widget.id).notifier).postMessage(
          PostMessageParams(
            userId: userId,
            roomId: widget.id,
            content: textEditingController.text,
          ),
        );

    textEditingController.clear();

    scrollController.jumpTo(0);
  }
}

class _Body extends StatelessWidget {
  final String userId;
  final AsyncValue<MessagesModel> messageList;
  final ScrollController scrollController;
  final TextEditingController textFieldController;
  final VoidCallback onMessageSend;

  const _Body({
    required this.userId,
    required this.messageList,
    required this.scrollController,
    required this.textFieldController,
    required this.onMessageSend,
  });

  @override
  Widget build(BuildContext context) {
    return messageList.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stack) {
        return Center(
          child: Text('Error: $error'),
        );
      },
      data: (data) {
        List<MessageModel> messages = data.messages;
        messages = messages.reversed.toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      sender: messages[index].sender,
                      content: messages[index].content,
                      isMe: messages[index].sender == userId,
                    );
                  },
                ),
              ),
              MessageSendTextField(
                controller: textFieldController,
                onPressed: onMessageSend,
              ),
            ],
          ),
        );
      },
    );
  }
}
