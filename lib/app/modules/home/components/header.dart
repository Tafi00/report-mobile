import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';
import 'package:report_azvidi/app/utils/date_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Column buildHeader(HomeController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 18,
      ),
      Container(
        height: 60,
        width: 160,
        decoration: const BoxDecoration(
            color: Color(0xFFFAFEFF),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 13, right: 13),
          child: Image.asset('assets/images/logo_azvd.png'),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 11),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chào buổi sáng\n${controller.userName.value.toUpperCase()}',
                style: const TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.7),
              ),
              const SizedBox(
                height: 28,
              ),
              GestureDetector(
                onTap: () {
                  showDateDialog((PickerDateRange p0) async {
                    final startDate = p0.startDate;
                    final endDate = p0.endDate ??
                        DateTime(
                            p0.startDate!.year, p0.startDate!.month + 1, 0);
                    controller.startDatePicker.value =
                        DateFormat('dd/MM/yyyy').format(startDate!);
                    controller.endDatePicker.value =
                        DateFormat('dd/MM/yyyy').format(endDate);
                    Get.back();
                    print(controller.startDatePicker.value);
                    print(controller.endDatePicker.value);

                    controller.isLoading.value = true;
                    controller.fetchSummaryCount();
                    controller.fetchSummaryDashboard();
                    controller.fetchListPagingCustomer();
                  }, controller.startDatePicker.value,
                      controller.endDatePicker.value);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Từ ',
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
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
                      const TextSpan(text: ' AZVIDI đã triển khai'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
