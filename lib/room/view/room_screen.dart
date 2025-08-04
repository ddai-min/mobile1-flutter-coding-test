import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_bubble.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_send_text_field.dart';
import 'package:mobile1_flutter_coding_test/room/model/message_parameter.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';
import 'package:mobile1_flutter_coding_test/room/provider/message_provider.dart';

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
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final messageList = ref.watch(
      getMessageListProvider(widget.id),
    );

    return DefaultLayout(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: _Body(
        provider: messageList,
        textFieldController: controller,
        onMessageSend: () async {
          if (controller.text.isEmpty) return;

          await ref.read(
            postMessageProvider(
              PostMessageParams(
                roomId: widget.id,
                content: controller.text,
              ),
            ).future,
          );

          ref.invalidate(
            getMessageListProvider(widget.id),
          );

          controller.clear();
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final AsyncValue<MessagesModel> provider;
  final TextEditingController textFieldController;
  final VoidCallback onMessageSend;

  const _Body({
    required this.provider,
    required this.textFieldController,
    required this.onMessageSend,
  });

  @override
  Widget build(BuildContext context) {
    return provider.when(
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
        final messages = data.messages;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      sender: messages[index].sender,
                      content: messages[index].content,
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
