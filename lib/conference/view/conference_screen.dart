import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/conference/view/conference_chat_screen.dart';

class ConferenceScreen extends StatelessWidget {
  const ConferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Conference Screen'),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                ConferenceChatScreen.routeName,
              );
            },
            child: const Text('Go to Conference Chat'),
          ),
        ],
      ),
    );
  }
}
