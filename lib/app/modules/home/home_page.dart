import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/home/components/header.dart';
import 'package:report_azvidi/app/modules/home/components/second_card.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/utils/loading_dialog.dart';

import '../../apis/user.dart';
import 'components/first_card.dart';
import 'components/multi_card_customer/build_customer_list.dart';
import 'components/third_card.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Obx(() {
            return Stack(
              children: [
                SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await UserApi().clearCache();
                      controller.refreshData();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(controller),
                          buildFirstCard(controller),
                          buildSecondCard(controller),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: buildThirdCard(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFAFEFF),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 2),
                                          blurRadius: 8,
                                          spreadRadius: 0,
                                        )
                                      ]),
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(minHeight: 160),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text(
                                            'Khách hàng đang triển khai',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF4F4F4F)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        BuildCustomer(
                                          listPaging:
                                              controller.dataListRunning,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    MainController mainController = Get.find();
                                    mainController.selectedIndex.value = 1;
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF3F5F8),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x0D000000),
                                            offset: Offset(0, 2),
                                            blurRadius: 8,
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Tất cả khách hàng',
                                          style: TextStyle(
                                              color: Color(0xFF4F4F4F),
                                              fontSize: 15),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.isLoading.value)
                  const Center(
                      child: SpinKitCircle(
                    color: Color(0xFF3949AB),
                    duration: Duration(milliseconds: 500),
                  ))
              ],
            );
          })),
    );
  }
}
