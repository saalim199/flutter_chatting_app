import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class Initdep extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    // TODO: implement dependencies
  }
}
