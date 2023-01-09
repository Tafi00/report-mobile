import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:report_azvidi/app/models/chart_model.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/item_group_card/category_time.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/item_group_card/edit_plan_bottomsheet.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/item_group_card/item_detail_data.dart';

import 'package:report_azvidi/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import '../../../main/main_controller.dart';
import '../../detail_plan_controller.dart';
import 'category.dart';

Future<void> buildBottomSheetDialog(
  Map x,
) async {
  MainController mainController = Get.put(MainController());

  Get.bottomSheet(
    GetBuilder<DetailPlanController>(
      autoRemove: false,
      didChangeDependencies: (state) {
        state.controller?.fetchListDetailReportTimeLine(x['planDetailId']);
        mainController.roleView.listen((p0) {
          state.controller?.listDetailReportDayPlan.clear();
          state.controller?.listDetailReportDay.clear();
          state.controller?.listDetailReportTimeline.clear();
          state.controller?.fetchListDetailReportTimeLine(x['planDetailId']);
        });
      },
      builder: (controller) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: Get.height * .90,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(minHeight: 44),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 22.0,
                          lineWidth: 4.0,
                          percent: (x['value'] ?? 0) / (x['valuePlan'] ?? 0) > 1
                              ? 1
                              : (x['value'] ?? 0) / (x['valuePlan'] ?? 0),
                          center: Text(
                            '${((x['value'] ?? 0) / (x['valuePlan'] ?? 0) * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                                color: returnColorPercent(
                                    (x['value'] ?? 0) / (x['valuePlan'] ?? 0)),
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                          progressColor: returnColorPercent(
                              (x['value'] ?? 0) / (x['valuePlan'] ?? 0)),
                          backgroundColor: returnColorPercent(
                                  (x['value'] ?? 0) / (x['valuePlan'] ?? 0))
                              .withOpacity(0.4),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * .32,
                              child: Text(
                                x['kpiName'],
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              x['channel'],
                              style: const TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            Text(
                              x['groupName'],
                              style: const TextStyle(
                                  color: Color(0xFFBDBDBD), fontSize: 13),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (controller.dataDetailReportTimeline[
                                                'totalAmount'] ??
                                            0) >
                                        0
                                    ? addComma(controller
                                        .dataDetailReportTimeline['totalAmount']
                                        .toStringAsFixed(0))
                                    : (controller.dataDetailReportTimeline[
                                                'totalAmount'] ??
                                            0)
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (controller.dataDetailReportTimeline[
                                                'totalAmountPlan'] ??
                                            0) >
                                        0
                                    ? addComma(controller
                                        .dataDetailReportTimeline[
                                            'totalAmountPlan']
                                        .toStringAsFixed(0))
                                    : (controller.dataDetailReportTimeline[
                                                'totalAmountPlan'] ??
                                            0)
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Color(0xFFBDBDBD), fontSize: 13),
                              ),
                            ]),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ĐVT',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            x['unit'],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Color(0xFFF27B21),
                                size: 13,
                              ),
                              Text(
                                ' KPIs',
                                style: TextStyle(
                                    color: Color(0xFFBDBDBD), fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            addComma(x['valuePlan']
                                .toStringAsFixed(2)
                                .replaceFirst('.00', '')),
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFFF27B21),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF065166),
                                size: 13,
                              ),
                              Text(
                                ' Thực chạy',
                                style: TextStyle(
                                    color: Color(0xFFBDBDBD), fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            addComma((x['value'] ?? 0)
                                .toStringAsFixed(2)
                                .replaceFirst('.00', '')),
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF065166),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height * 0.18,
                        child: PageView.builder(
                          controller: controller.pageController[5],
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          onPageChanged: (index) {
                            controller.currentPage[5] = index;
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
                                markerVisibility:
                                    TrackballVisibilityMode.visible,
                                height: 8,
                                width: 8,
                                borderWidth: 2,
                              ),
                              tooltipDisplayMode:
                                  TrackballDisplayMode.groupAllPoints,
                              builder:
                                  (context, TrackballDetails trackballDetails) {
                                return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    height: 66,
                                    width: 170,
                                    padding: const EdgeInsets.all(6),
                                    color: Colors.white70.withOpacity(0.8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.listDetailNameWeek2[
                                                  int.parse(trackballDetails
                                                          .groupingModeInfo!
                                                          .points[0]
                                                          .x
                                                          .toString()
                                                          .replaceAll(
                                                              'T', '')) -
                                                      1],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'KPIs: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              addComma(buildTextToolTip(
                                                  trackballDetails, 0)),
                                              style: const TextStyle(
                                                  color: Color(0xFFF27B21),
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Thực chạy: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              addComma(buildTextToolTip(
                                                  trackballDetails, 1)),
                                              style: const TextStyle(
                                                  color: Color(0xFF065166),
                                                  fontSize: 13),
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
                                    ? controller.listDetailReportDayPlan
                                    : controller.listDetailReportWeekPlan,
                                xValueMapper: (ChartModel data, _) => data.name,
                                yValueMapper: (ChartModel data, _) =>
                                    data.value,
                                name: 'KPIs',
                                borderWidth: 1,
                                borderColor: const Color(0xFFF27B21),
                                onCreateShader: (ShaderDetails details) {
                                  return ui.Gradient.linear(
                                      details.rect.topCenter,
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
                              ),
                              SplineAreaSeries<ChartModel, String>(
                                dataSource: index == 1
                                    ? controller.listDetailReportDay
                                    : controller.listDetailReportWeek,
                                xValueMapper: (ChartModel data, _) => data.name,
                                yValueMapper: (ChartModel data, _) =>
                                    data.value,
                                borderWidth: 1,
                                borderColor: const Color(0xFF065166),
                                onCreateShader: (ShaderDetails details) {
                                  return ui.Gradient.linear(
                                      details.rect.topCenter,
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
                                name: 'Thực chạy',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          height: 45,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: categoriesTime.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  buildCategoryTime(index, 5)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 46,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => buildCategory(index, 2),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController[2],
                      itemCount: 2,
                      onPageChanged: (index) {
                        controller.currentPage[2] = index;
                        controller.update();
                      },
                      itemBuilder: (context, index) => index == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildColumnCategory([
                                  'Click',
                                  'Impression',
                                  'CTR',
                                  'View',
                                  'Frequency',
                                  'Reach',
                                  'CR',
                                  'RLead',
                                  'QLead'
                                ]),
                                buildColumnPlanData([
                                  addComma((controller.dataDetailReportTimeline[
                                              'clickPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'impressionPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  (controller.dataDetailReportTimeline[
                                              'ctrPlan'] ??
                                          0)
                                      .toString(),
                                  addComma((controller.dataDetailReportTimeline[
                                              'viewPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'frequencyPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'reachPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  (controller.dataDetailReportTimeline[
                                              'crPlan'] ??
                                          0)
                                      .toString(),
                                  addComma((controller.dataDetailReportTimeline[
                                              'rawLeadPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'qualifiedLeadPlan'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', ''))
                                ]),
                                buildColumnData([
                                  addComma((controller.dataDetailReportTimeline[
                                              'click'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'impression'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  (controller.dataDetailReportTimeline['ctr'] ??
                                          0)
                                      .toString(),
                                  addComma((controller.dataDetailReportTimeline[
                                              'view'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'frequency'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'reach'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  (controller.dataDetailReportTimeline['cr'] ??
                                          0)
                                      .toString(),
                                  addComma((controller.dataDetailReportTimeline[
                                              'rawLead'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma((controller.dataDetailReportTimeline[
                                              'qualifiedLead'] ??
                                          0)
                                      .toString()
                                      .replaceFirst('.0', ''))
                                ]),
                                buildColumnDeviant([
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'click'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'clickPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'impression'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'impressionPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  ((controller.dataDetailReportTimeline[
                                                  'ctr'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'ctrPlan'] ??
                                              0))
                                      .toStringAsFixed(2),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'view'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'viewPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'frequency'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'frequencyPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'reach'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'reachPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  ((controller.dataDetailReportTimeline['cr'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'crPlan'] ??
                                              0))
                                      .toStringAsFixed(2),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'rawLead'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'rawLeadPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', '')),
                                  addComma(((controller
                                                      .dataDetailReportTimeline[
                                                  'qualifiedLead'] ??
                                              0) -
                                          (controller.dataDetailReportTimeline[
                                                  'qualifiedLeadPlan'] ??
                                              0))
                                      .toString()
                                      .replaceFirst('.0', ''))
                                ]),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildColumnCategory([
                                  'Đơn giá',
                                  'CK',
                                  'Giá sau CK',
                                  'Thành tiền'
                                ]),
                                if (mainController.roleView.value == 'BAORA')
                                  buildColumnPlanData_2([
                                    addComma(
                                        (controller.dataDetailReportTimeline[
                                                    'pricePlan'] ??
                                                0)
                                            .toString()),
                                    ((controller.dataDetailReportTimeline[
                                                'discountPlan'] ??
                                            0)
                                        .toStringAsFixed(1)),
                                    addComma(((controller.dataDetailReportTimeline[
                                                        'pricePlan'] ??
                                                    0) -
                                                (controller.dataDetailReportTimeline[
                                                            'pricePlan'] ??
                                                        0) *
                                                    ((controller.dataDetailReportTimeline[
                                                                'discountPlan'] ??
                                                            0) /
                                                        100) ??
                                            0)
                                        .toString()),
                                    addComma(
                                        (controller.dataDetailReportTimeline[
                                                    'amountPlan'] ??
                                                0)
                                            .toString())
                                  ]),
                                buildColumnData_2('Thực chạy', [
                                  addComma((controller.dataDetailReportTimeline[
                                              'price'] ??
                                          0)
                                      .toString()),
                                  ((controller.dataDetailReportTimeline[
                                              'discount'] ??
                                          0)
                                      .toStringAsFixed(1)),
                                  addComma(((controller.dataDetailReportTimeline[
                                                      'price'] ??
                                                  0) -
                                              (controller.dataDetailReportTimeline[
                                                          'price'] ??
                                                      0) *
                                                  ((controller.dataDetailReportTimeline[
                                                              'discount'] ??
                                                          0) /
                                                      100) ??
                                          0)
                                      .toString()),
                                  addComma((controller.dataDetailReportTimeline[
                                              'amount'] ??
                                          0)
                                      .toString())
                                ]),
                                if (mainController.roleView.value == 'NOIBO')
                                  buildColumnData_2('Nội bộ', [
                                    addComma(
                                        (controller.dataDetailReportTimeline[
                                                    'costPricePlan'] ??
                                                0)
                                            .toString()),
                                    ((controller.dataDetailReportTimeline[
                                                'internalDiscountPlan'] ??
                                            0)
                                        .toString()),
                                    addComma(((controller.dataDetailReportTimeline[
                                                        'costPricePlan'] ??
                                                    0) -
                                                (controller.dataDetailReportTimeline[
                                                            'costPricePlan'] ??
                                                        0) *
                                                    ((controller.dataDetailReportTimeline[
                                                                'internalDiscountPlan'] ??
                                                            0) /
                                                        100) ??
                                            0)
                                        .toString()),
                                    addComma(
                                        (controller.dataDetailReportTimeline[
                                                    'totalInternalCostPlan'] ??
                                                0)
                                            .toString())
                                  ]),
                              ],
                            ),
                    ),
                  ),
                  if (controller.dataDetailPlanInfo['status'] != 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              final dataPlanDetail = await controller
                                  .fetchDataDetailWithTimelineKpi(
                                      controller.dataDetailReportTimeline[
                                          'planDetailId']);
                              showEditPlanBottomSheet(dataPlanDetail,
                                  controller.dataDetailReportTimeline);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3949AB),
                                padding: const EdgeInsets.only(
                                    bottom: 5, top: 5, left: 18, right: 18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60))),
                            child: const Text(
                              'Chỉnh sửa',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ))
                      ],
                    )
                ],
              ),
            ),
            Obx(() {
              return Positioned(
                bottom: 19,
                right: 15,
                child: AbsorbPointer(
                  absorbing: !mainController.isShowSwitch.value,
                  child: AnimatedToggleSwitch<bool>.dual(
                    current: mainController.positive.value,
                    first: false,
                    second: true,
                    indicatorSize: const Size(30, 30),
                    dif: 30.0,
                    borderColor: Colors.transparent,
                    borderWidth: 5.0,
                    height: 40,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1.5),
                      ),
                    ],
                    onChanged: (b) async {
                      mainController.positive.value = b;
                      mainController.roleView.value =
                          mainController.positive.value == false
                              ? 'NOIBO'
                              : 'BAORA';
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          'roleView', mainController.roleView.value);
                      return Future.delayed(const Duration(seconds: 2));
                    },
                    colorBuilder: (b) => b ? Colors.red : Colors.green,
                    textBuilder: (value) => value
                        ? const Center(
                            child: Text(
                            'Báo ra',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                color: Colors.black),
                          ))
                        : const Center(
                            child: Text('Nội bộ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                    fontSize: 13,
                                    color: Colors.black))),
                  ),
                ),
              );
            })
          ],
        );
      },
    ),
    enableDrag: true,
    isScrollControlled: true,
    ignoreSafeArea: false,
  );
}

String buildTextToolTip(TrackballDetails pointInfo, int index) {
  return pointInfo.groupingModeInfo!.points[index].y > 1
      ? pointInfo.groupingModeInfo!.points[index].y.toStringAsFixed(0)
      : pointInfo.groupingModeInfo!.points[index].y.toStringAsFixed(2);
}
