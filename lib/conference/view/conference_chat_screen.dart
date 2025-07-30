import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';

class ConferenceChatScreen extends StatelessWidget {
  static String routeName = 'conference/chat';

  const ConferenceChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: const Center(
        child: Text('Conference Chat Screen'),
      ),
    );
  }
}
