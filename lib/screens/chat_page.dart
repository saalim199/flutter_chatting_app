import 'package:chatting_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final UserModel receiverUser;
  const ChatPage({super.key, required this.receiverUser});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.receiverUser.name),
      ),
      body: Container(),
    );
  }
}
