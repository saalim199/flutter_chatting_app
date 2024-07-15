import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/controllers/user_list_controller.dart';
import 'package:chatting_app/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthController _authController = Get.find();

  final UserListController _userListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Get.to(ChatPage(
                      receiverUser: _userListController.userList[index])),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 230, 230),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userListController.userList[index].name,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                _userListController.userList[index].email,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
