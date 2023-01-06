import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/marketing_customer_model.dart';
import 'package:report_azvidi/app/modules/customer/components/multi_card_customer/model_bottomsheet.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_page.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

class CustomerItem extends StatelessWidget {
  final MarketingCustomerModel customerCardModel;
  const CustomerItem({Key? key, required this.customerCardModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailCustomer,
            arguments: customerCardModel.customerId);
      },
      child: Wrap(
        children: [
          Container(
            width: 345,
            decoration: BoxDecoration(
                color: const Color(0xFFFAFEFF),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.blueAccent,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside)),
                        child: CircleAvatar(
                          backgroundImage: MemoryImage(base64Decode(
                              customerCardModel.avatar
                                  .replaceFirst('data:image/png;base64,', '')
                                  .replaceFirst('data:image/jpeg;base64,', '')
                                  .replaceFirst('data:image/jpg;base64,', ''))),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerCardModel.customerName,
                            style: const TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            getStage(customerCardModel),
                            style: const TextStyle(
                                color: Color(0xFF3949AB), fontSize: 13),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedBtn(
                        onPressed: () {
                          showModelBottomSheet();
                        },
                        circular: 50,
                        paddingAllValue: 0,
                        child: const Icon(Icons.more_vert, size: 28),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            customerCardModel.totalRevenuePlan > (1000000)
                                ? '${(customerCardModel.totalRevenuePlan / (1000000)).toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}M'
                                : customerCardModel.totalRevenuePlan
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Doanh thu',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF828282)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              customerCardModel.totalRevenue > (1000000)
                                  ? '${(customerCardModel.totalRevenue / (1000000)).toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}M'
                                  : customerCardModel.totalRevenue
                                      .toString()
                                      .replaceAllMapped(reg, mathFunc),
                              style: const TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Text('Thực chạy',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF828282))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(0.toString(),
                              style: const TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Text('Công nợ',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF828282))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
