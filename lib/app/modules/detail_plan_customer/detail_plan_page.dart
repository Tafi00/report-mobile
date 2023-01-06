import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/fifth_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/first_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/forth_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/multi_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/search_field_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/second_card.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/sum_timeline_chart.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/date_dialog.dart';
import 'package:report_azvidi/app/utils/loading_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../apis/user.dart';
import '../main/main_controller.dart';
import 'components/third_card.dart';

class DetailPlanPage extends StatefulWidget {
  const DetailPlanPage({Key? key}) : super(key: key);

  @override
  State<DetailPlanPage> createState() => _DetailPlanPageState();
}

class _DetailPlanPageState extends State<DetailPlanPage> {
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPlanController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
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
            elevation: 1,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${controller.dataDetailPlanInfo['projectName'] ?? ''} - ${controller.dataDetailPlanInfo['name'] ?? ''}',
                  style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.dataDetailPlanInfo['startDate'] ?? '2000-01-01T00:00:00'))} - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.dataDetailPlanInfo['endDate'] ?? '2000-01-01T00:00:00'))}',
                  style: const TextStyle(
                      color: Color(0xFF828282), fontSize: 12, height: 1.2),
                ),
              ],
            ),
            actions: [
              Obx(() {
                return CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 4.0,
                  percent: controller.avgPercent.value > 1
                      ? 1
                      : controller.avgPercent.value,
                  center: Text(
                    '${(controller.avgPercent.value * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                        color: controller.percentColor,
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                  progressColor: controller.percentColor,
                  backgroundColor: controller.percentColor.withOpacity(0.4),
                );
              }),
              const SizedBox(
                width: 6,
              )
            ],
          ),
          body: Obx(() {
            return Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    await UserApi().clearCache();
                    controller.refreshData();
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: buildFirstCard(),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDateDialog((PickerDateRange p0) async {
                              final startDate = p0.startDate;
                              final endDate = p0.endDate ??
                                  DateTime(p0.startDate!.year,
                                      p0.startDate!.month + 1, 0);
                              controller.startDatePicker.value =
                                  DateFormat('dd/MM/yyyy').format(startDate!);
                              controller.endDatePicker.value =
                                  DateFormat('dd/MM/yyyy').format(endDate);
                              controller.toggleChangeRange();
                              Get.back();
                            }, controller.startDatePicker.value,
                                controller.endDatePicker.value);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Từ ',
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xFF4F4F4F)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: controller.startDatePicker.value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF27B21)),
                                  ),
                                  const TextSpan(text: ' đến '),
                                  TextSpan(
                                    text: controller.endDatePicker.value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF27B21)),
                                  ),
                                  const TextSpan(text: ' đã triển khai'),
                                ],
                              ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: buildThirdCard(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: buildForthCard(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: buildFifthCard(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        buildSumTimelineChart(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: buildSearchField(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildMultiPlanGroupCard(),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
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
            );
          }),
        );
      },
    );
  }
}
