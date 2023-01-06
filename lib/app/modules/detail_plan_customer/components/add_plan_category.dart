import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/home/components/category.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import '../detail_plan_controller.dart';

List<String> addPlanCategories = ['Hạng mục', 'Timeline', 'Chỉ số dự kiến'];
Widget buildAddPlanCategory(int index, int indexCategory) {
  return GetBuilder<DetailPlanController>(
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedBtn(
            paddingAllValue: 3,
            circular: 2,
            onPressed: () {
              controller.currentPage[indexCategory] = index;
              controller.pageController[indexCategory].jumpToPage(index);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 7),
                  child: SizedBox(
                    width: 95,
                    child: Text(
                      addPlanCategories[index],
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
    },
  );
}
