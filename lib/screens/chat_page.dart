import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/controllers/chat_controller.dart';
import 'package:chatting_app/models/message_model.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/widgets/chat_bubble.dart';
import 'package:chatting_app/widgets/message_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  final UserModel receiverUser;
  ChatPage({super.key, required this.receiverUser});

  final TextEditingController _messageController = TextEditingController();

  final AuthController _authController = Get.find();

  final ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(receiverUser.name),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: _chatController.getMessages(receiverUser.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (!snapshot.hasData) {
                          return const Center(child: Text('No messages'));
                        } else {
                          List<MessageModel> messages = snapshot.data!;
                          return ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                alignment: (messages[index].senderId ==
                                        _authController.user!.uid)
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: ChatBubble(
                                    message: messages[index].message),
                              );
                            },
                          );
                        }
                    }
                  })),
          MessageInput(
              messageController: _messageController, sendMessage: sendMessage)
        ],
      ),
    );
  }

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatController.sendMessage(
          receiverUser.uid, _messageController.text);
      _messageController.clear();
    }
  }
}
