import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as dt;
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildFirstCard() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return Obx(() => Container(
            padding:
                const EdgeInsets.only(top: 12, left: 16, right: 14, bottom: 10),
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
            child: Container(
              constraints: BoxConstraints(
                  minHeight: controller.isShowMore.value ? 265 : 126),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Digital Marketing Plan',
                        style: TextStyle(
                            color: Color(0xFF595A5C),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      if (controller.dataDetailPlanInfo['status'] != 1)
                        SvgPicture.asset('assets/icons/edit_icon.svg')
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Khách hàng',
                        style:
                            TextStyle(fontSize: 13, color: Color(0XFF828282)),
                      ),
                      Text(
                        controller.dataDetailPlanInfo['customerName'] ?? '',
                        style: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dự án',
                        style:
                            TextStyle(fontSize: 13, color: Color(0XFF828282)),
                      ),
                      Text(
                        controller.dataDetailPlanInfo['projectName'] ?? '',
                        overflow: TextOverflow.clip,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  controller.isShowMore.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Thời gian triển khai',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0XFF828282)),
                                ),
                                Text(
                                  '${dt.DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.dataDetailPlanInfo['endDate'] ?? '2000-01-01T00:00:00'))} - ${dt.DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.dataDetailPlanInfo['startDate'] ?? '2000-01-01T00:00:00'))}',
                                  overflow: TextOverflow.clip,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Phí dịch vụ',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0XFF828282)),
                                ),
                                Text(
                                  '${controller.dataDetailPlanInfo['fee']}%',
                                  overflow: TextOverflow.clip,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Mục tiêu',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0XFF828282)),
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    controller.dataDetailPlanInfo[
                                                'objective'] !=
                                            null
                                        ? controller
                                            .dataDetailPlanInfo['objective']
                                            .replaceAll('\n', ' ')
                                        : '',
                                    overflow: TextOverflow.clip,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Đối tượng',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0XFF828282)),
                                ),
                                SizedBox(
                                  width: Get.width * 0.5,
                                  child: Text(
                                    controller.dataDetailPlanInfo['target'] !=
                                            null
                                        ? controller
                                            .dataDetailPlanInfo['target']
                                            .replaceAll('\n', ' ')
                                        : '',
                                    overflow: TextOverflow.clip,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedBtn(
                        circular: 50,
                        paddingAllValue: 0,
                        onPressed: () {
                          controller.toggleShowMore();
                        },
                        child: controller.isShowMore.value
                            ? const Icon(
                                Icons.arrow_drop_up,
                                size: 30,
                                color: Color(0xFF828282),
                              )
                            : const Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: Color(0xFF828282),
                              ),
                      ),
                      const Spacer()
                    ],
                  )
                ],
              ),
            ),
          ));
    },
  );
}
