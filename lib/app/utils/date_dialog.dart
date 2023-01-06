import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void showDateDialog(Function submit, String startDate, String endDate) {
  Get.dialog(
      name: 'RangeDatePicker Dialog',
      Padding(
        padding: EdgeInsets.only(
            top: Get.height * .25,
            bottom: Get.height * .18,
            left: 15,
            right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: SfDateRangePicker(
            confirmText: "OK",
            cancelText: "Hủy",
            backgroundColor: Colors.white,
            onSubmit: (p0) {
              submit(p0);
            },
            onCancel: () {
              Get.back();
            },
            view: DateRangePickerView.year,
            showActionButtons: true,
            selectionMode: DateRangePickerSelectionMode.range,
            allowViewNavigation: false,
            initialSelectedRange: PickerDateRange(
              DateFormat('dd/MM/yyyy').parse(startDate),
              DateFormat('dd/MM/yyyy').parse(endDate),
            ),
          ),
        ),
      ));
}
