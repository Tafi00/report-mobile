import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/notify/notify_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

final categories = ['Chưa đọc', 'Đã đọc'];
Widget buildCategory(int index) {
  return GetBuilder<NotifyController>(
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedBtn(
            paddingAllValue: 3,
            circular: 2,
            onPressed: () {
              controller.currentPage.value = index;
              controller.pageController.value.jumpToPage(index);
              controller.update();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 7),
                  child: SizedBox(
                    width: 90,
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
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6F74DD),
                            borderRadius: BorderRadius.circular(5)),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      );
    },
  );
}
