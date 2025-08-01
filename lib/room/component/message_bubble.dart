import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String content;

  const MessageBubble({
    super.key,
    required this.sender,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender),
        const SizedBox(height: 5),
        Text(content),
        const SizedBox(height: 10),
      ],
    );
  }
}
