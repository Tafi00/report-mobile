import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/models/chart_model.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget buildThirdCard() {
  return GetBuilder<DetailPlanController>(
    builder: (controller) {
      return controller.getListChartModel(1).isNotEmpty
          ? Container(
              width: double.infinity,
              height: 300,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('NGÂN SÁCH THEO KÊNH',
                      style: TextStyle(
                          color: Color(0XFF595A5C),
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        color: Color(0xFFF27B21),
                        size: 13,
                      ),
                      Text(
                        ' Kế hoạch',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 13),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.circle,
                        color: Color(0xFF065166),
                        size: 13,
                      ),
                      Text(
                        ' Thực chạy',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SfCartesianChart(
                      enableSideBySideSeriesPlacement: false,
                      trackballBehavior: TrackballBehavior(
                          enable: true,
                          activationMode: ActivationMode.singleTap,
                          hideDelay: 2 * 1000,
                          lineColor: Colors.transparent,
                          tooltipDisplayMode:
                              TrackballDisplayMode.groupAllPoints),
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
                          labelRotation: 312),
                      primaryYAxis:
                          NumericAxis(numberFormat: NumberFormat.compact()),
                      series: <ChartSeries>[
                        ColumnSeries<ChartModel, String>(
                            dataSource: controller.getListChartModel(1),
                            xValueMapper: (ChartModel data, _) => data.name,
                            yValueMapper: (ChartModel data, _) => data.value,
                            width: 0.4,
                            name: 'Kế hoạch',
                            color: const Color(0xFFF27B21),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        ColumnSeries<ChartModel, String>(
                            dataSource: controller.getListChartModel(0),
                            xValueMapper: (ChartModel data, _) => data.name,
                            yValueMapper: (ChartModel data, _) => data.value,
                            width: 0.4,
                            color: const Color(0xFF065166),
                            name: 'Thực chạy',
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container();
    },
  );
}
