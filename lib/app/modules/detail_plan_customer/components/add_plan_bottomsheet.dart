import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/add_plan_category.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/dropdown/channel_drop_down.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/dropdown/dvt_drop_down.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import 'dropdown/group_target_drop_down.dart';

void showAddPlanBottomSheet() {
  TextEditingController kpisController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController costPlanController = TextEditingController();
  TextEditingController discountPlanController = TextEditingController();
  TextEditingController amountPlanController = TextEditingController();
  TextEditingController ctrController = TextEditingController();
  TextEditingController crController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController clickController = TextEditingController();
  TextEditingController impressionController = TextEditingController();
  TextEditingController viewController = TextEditingController();
  TextEditingController reachController = TextEditingController();
  TextEditingController rLeadController = TextEditingController();
  TextEditingController cplController = TextEditingController();
  DetailPlanController controller = Get.put(DetailPlanController());
  final formKey = GlobalKey<FormState>();

  Get.bottomSheet(
      Form(
        key: formKey,
        child: Wrap(
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
                        'Thêm hạng mục',
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
                            buildAddPlanCategory(index, 3),
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
                      controller: controller.pageController[3],
                      itemCount: 3,
                      onPageChanged: (index) {
                        controller.currentPage[3] = index;
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
                                                controller:
                                                    amountPlanController,
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
                                                controller: amountController,
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
                                            controller.pageController[3]
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
                                        height: 24,
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
                                                controller.pageController[3]
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
        ),
      ),
      isScrollControlled: true);
}
