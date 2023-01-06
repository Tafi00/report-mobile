import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

List categoriesPopup = ['Đo lường', 'Ngân sách'];

Widget buildCategory(int index, int indexCategory) {
  DetailPlanController controller = Get.put(DetailPlanController());
  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedBtn(
          paddingAllValue: 3,
          circular: 2,
          onPressed: () {
            controller.currentPage[indexCategory] = index;
            controller.pageController[indexCategory].jumpToPage(index);
            controller.update();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 7),
                child: SizedBox(
                  width: 95,
                  child: Text(
                    categoriesPopup[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.currentPage[indexCategory] == index
                          ? const Color(0xFF333333)
                          : const Color(0xFF828282),
                    ),
                  ),
                ),
              ),
              controller.currentPage[indexCategory] == index
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
      ],
    );
  });
}
