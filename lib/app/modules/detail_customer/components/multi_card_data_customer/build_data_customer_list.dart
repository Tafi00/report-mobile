import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';

import 'data_customer_item.dart';

Widget buildDataCustomer(List listPaging) {
  DetailCustomerController controller = Get.put(DetailCustomerController());
  return Obx(() {
    return ListView.builder(
      itemCount: controller.searchText.value != ''
          ? controller.listDataPlanReportSearch.length
          : listPaging.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => buildDataCustomerItem(
          dataItem: controller.searchText.value != ''
              ? controller.listDataPlanReportSearch[index]
              : listPaging[index]),
    );
  });
}
