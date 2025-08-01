import 'package:flutter/material.dart';

class MessageSendTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const MessageSendTextField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '메시지를 입력하세요',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.send,
          ),
        ),
      ],
    );
  }
}
