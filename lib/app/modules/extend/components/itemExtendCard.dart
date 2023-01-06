import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/extend/extend_controller.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';

import '../../main/main_controller.dart';

Widget buildItemExtendCard(String path, String nameCard) {
  MainController controller = Get.put(MainController());
  return GestureDetector(
    onTap: () {
      print(nameCard);
      if (nameCard == 'Danh mục/Rate Cards') {
        Get.toNamed(AppRoutes.rateCards);
      } else if (nameCard == 'Trung tâm kết nối') {
        controller.selectedIndex.value = 0;
        controller.update();
      } else if (nameCard == 'Cài đặt') {
        Get.toNamed(AppRoutes.manageAccount);
      } else if (nameCard == 'Quản lý User') {
        Get.toNamed(AppRoutes.manageUser);
      }
    },
    child: Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFFFAFEFF),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            path,
            color: const Color(0xFF333333),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            nameCard,
            style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Color(0xFF444444),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    ),
  );
}
