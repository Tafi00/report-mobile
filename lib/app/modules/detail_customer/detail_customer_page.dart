import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/forth_card.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/multi_card_data_customer/build_data_customer_list.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/second_card.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/third_card.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/utils/date_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../apis/user.dart';
import 'components/first_card.dart';
import 'detail_customer_controller.dart';

class DetailCustomerPage extends StatefulWidget {
  const DetailCustomerPage({super.key});

  @override
  State<DetailCustomerPage> createState() => _DetailCustomerPageState();
}

class _DetailCustomerPageState extends State<DetailCustomerPage> {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailCustomerController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color(0xFFF3F5F8),
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF4F4F4F),
                    size: 30,
                  ),
                ),
                elevation: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.dataDetailCustomer['name'] ?? '',
                      style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.dataDetailCustomer['company'] ?? '',
                      style: const TextStyle(
                          color: Color(0xFF828282), fontSize: 12, height: 1.2),
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      await UserApi().clearCache();
                      controller.startDatePicker.value = '01/01/2022';
                      controller.endDatePicker.value =
                          DateFormat('dd/MM/yyyy').format(DateTime.now());
                      controller.refreshData();
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildFirstCard(),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDateDialog((PickerDateRange p0) async {
                                  final startDate = p0.startDate;
                                  final endDate = p0.endDate ??
                                      DateTime(p0.startDate!.year,
                                          p0.startDate!.month + 1, 0);
                                  controller.startDatePicker.value =
                                      DateFormat('dd/MM/yyyy')
                                          .format(startDate!);
                                  controller.endDatePicker.value =
                                      DateFormat('dd/MM/yyyy').format(endDate);
                                  Get.back();
                                  controller.isLoading.value = true;
                                  controller.fetchSummaryCount();
                                  controller.fetchListPlanReport();
                                  controller.fetchDetailCustomer(
                                      controller.idCustomer.value);
                                  controller.fetchSummaryDashboardCustomer();
                                }, controller.startDatePicker.value,
                                    controller.endDatePicker.value);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Từ ',
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xFF4F4F4F)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: controller.startDatePicker.value
                                          .replaceRange(0, 3, ''),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF27B21)),
                                    ),
                                    const TextSpan(text: ' đến '),
                                    TextSpan(
                                      text: controller.endDatePicker.value
                                          .replaceRange(0, 3, ''),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF27B21)),
                                    ),
                                    const TextSpan(
                                        text: ' AZVIDI đã triển khai'),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildSecondCard(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildThirdCard(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildForthCard(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildDataCustomer(controller
                                .listDataPlanReport.reversed
                                .toList()),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    return Positioned(
                      bottom: 10,
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
                  }),
                  if (controller.isLoading.value)
                    const Center(
                        child: SpinKitCircle(
                      color: Color(0xFF3949AB),
                      duration: Duration(milliseconds: 500),
                    ))
                ],
              ),
            ));
  }
}
