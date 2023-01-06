import 'package:get/get.dart';

import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';

class DetailPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPlanController());
  }
}
