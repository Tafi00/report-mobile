import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'category.dart';

Widget buildForthCard() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return Container(
        width: double.infinity,
        height: 320,
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'TỶ TRỌNG THEO MỤC TIÊU',
              style: TextStyle(
                  color: Color(0XFF595A5C),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 46,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategory(index, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Flexible(
              child: PageView.builder(
                controller: controller.pageController[0],
                itemCount: 2,
                onPageChanged: (index) {
                  controller.currentPage[0] = index;
                  controller.update();
                },
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            controller.sumBranding[1] < 1
                                ? Container()
                                : Stack(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 140,
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
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text('BRANDING',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 13)),
                                                index == 1
                                                    ? Text(
                                                        addComma(controller
                                                            .sumBranding[0]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF333333),
                                                            fontSize: 14),
                                                      )
                                                    : Text(
                                                        addComma(controller
                                                            .sumBranding[1]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF333333),
                                                            fontSize: 14),
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            controller.sumPushSale[1] < 1
                                ? Container()
                                : Stack(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 140,
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
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text('PUSHSALE',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 13)),
                                                index == 1
                                                    ? Text(
                                                        addComma(controller
                                                            .sumPushSale[0]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF333333),
                                                            fontSize: 14),
                                                      )
                                                    : Text(
                                                        addComma(controller
                                                            .sumPushSale[1]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                            const SizedBox(
                              height: 10,
                            ),
                            controller.sumProduction[1] < 1
                                ? Container()
                                : Stack(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 140,
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
                                                  color: Color(0xFF595A5C),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  6),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text('PRODUCTIONS',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF828282),
                                                        fontSize: 13)),
                                                index == 1
                                                    ? Text(
                                                        addComma(controller
                                                            .sumProduction[0]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF333333),
                                                            fontSize: 14),
                                                      )
                                                    : Text(
                                                        addComma(controller
                                                            .sumProduction[1]
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                            padding: const EdgeInsets.all(4),
                                            child: Column(
                                              children: [
                                                Text('${point.x}',
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                  addComma(point.y.toString()),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                      ],
                                    );
                                  }),
                              margin: EdgeInsets.zero,
                              palette: controller.listColor,
                              series: <CircularSeries<ProfitModel, String>>[
                                DoughnutSeries<ProfitModel, String>(
                                  dataSource: index == 1
                                      ? controller.chartTargetData
                                      : controller.chartTargetPlanData,
                                  xValueMapper: (ProfitModel data, _) =>
                                      data.name,
                                  yValueMapper: (ProfitModel data, _) =>
                                      data.value,
                                  dataLabelMapper: (ProfitModel data, _) =>
                                      data.percent,
                                  dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  innerRadius: '22',
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
