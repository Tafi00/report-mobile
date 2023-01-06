import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

import '../../../models/chart_model.dart';

Widget buildThirdCard() {
  return GetBuilder<HomeController>(
    assignId: true,
    builder: (controller) {
      return Container(
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
            const Text('NGÂN SÁCH THEO THÁNG',
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
                  style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 13),
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
                  style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 13),
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
                    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints),
                zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    zoomMode: ZoomMode.x,
                    enableMouseWheelZooming: true,
                    enablePinching: true),
                primaryXAxis: CategoryAxis(
                  interval: 1,
                  majorTickLines: const MajorTickLines(size: 0),
                  labelAlignment: LabelAlignment.start,
                  labelStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                  labelRotation: 312,
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  numberFormat: NumberFormat.compact(),
                ),
                series: <ChartSeries>[
                  ColumnSeries<ChartModel, String>(
                      dataSource: controller.getListChartModel(1),
                      xValueMapper: (ChartModel data, _) => data.name,
                      yValueMapper: (ChartModel data, _) => data.value,
                      width: 0.6,
                      name: 'Thực chạy',
                      color: const Color(0xFF065166),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  LineSeries<ChartModel, String>(
                    dataSource: controller.getListChartModel(0),
                    // Dash values for line
                    color: const Color(0xFFF27B21),
                    name: 'Kế hoạch',
                    markerSettings: const MarkerSettings(
                        isVisible: true,
                        borderWidth: 1,
                        color: Color(0xFFF27B21),
                        // Marker shape is set to diamond
                        shape: DataMarkerType.circle),
                    xValueMapper: (ChartModel data, _) => data.name,
                    yValueMapper: (ChartModel data, _) => data.value,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
