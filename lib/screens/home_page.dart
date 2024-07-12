import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/controllers/user_list_controller.dart';
import 'package:chatting_app/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _authController = Get.find();
  final UserListController _userListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _authController.signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: _userListController.userList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_userListController.userList[index].name),
                onTap: () {
                  Get.to(ChatPage(
                      receiverUser: _userListController.userList[index]));
                },
              );
            },
          )),
    );
  }
}
