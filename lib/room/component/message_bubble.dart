import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String content;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.sender,
    required this.content,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          sender,
          textAlign: isMe ? TextAlign.right : TextAlign.left,
        ),
        const SizedBox(height: 5),
        Text(
          content,
          textAlign: isMe ? TextAlign.right : TextAlign.left,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
