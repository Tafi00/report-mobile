import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/item_group_card/item_group_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';

Widget buildMultiPlanGroupCard() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return ListView.builder(
        itemCount: controller.dataGroup.length,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final nameGroup = controller.dataGroup.keys.toList()[index];
          return buildItemGroupCard(
              nameGroup: nameGroup, dataGroup: controller.dataGroup[nameGroup]);
        },
      );
    },
  );
}
