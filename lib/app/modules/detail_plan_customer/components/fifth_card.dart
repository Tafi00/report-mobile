import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'category.dart';

Widget buildFifthCard() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return controller.dataSummaryPlan.isNotEmpty
          ? Container(
              width: double.infinity,
              height: 324,
              decoration: const BoxDecoration(
                  color: Color(0xFFFAFEFF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
                            buildCategory(index, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController[1],
                      itemCount: 2,
                      onPageChanged: (index) {
                        controller.currentPage[1] = index;
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
                                  width: 148,
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
                                              ((controller.dataSummaryPlan[
                                                          'amountPlan'] ??
                                                      0))
                                                  .toString()
                                                  .replaceAllMapped(
                                                      reg, mathFunc),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF828282),
                                                  fontSize: 14))
                                          : Text(
                                              ((controller.dataSummaryPlan[
                                                          'amount'] ??
                                                      0))
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
                                  width: 145,
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
                                              (controller.dataSummaryPlan[
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
                                              (controller.dataSummaryPlan[
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
                              width: 148,
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
                                          (controller.dataSummaryPlan[
                                                      'totalRevenuePlan'] ??
                                                  0)
                                              .toString()
                                              .replaceAllMapped(reg, mathFunc),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF333333),
                                              fontSize: 16))
                                      : Text(
                                          (controller.dataSummaryPlan[
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
                                                          (controller.dataSummaryPlan['capitalAmountPlan'] ?? 0)
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
                                                          (controller.dataSummaryPlan[
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
                                                          (controller.dataSummaryPlan[
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
                                                          (controller.dataSummaryPlan[
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
                                  width: 163,
                                  height: 163,
                                  child: SfCircularChart(
                                      tooltipBehavior: TooltipBehavior(
                                          enable: true,
                                          builder: (dynamic data,
                                              dynamic point,
                                              dynamic series,
                                              int pointIndex,
                                              int seriesIndex) {
                                            return Wrap(
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Column(
                                                      children: [
                                                        Text('${point.x}',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                        Text(
                                                          addComma(point.y
                                                              .toString()),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            );
                                          }),
                                      palette: const [
                                        Color(0xFF065166),
                                        Color(0xFFF27B21),
                                      ],
                                      margin: EdgeInsets.zero,
                                      series: <
                                          CircularSeries<ProfitModel, String>>[
                                        DoughnutSeries<ProfitModel, String>(
                                          dataSource: index == 0
                                              ? controller
                                                  .chartDashboardPlanData
                                              : controller.chartDashboardData,
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
