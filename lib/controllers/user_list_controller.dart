import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _addUserList();
  }

  void _addUserList() {
    _firestore.collection('users').snapshots().listen((event) {
      userList.clear();
      for (var element in event.docs) {
        if (_authController.user!.uid == element.id) continue;
        UserModel user = UserModel.fromJson(element.data());
        userList.add(user);
      }
    });
  }
}
