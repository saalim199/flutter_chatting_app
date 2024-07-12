import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/controllers/user_list_controller.dart';
import 'package:get/get.dart';

class Initdep extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UserListController(), fenix: true);
  }
}
