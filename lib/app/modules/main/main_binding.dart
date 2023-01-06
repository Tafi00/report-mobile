import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';
import 'package:report_azvidi/app/modules/extend/extend_controller.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';

import '../notify/notify_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CustomerController());
    Get.lazyPut(() => ExtendController());
    Get.lazyPut(() => NotifyController());
  }
}
