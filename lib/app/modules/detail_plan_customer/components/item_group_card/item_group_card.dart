import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/item_group_card/popup_item_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

Widget buildItemGroupCard({required nameGroup, required dataGroup}) {
  return GetBuilder<DetailPlanController>(
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              nameGroup,
              style: const TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var x in dataGroup)
                GestureDetector(
                  onTap: () {
                    controller.clearDetailData();
                    buildBottomSheetDialog(x);
                  },
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 72),
                    padding:
                        const EdgeInsets.only(top: 14, right: 14, left: 14),
                    color: const Color(0xFFFAFEFF),
                    child: Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(minHeight: 44),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: 22.0,
                                lineWidth: 4.0,
                                percent: (x['value'] ?? 0) /
                                            (x['valuePlan'] ?? 1) >
                                        1
                                    ? 1
                                    : (x['value'] ?? 0) / (x['valuePlan'] ?? 1),
                                center: Text(
                                  '${((x['value'] ?? 0) / (x['valuePlan'] ?? 1) * 100).toStringAsFixed(0)}%',
                                  style: TextStyle(
                                      color: returnColorPercent(
                                          (x['value'] ?? 0) /
                                              (x['valuePlan'] ?? 1)),
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700),
                                ),
                                progressColor: returnColorPercent(
                                    (x['value'] ?? 0) / (x['valuePlan'] ?? 1)),
                                backgroundColor: returnColorPercent(
                                        (x['value'] ?? 0) /
                                            (x['valuePlan'] ?? 1))
                                    .withOpacity(0.4),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * .30,
                                    child: Text(
                                      x['kpiName'],
                                      style: const TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    x['channel'],
                                    style: TextStyle(
                                        color: returnColorKpi(x['channel']),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    addComma((x['value'] ?? 0)
                                        .toStringAsFixed(2)
                                        .replaceFirst('.00', '')),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Color(0xFF333333)),
                                  ),
                                  Text(
                                    x['unit'],
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xFF828282)),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    addComma((x['cost'] ?? 0)
                                        .toStringAsFixed(2)
                                        .replaceFirst('.00', '')),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF333333)),
                                  ),
                                  Text(
                                    addComma((x['budget'] ?? 0)
                                        .toStringAsFixed(2)
                                        .replaceFirst('.00', '')),
                                    style: const TextStyle(
                                        fontSize: 14, color: Color(0xFFE0E0E0)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          height: 0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: const Color(0x33828282),
                                  strokeAlign: BorderSide.strokeAlignCenter)),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      );
    },
  );
}
