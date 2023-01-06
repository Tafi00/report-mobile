import 'package:get/get.dart';

import 'manage_user_controller.dart';

class ManageUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageUserController());
  }
}
