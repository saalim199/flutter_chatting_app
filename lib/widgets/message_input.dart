import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chatting_app/widgets/my_text_field.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController messageController;
  final Future<void> Function() sendMessage;
  const MessageInput({
    super.key,
    required this.messageController,
    required this.sendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
                  controller: messageController,
                  hintText: 'Enter Message',
                  obscureText: false)),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
