import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../detail_plan_controller.dart';

Widget buildSecondCard() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return Container(
        width: double.infinity,
        height: 170,
        decoration: const BoxDecoration(color: Color(0xFFFAFEFF), boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ]),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 63,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F5F8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      showDuration: const Duration(seconds: 6),
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['clickPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['click'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Click',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            cutNum(controller.dataDetailPlan['click']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  countPercent(
                                      controller.dataDetailPlan['click'],
                                      controller.dataDetailPlan['clickPlan']),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(controller
                                                .dataDetailPlan['clickPlan'] ==
                                            null
                                        ? 0
                                        : controller.dataDetailPlan['click'] /
                                            controller
                                                .dataDetailPlan['clickPlan']),
                                  )),
                              Text(
                                controller.dataDetailPlan['clickPlan'] == null
                                    ? ' KPIs 0'
                                    : controller.dataDetailPlan['clickPlan'] >=
                                            1000
                                        ? ' KPIs ${(controller.dataDetailPlan['clickPlan'] / 1000).toStringAsFixed(0)}K'
                                        : ' KPIs ${controller.dataDetailPlan['clickPlan'].toString()}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      showDuration: const Duration(seconds: 6),
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['impressionPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['impression'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Impression',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            controller.dataDetailPlan['impression'] == null
                                ? '0'
                                : cutNum(
                                    controller.dataDetailPlan['impression']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  controller.dataDetailPlan['impressionPlan'] ==
                                          null
                                      ? '0%'
                                      : '${(((controller.dataDetailPlan['impression'] ?? 0) / controller.dataDetailPlan['impressionPlan']) * 100).toStringAsFixed(0).replaceFirst('NaN', '0').replaceFirst('Infinity', '0')}%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(controller
                                                .dataDetailPlan['impression'] ==
                                            null
                                        ? 0
                                        : controller
                                                .dataDetailPlan['impression'] /
                                            controller.dataDetailPlan[
                                                'impressionPlan']),
                                  )),
                              Text(
                                controller.dataDetailPlan['impressionPlan'] ==
                                        null
                                    ? ' KPIs 0'
                                    : ' KPIs ${cutNum(controller.dataDetailPlan['impressionPlan'])}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      showDuration: const Duration(seconds: 6),
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['viewPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['view'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'View',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            cutNum(controller.dataDetailPlan['view']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  countPercent(
                                      controller.dataDetailPlan['view'],
                                      controller.dataDetailPlan['viewPlan']),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(controller
                                                .dataDetailPlan['view'] ==
                                            null
                                        ? 0
                                        : controller.dataDetailPlan['view'] /
                                            controller
                                                .dataDetailPlan['viewPlan']),
                                  )),
                              Text(
                                cutNumKpi(
                                    controller.dataDetailPlan['viewPlan']),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 63,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F5F8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      showDuration: const Duration(seconds: 6),
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['aidcPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['aidc'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'AIDC',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            cutNum(controller.dataDetailPlan['aidc']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  countPercent(
                                      controller.dataDetailPlan['aidc'],
                                      controller.dataDetailPlan['aidcPlan']),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(controller
                                                .dataDetailPlan['aidcPlan'] ==
                                            null
                                        ? 0
                                        : controller.dataDetailPlan['aidc'] /
                                            controller
                                                .dataDetailPlan['aidcPlan']),
                                  )),
                              Text(
                                cutNumKpi(
                                    controller.dataDetailPlan['aidcPlan']),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['rawLeadPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['rawLead'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      showDuration: const Duration(seconds: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'RLead',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            cutNum(controller.dataDetailPlan['rawLead']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  countPercent(
                                      controller.dataDetailPlan['rawLead'],
                                      controller.dataDetailPlan['rawLeadPlan']),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(controller
                                                .dataDetailPlan['rawLead'] ==
                                            null
                                        ? 0
                                        : controller.dataDetailPlan['rawLead'] /
                                            controller
                                                .dataDetailPlan['rawLeadPlan']),
                                  )),
                              Text(
                                cutNumKpi(
                                    controller.dataDetailPlan['rawLeadPlan']),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(2),
                    child: Tooltip(
                      richMessage: TextSpan(
                          text: 'KPIs: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    '${addComma((controller.dataDetailPlan['qualifiedLeadPlan'] ?? 0).toStringAsFixed(0))}\nThực chạy: ${addComma((controller.dataDetailPlan['qualifiedLead'] ?? 0).toStringAsFixed(0))}')
                          ]),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Qlead',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF828282)),
                          ),
                          Text(
                            cutNum(controller.dataDetailPlan['qualifiedLead']),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  countPercent(
                                      controller
                                          .dataDetailPlan['qualifiedLead'],
                                      controller
                                          .dataDetailPlan['qualifiedLeadPlan']),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: returnColorPercent(
                                        controller.dataDetailPlan[
                                                    'qualifiedLead'] ==
                                                null
                                            ? 0
                                            : controller.dataDetailPlan[
                                                    'qualifiedLead'] /
                                                controller.dataDetailPlan[
                                                    'qualifiedLeadPlan']),
                                  )),
                              Text(
                                cutNumKpi(controller
                                    .dataDetailPlan['qualifiedLeadPlan']),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF828282),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
