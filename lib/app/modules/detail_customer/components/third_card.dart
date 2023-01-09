import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';
import 'category.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/constants.dart';

Widget buildThirdCard() {
  return GetBuilder<DetailCustomerController>(
    builder: (controller) {
      return controller.dataSummaryDashboardCustomer != {}
          ? Container(
              width: double.infinity,
              height: 325,
              decoration: const BoxDecoration(
                  color: Color(0xFFFAFEFF),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
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
                  SizedBox(
                    height: 46,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => buildCategory(index),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: 2,
                      onPageChanged: (index) {
                        controller.currentPage.value = index;
                        controller.update();
                      },
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                          left: 14,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 38,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Thành tiền',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      index == 0
                                          ? Text(
                                              (controller.dataSummaryDashboardCustomer[
                                                          'amountPlan'] ??
                                                      0)
                                                  .toString()
                                                  .replaceAllMapped(
                                                      reg, mathFunc),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF828282),
                                                  fontSize: 14))
                                          : Text(
                                              (controller.dataSummaryDashboardCustomer[
                                                          'amount'] ??
                                                      0)
                                                  .toString()
                                                  .replaceAllMapped(
                                                      reg, mathFunc),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF828282),
                                                  fontSize: 14))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 38,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Phí dịch vụ',
                                          style: TextStyle(
                                              color: Color(0xFF828282),
                                              fontSize: 13)),
                                      index == 0
                                          ? Text(
                                              (controller.dataSummaryDashboardCustomer[
                                                          'feeAmountPlan'] ??
                                                      0)
                                                  .toString()
                                                  .replaceAllMapped(
                                                      reg, mathFunc),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF828282),
                                                  fontSize: 14))
                                          : Text(
                                              (controller.dataSummaryDashboardCustomer[
                                                          'feeAmount'] ??
                                                      0)
                                                  .toString()
                                                  .replaceAllMapped(
                                                      reg, mathFunc),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF828282),
                                                  fontSize: 14))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 150,
                              height: 45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Tổng doanh thu',
                                      style: TextStyle(
                                          color: Color(0xFF828282),
                                          fontSize: 13)),
                                  index == 0
                                      ? Text(
                                          (controller.dataSummaryDashboardCustomer[
                                                      'totalRevenuePlan'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF333333),
                                              fontSize: 16))
                                      : Text(
                                          (controller.dataSummaryDashboardCustomer[
                                                      'totalRevenue'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF333333),
                                              fontSize: 16))
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFF3F5F8),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 6,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFF27B21),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(6),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    6))),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text('Giá vốn',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF828282),
                                                          fontSize: 13)),
                                                  index == 0
                                                      ? Text(
                                                          (controller.dataSummaryDashboardCustomer['capitalAmountPlan'] ?? 0)
                                                              .toString()
                                                              .replaceAllMapped(
                                                                  reg, mathFunc),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFF333333),
                                                              fontSize: 14))
                                                      : Text(
                                                          (controller.dataSummaryDashboardCustomer[
                                                                      'capitalAmount'] ??
                                                                  0)
                                                              .toString()
                                                              .replaceAllMapped(
                                                                  reg, mathFunc),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: Color(0xFF333333),
                                                              fontSize: 14))
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 19,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFF3F5F8),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 6,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF065166),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(6),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    6))),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text('Lợi nhuận',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF828282),
                                                          fontSize: 13)),
                                                  index == 0
                                                      ? Text(
                                                          (controller.dataSummaryDashboardCustomer[
                                                                      'grossProfitPlan'] ??
                                                                  0)
                                                              .toString()
                                                              .replaceAllMapped(
                                                                  reg,
                                                                  mathFunc),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFF333333),
                                                              fontSize: 14),
                                                        )
                                                      : Text(
                                                          (controller.dataSummaryDashboardCustomer[
                                                                      'grossProfit'] ??
                                                                  0)
                                                              .toString()
                                                              .replaceAllMapped(
                                                                  reg,
                                                                  mathFunc),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFF333333),
                                                              fontSize: 14),
                                                        )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 168,
                                  height: 168,
                                  child: SfCircularChart(
                                      tooltipBehavior:
                                          controller.tooltipBehavior,
                                      margin: EdgeInsets.zero,
                                      palette: const [
                                        Color(0xFF065166),
                                        Color(0xFFF27B21),
                                      ],
                                      series: <
                                          CircularSeries<ProfitModel, String>>[
                                        DoughnutSeries<ProfitModel, String>(
                                          dataSource: index == 0
                                              ? controller.chartPlanData
                                              : controller.chartData,
                                          xValueMapper: (ProfitModel data, _) =>
                                              data.name,
                                          yValueMapper: (ProfitModel data, _) =>
                                              data.value,
                                          dataLabelMapper:
                                              (ProfitModel data, _) =>
                                                  data.percent,
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true,
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                          innerRadius: '22',
                                        )
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container();
    },
  );
}
