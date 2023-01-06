import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildCategory(int index, HomeController controller) {
  return Obx(
    () => ElevatedBtn(
      paddingAllValue: 3,
      circular: 2,
      onPressed: () {
        controller.currentPage.value = index;
        controller.pageController.jumpToPage(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7),
            child: SizedBox(
              width: 95,
              child: Text(
                categories[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.currentPage.value == index
                      ? const Color(0xFF333333)
                      : const Color(0xFF828282),
                ),
              ),
            ),
          ),
          controller.currentPage.value == index
              ? Container(
                  height: 4,
                  width: 95,
                  decoration: BoxDecoration(
                      color: const Color(0xFF6F74DD),
                      borderRadius: BorderRadius.circular(5)),
                )
              : Container()
        ],
      ),
    ),
  );
}
