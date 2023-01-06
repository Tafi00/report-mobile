import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';
import 'package:report_azvidi/app/modules/home/components/category.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import '../../../utils/constants.dart';

Widget buildCategory(int index) {
  return GetBuilder<DetailCustomerController>(
    assignId: true,
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedBtn(
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
        ],
      );
    },
  );
}
