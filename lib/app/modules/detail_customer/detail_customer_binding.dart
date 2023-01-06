import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';

class DetailCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailCustomerController());
  }
}
