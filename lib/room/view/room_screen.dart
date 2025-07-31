import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/room/view/room_message_screen.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Conference Screen'),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                RoomMessageScreen.routeName,
              );
            },
            child: const Text('Go to Conference Chat'),
          ),
        ],
      ),
    );
  }
}
