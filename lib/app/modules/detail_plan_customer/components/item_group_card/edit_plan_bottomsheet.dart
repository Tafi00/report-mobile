import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/add_plan_category.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/dropdown/channel_drop_down.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/dropdown/dvt_drop_down.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import '../../detail_plan_controller.dart';
import '../dropdown/group_target_drop_down.dart';

void showEditPlanBottomSheet(Map x, Map dataItem) {
  TextEditingController kpisController = TextEditingController(
      text: addComma((x['value'] ?? 0).toStringAsFixed(0)));
  TextEditingController costController = TextEditingController(
      text: addComma((x['costPrice'] ?? 0).toStringAsFixed(0)));
  TextEditingController discountController = TextEditingController(
      text: addComma((x['discountAmount'] ?? 0).toStringAsFixed(1)));
  TextEditingController amountController = TextEditingController(
      text: addComma((x['internalCost'] ?? 0).toStringAsFixed(0)));
  TextEditingController costPlanController = TextEditingController(
      text: addComma((x['price'] ?? 0).toStringAsFixed(0)));
  TextEditingController discountPlanController = TextEditingController(
      text: addComma((x['discount'] ?? 0).toStringAsFixed(1)));
  TextEditingController amountPlanController = TextEditingController(
      text: addComma((x['amount'] ?? 0).toStringAsFixed(0)));
  TextEditingController ctrController = TextEditingController(
      text: (x['ctr'] ?? 0) < 0
          ? (x['ctr'] ?? 0).toString()
          : (x['ctr'] ?? 0).toStringAsFixed(0));
  TextEditingController crController = TextEditingController(
      text: (x['cr'] ?? 0) < 0
          ? (x['cr'] ?? 0).toString()
          : (x['cr'] ?? 0).toStringAsFixed(0));
  TextEditingController frequencyController = TextEditingController(
      text: addComma((x['frequency'] ?? 0).toStringAsFixed(0)));
  TextEditingController clickController = TextEditingController(
      text: addComma((x['click'] ?? 0).toStringAsFixed(0)));
  TextEditingController impressionController = TextEditingController(
      text: addComma((x['impression'] ?? 0).toStringAsFixed(0)));
  TextEditingController viewController = TextEditingController(
      text: addComma((x['view'] ?? 0).toStringAsFixed(0)));
  TextEditingController reachController = TextEditingController(
      text: addComma((x['reach'] ?? 0).toStringAsFixed(0)));
  TextEditingController rLeadController = TextEditingController(
      text: addComma((x['rawLead'] ?? 0).toStringAsFixed(0)));
  TextEditingController cplController =
      TextEditingController(text: addComma((x['cpl'] ?? 0).toStringAsFixed(0)));
  final formKey = GlobalKey<FormState>();

  Get.bottomSheet(
    GetBuilder<DetailPlanController>(
      assignId: false,
      builder: (controller) {
        return Wrap(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sửa hạng mục',
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      ElevatedBtn(
                        onPressed: () {
                          Get.back();
                        },
                        circular: 50,
                        paddingAllValue: 2,
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFF3949ab),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: addPlanCategories.length,
                        itemBuilder: (context, index) =>
                            buildAddPlanCategory(index, 4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: Get.height * .64,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller.pageController[4],
                      itemCount: 3,
                      onPageChanged: (index) {
                        controller.currentPage[4] = index;
                        controller.update();
                      },
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Kênh',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      buildChannelDropDown()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Hạng mục & ĐVT',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      buildDvtDropDown(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Nhóm mục tiêu',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      buildGroupDropDown()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'KPIs',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: Get.width * .52,
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          controller: kpisController,
                                          validator: (value) {
                                            if (kpisController.text == '') {
                                              return 'Kpis không được để trống';
                                            }
                                            return null;
                                          },
                                          style: const TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 10),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Color(0xFF828282)))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          'Đơn giá',
                                          style: TextStyle(
                                              color: Color(0xFF828282),
                                              fontSize: 13),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * .52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Báo ra',
                                                  style: TextStyle(
                                                      color: Color(0xFF828282),
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  width: Get.width * .25,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                    controller:
                                                        costPlanController,
                                                    decoration: InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8,
                                                                vertical: 8),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xFF828282)))),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Nội bộ',
                                                  style: TextStyle(
                                                      color: Color(0xFF828282),
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  width: Get.width * .25,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                    controller: costController,
                                                    decoration: InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8,
                                                                vertical: 8),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xFF828282)))),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Chiết khấu',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: Get.width * .52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                controller:
                                                    discountPlanController,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                controller: discountController,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Thành tiền',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: Get.width * .52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                controller:
                                                    amountPlanController,
                                                decoration: InputDecoration(
                                                    enabled: false,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                controller: amountController,
                                                decoration: InputDecoration(
                                                    enabled: false,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Thành tiền điều chỉnh',
                                        style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: Get.width * .52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: Get.width * .25,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF828282)))),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              backgroundColor:
                                                  const Color(0xFF3949ab)),
                                          child: const Text(
                                            'Hủy bỏ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      ElevatedButton(
                                          onPressed: () async {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            controller.pageController[4]
                                                .nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.decelerate);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              backgroundColor:
                                                  const Color(0xFF3949ab)),
                                          child: const Text(
                                            'Tiếp',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ],
                              )
                            : index == 1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: Get.width * .3,
                                            child: const Text(
                                              'Tuần',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * .3,
                                            child: const Text(
                                              'Timeline',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * .3,
                                            child: const Text(
                                              'KPI',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        color: const Color(0x33828282),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.5,
                                        child: ListView.builder(
                                          itemCount:
                                              dataItem['timeLines'].length,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * .3,
                                                      child: Text(
                                                        dataItem['timeLines']
                                                            [index]['weekName'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .3,
                                                      child: Text(
                                                        '${getDatetimeFormat(dataItem['timeLines'][index]['startDate'])} - ${getDatetimeFormat(dataItem['timeLines'][index]['endDate'])}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .3,
                                                      child: Text(
                                                        addComma(
                                                            dataItem['timeLines']
                                                                        [index][
                                                                    'valuePlan']
                                                                .toStringAsFixed(
                                                                    0)),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 1,
                                                  color:
                                                      const Color(0x33828282),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  backgroundColor:
                                                      const Color(0xFF3949ab)),
                                              child: const Text(
                                                'Hủy bỏ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                                controller.pageController[4]
                                                    .nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve:
                                                            Curves.decelerate);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  backgroundColor:
                                                      const Color(0xFF3949ab)),
                                              child: const Text(
                                                'Tiếp',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'CTR(%)',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: ctrController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'CR(%)',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              controller: crController,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Frequency',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: frequencyController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Click',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              controller: clickController,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Impression',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: impressionController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'View',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: viewController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Reach',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: reachController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'RLead',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: rLeadController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'CPL',
                                            style: TextStyle(
                                                color: Color(0xFF828282),
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: Get.width * .52,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              controller: cplController,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFF828282)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  backgroundColor:
                                                      const Color(0xFF3949ab)),
                                              child: const Text(
                                                'Hủy bỏ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  print('object');
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  backgroundColor:
                                                      const Color(0xFF3949ab)),
                                              child: const Text(
                                                'Hoàn tất',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ],
                                  );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    ),
    enableDrag: true,
    isScrollControlled: true,
    ignoreSafeArea: false,
  );
}
