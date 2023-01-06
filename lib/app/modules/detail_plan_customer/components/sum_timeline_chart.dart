import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

import '../../../models/chart_model.dart';
import '../../../utils/constants.dart';
import 'category_time.dart';
import 'item_group_card/popup_item_card.dart';

Widget buildSumTimelineChart() {
  DetailPlanController controller = Get.put(DetailPlanController());
  return SizedBox(
    height: Get.height * 0.25,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 45,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoriesTime.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCategoryTime(index, 4)),
        ),
        Expanded(
          child: PageView.builder(
            controller: controller.pageController[4],
            itemCount: 2,
            onPageChanged: (index) {
              controller.currentPage[4] = index;
              controller.update();
            },
            itemBuilder: (context, index) => SfCartesianChart(
              plotAreaBorderWidth: 0,
              trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                hideDelay: 100000,
                lineColor: Colors.transparent,
                markerSettings: const TrackballMarkerSettings(
                  markerVisibility: TrackballVisibilityMode.visible,
                  height: 8,
                  width: 8,
                  borderWidth: 2,
                ),
                tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                builder: (context, TrackballDetails trackballDetails) {
                  return Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 66,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      color: Colors.white70.withOpacity(0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trackballDetails.groupingModeInfo!.points[0].x
                                    .toString()
                                    .contains('T')
                                ? controller.listDetailNameWeek[int.parse(
                                        trackballDetails
                                            .groupingModeInfo!.points[0].x
                                            .toString()
                                            .replaceAll('T', '')) -
                                    1]
                                : trackballDetails.groupingModeInfo!.points[0].x
                                    .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'KPIs: ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                              Text(
                                addComma(buildTextToolTip(trackballDetails, 0)),
                                style: const TextStyle(
                                    color: Color(0xFFF27B21), fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Thực chạy: ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                              Text(
                                addComma(buildTextToolTip(trackballDetails, 1)),
                                style: const TextStyle(
                                    color: Color(0xFF065166), fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                  zoomMode: ZoomMode.x,
                  enableMouseWheelZooming: true,
                  enablePinching: true),
              primaryXAxis: CategoryAxis(
                  labelStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                  interval: 1,
                  labelPlacement: LabelPlacement.onTicks,
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift),
              enableAxisAnimation: true,
              primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  numberFormat: NumberFormat.compact(),
                  majorTickLines: const MajorTickLines(size: 0)),
              series: <ChartSeries>[
                SplineAreaSeries<ChartModel, String>(
                  dataSource: index == 1
                      ? controller.listReportDayPlan
                      : controller.listReportWeekPlan,
                  xValueMapper: (ChartModel data, _) => data.name,
                  yValueMapper: (ChartModel data, _) => data.value,
                  borderWidth: 1,
                  borderColor: const Color(0xFFF27B21),
                  onCreateShader: (ShaderDetails details) {
                    return ui.Gradient.linear(details.rect.topCenter,
                        details.rect.bottomCenter, <Color>[
                      const Color(0xFFF27B21),
                      const Color(0xFFF27B21).withOpacity(0.6),
                      const Color(0xFFF27B21).withOpacity(0.3)
                    ], <double>[
                      0.4,
                      0.7,
                      1
                    ]);
                  },
                  name: 'Thực chạy',
                ),
                SplineAreaSeries<ChartModel, String>(
                  dataSource: index == 1
                      ? controller.listReportDay
                      : controller.listReportWeek,
                  xValueMapper: (ChartModel data, _) => data.name,
                  yValueMapper: (ChartModel data, _) => data.value,
                  name: 'KPIs',
                  borderWidth: 1,
                  borderColor: const Color(0xFF065166),
                  onCreateShader: (ShaderDetails details) {
                    return ui.Gradient.linear(details.rect.topCenter,
                        details.rect.bottomCenter, <Color>[
                      const Color(0xFF065166),
                      const Color(0xFF065166).withOpacity(0.6),
                      const Color(0xFF065166).withOpacity(0.3)
                    ], <double>[
                      0.4,
                      0.7,
                      1
                    ]);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
