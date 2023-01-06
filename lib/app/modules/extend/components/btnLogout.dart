import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildBtnLogout() {
  return ElevatedButton(
    onPressed: () async {
      MainController controller = Get.put(MainController());
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      controller.selectedIndex.value = 0;
      Get.offAllNamed(AppRoutes.login);
    },
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF333333),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
    child: const Text(
      'Đăng xuất',
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
