import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/customer/components/search_field_card.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../utils/date_dialog.dart';
import 'components/multi_card_customer/build_customer_list.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSearchField(),
                const SizedBox(
                  height: 20,
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

                      controller.fetchListPagingCustomer();
                    }, controller.startDatePicker.value,
                        controller.endDatePicker.value);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
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
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: buildCustomerCard()),
              ],
            ),
          ),
        );
      },
    );
  }
}
