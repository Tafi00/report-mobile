import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/multi_card_data_customer/model_bottomsheet.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';

import '../../../../utils/constants.dart';

Widget buildDataCustomerItem({required Map dataItem}) {
  var avgPercent = (dataItem['percent'] ?? 0) / 100;

  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.detailPlan, arguments: dataItem['planId']);
    },
    child: Column(
      children: [
        Wrap(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
              decoration: BoxDecoration(
                  color: const Color(0XFFFAFEFF),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: CircularPercentIndicator(
                          radius: 20.0,
                          lineWidth: 4.0,
                          percent: avgPercent > 1 ? 1 : avgPercent,
                          center: Text(
                            '${(avgPercent * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                                color: returnColorPercent(avgPercent),
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                          progressColor: returnColorPercent(avgPercent),
                          backgroundColor:
                              returnColorPercent(avgPercent).withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.50,
                            child: Text(
                              '${dataItem["projectName"]} - ${dataItem["planName"].replaceFirst('Phụ Lục', 'PL')}',
                              style: GoogleFonts.openSans(
                                  color: const Color(0xFF4F4F4F),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '${DateFormat('dd/MM/yyyy').format(DateTime.parse(dataItem['startDate']))} - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(dataItem['endDate']))}',
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFF828282)),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            dataItem["stage"] ?? "",
                            style: TextStyle(
                                color: dataItem["stage"] == 'Đang chạy'
                                    ? const Color(0xFF3949AB)
                                    : Colors.black54),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            showModelBottomSheet();
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            size: 30,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                dataItem['totalRevenuePlan'] == null
                                    ? '0'
                                    : dataItem['totalRevenuePlan'] > (1000000)
                                        ? '${(dataItem['totalRevenuePlan'] / (1000000)).toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}M'
                                        : dataItem['totalRevenuePlan']
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                dataItem['totalRevenue'] == null
                                    ? '0'
                                    : dataItem['totalRevenue'] > (1000000)
                                        ? '${(dataItem['totalRevenue'] / (1000000)).toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}M'
                                        : dataItem['totalRevenue']
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
                        SizedBox(
                          width: 53,
                          child: Column(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                dataItem['click'] == null
                                    ? '0'
                                    : dataItem['click']
                                        .toString()
                                        .replaceFirst('.0', '')
                                        .replaceAllMapped(reg, mathFunc),
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Click',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xFF828282)),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                dataItem['impression'] == null
                                    ? '0'
                                    : dataItem['impression']
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc)
                                        .replaceFirst('.0', ''),
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            const Text('Impression',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xFF828282))),
                          ],
                        ),
                        SizedBox(
                          width: 53,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  dataItem['rawLead'] != null
                                      ? dataItem['rawLead']
                                          .toString()
                                          .replaceAllMapped(reg, mathFunc)
                                      : '0',
                                  style: const TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              const Text('RLead',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF828282))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    ),
  );
}
