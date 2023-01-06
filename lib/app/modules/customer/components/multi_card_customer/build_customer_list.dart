import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';

import 'customer_item.dart';

Widget buildCustomerCard() {
  return GetBuilder<CustomerController>(builder: (customerController) {
    return RefreshIndicator(
      onRefresh: () async {
        customerController.refreshData();
      },
      child: ListView.builder(
        itemCount: customerController.dataListPagingCustomer.length,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 200),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: buildCustomerItem(
                        customerCardModel:
                            customerController.dataListPagingCustomer[index]),
                  )));
        },
      ),
    );
  });
}
