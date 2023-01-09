import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/marketing_customer_model.dart';
import 'package:report_azvidi/app/modules/customer/components/multi_card_customer/model_bottomsheet.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_page.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildCustomerItem({required MarketingCustomerModel customerCardModel}) {
  List<Map> listStage = [];
  if (customerCardModel.active > 0) {
    listStage.add({"name": 'Đang chạy', "value": customerCardModel.active});
  }
  if (customerCardModel.pending > 0) {
    listStage.add({"name": 'Tạm dừng', "value": customerCardModel.pending});
  }
  if (customerCardModel.complete > 0) {
    listStage.add({"name": 'Hoàn thành', "value": customerCardModel.complete});
  }
  if (customerCardModel.inactive > 0) {
    listStage.add({"name": 'Báo giá', "value": customerCardModel.inactive});
  }
  if (customerCardModel.unknown > 0) {
    listStage
        .add({"name": 'Chưa xác định', "value": customerCardModel.unknown});
  }

  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.detailCustomer,
          arguments: customerCardModel.customerId);
    },
    child: Column(
      children: [
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFFAFEFF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D000000),
                        offset: Offset(0, 2),
                        blurRadius: 8,
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 8, top: 15),
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
                                    strokeAlign:
                                        BorderSide.strokeAlignOutside)),
                            child: CircleAvatar(
                              backgroundImage: MemoryImage(base64Decode(
                                  customerCardModel.avatar
                                      .replaceFirst(
                                          'data:image/png;base64,', '')
                                      .replaceFirst(
                                          'data:image/jpeg;base64,', '')
                                      .replaceFirst(
                                          'data:image/jpg;base64,', ''))),
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
                              const SizedBox(
                                height: 2,
                              ),
                              Tooltip(
                                richMessage: TextSpan(children: <InlineSpan>[
                                  for (var x = 0; x < listStage.length; x++)
                                    if (x != listStage.length - 1)
                                      TextSpan(
                                          text:
                                              '${listStage[x]['name']}: ${listStage[x]['value']}\n')
                                    else
                                      TextSpan(
                                          text:
                                              '${listStage[x]['name']}: ${listStage[x]['value']}')
                                ]),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            customerCardModel.active
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              left: 2, right: 16),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF3949AB),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            customerCardModel.pending
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              left: 2, right: 16),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFF27B21),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            customerCardModel.complete
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              left: 2, right: 16),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF219653),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            customerCardModel.inactive
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              left: 2, right: 16),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF595A5C),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedBtn(
                            onPressed: () {
                              showModelBottomSheet(customerCardModel.customerId,
                                  customerCardModel.customerName);
                            },
                            circular: 50,
                            paddingAllValue: 0,
                            child: const Icon(Icons.more_vert, size: 28),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
