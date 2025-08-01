import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_bubble.dart';
import 'package:mobile1_flutter_coding_test/room/component/message_send_text_field.dart';
import 'package:mobile1_flutter_coding_test/room/repository/room_repository.dart';

class RoomScreen extends StatefulWidget {
  static String routeName = 'room';

  final String id;

  const RoomScreen({
    super.key,
    required this.id,
  });

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final RoomRepository _roomRepository = RoomRepository();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: FutureBuilder(
          future: _roomRepository.getMessages(
            roomId: widget.id,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            final messages = snapshot.data?.messages ?? [];

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
                    controller: controller,
                    onPressed: () {},
                  ),
                ],
              ),
            );
          }),
    );
  }
}
