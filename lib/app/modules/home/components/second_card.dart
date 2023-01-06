import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/modules/home/components/multi_card_customer/build_customer_list.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/constants.dart';
import '../../detail_customer/components/third_card.dart';
import 'category.dart';

Padding buildSecondCard(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 324,
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
                    itemBuilder: (context, index) =>
                        buildCategory(index, controller),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: 2,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Thành tiền',
                                    style: TextStyle(
                                        color: Color(0xFF828282), fontSize: 13),
                                  ),
                                  index == 0
                                      ? Text(
                                          (controller.dataSummaryDashboard[
                                                      'amountPlan'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF828282),
                                              fontSize: 14))
                                      : Text(
                                          (controller.dataSummaryDashboard[
                                                      'amount'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Phí dịch vụ',
                                      style: TextStyle(
                                          color: Color(0xFF828282),
                                          fontSize: 13)),
                                  index == 0
                                      ? Text(
                                          (controller.dataSummaryDashboard[
                                                      'feeAmountPlan'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF828282),
                                              fontSize: 14))
                                      : Text(
                                          (controller.dataSummaryDashboard[
                                                      'feeAmount'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
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
                                      color: Color(0xFF828282), fontSize: 13)),
                              index == 0
                                  ? Text(
                                      (controller.dataSummaryDashboard[
                                                  'totalRevenuePlan'] ??
                                              0)
                                          .toString()
                                          .replaceAllMapped(reg, mathFunc),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF333333),
                                          fontSize: 16))
                                  : Text(
                                      (controller.dataSummaryDashboard[
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
                                      width: 145,
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    bottomLeft:
                                                        Radius.circular(6))),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text('Giá vốn',
                                                  style: TextStyle(
                                                      color: Color(0xFF828282),
                                                      fontSize: 13)),
                                              index == 0
                                                  ? Text(
                                                      (controller.dataSummaryDashboard[
                                                                  'capitalAmountPlan'] ??
                                                              0)
                                                          .toString()
                                                          .replaceAllMapped(
                                                              reg, mathFunc),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF333333),
                                                          fontSize: 14))
                                                  : Text(
                                                      (controller.dataSummaryDashboard[
                                                                  'capitalAmount'] ??
                                                              0)
                                                          .toString()
                                                          .replaceAllMapped(
                                                              reg, mathFunc),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF333333),
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
                                      width: 145,
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    bottomLeft:
                                                        Radius.circular(6))),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text('Lợi nhuận',
                                                  style: TextStyle(
                                                      color: Color(0xFF828282),
                                                      fontSize: 13)),
                                              index == 0
                                                  ? Text(
                                                      (controller.dataSummaryDashboard[
                                                                  'grossProfitPlan'] ??
                                                              0)
                                                          .toString()
                                                          .replaceAllMapped(
                                                              reg, mathFunc),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF333333),
                                                          fontSize: 14),
                                                    )
                                                  : Text(
                                                      (controller.dataSummaryDashboard[
                                                                  'grossProfit'] ??
                                                              0)
                                                          .toString()
                                                          .replaceAllMapped(
                                                              reg, mathFunc),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF333333),
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
                                  tooltipBehavior: controller.tooltipBehavior,
                                  margin: EdgeInsets.zero,
                                  palette: const [
                                    Color(0xFF065166),
                                    Color(0xFFF27B21),
                                  ],
                                  series: <CircularSeries<ProfitModel, String>>[
                                    DoughnutSeries<ProfitModel, String>(
                                      dataSource: index == 0
                                          ? controller.chartPlanData
                                          : controller.chartData,
                                      xValueMapper: (ProfitModel data, _) =>
                                          data.name,
                                      yValueMapper: (ProfitModel data, _) =>
                                          data.value,
                                      dataLabelMapper: (ProfitModel data, _) =>
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
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
  );
}
