import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';

class RoomMessageScreen extends StatelessWidget {
  static String routeName = 'room/message';

  const RoomMessageScreen({super.key});

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
