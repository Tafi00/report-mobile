import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../apis/notify.dart';
import '../main/main_controller.dart';

class NotifyController extends GetxController {
  RxList listNotify = [].obs;
  RxBool isLoading = false.obs;
  final dropdownValue = 'Tất cả'.obs;
  final currentPage = 0.obs;
  final pageController = PageController(initialPage: 0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    MainController mainController = Get.put(MainController());
    mainController.roleView.listen((p0) {
      fetchListTimelineMonth();
    });
  }

  Future fetchListTimelineMonth() async {
    // try {
    listNotify.clear();
    final listNotifyRequest = await NotifyApi().getListNotifyRequest();
    if (listNotifyRequest?['code'] == 0) {
      listNotify.value = listNotifyRequest['content'];
      isLoading.value = false;
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
      isLoading.value = false;
    }
    update();
  }
}
