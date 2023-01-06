import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';

const List<String> list = <String>[
  'Tất cả',
  'Đang chạy',
  'Hoàn thành',
  'Tạm dừng',
  'Báo giá'
];

Widget buildDropDownFilter() {
  CustomerController controller = Get.put(CustomerController());
  return Obx(() {
    return Container(
      width: 100,
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFD0D0D0))),
      child: DropdownButton<String>(
        value: controller.dropdownValue.value,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String? value) {
          controller.dropdownValue.value = value!;
          controller.update();
        },
        isExpanded: true,
        underline: Container(),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 12),
            ),
          );
        }).toList(),
      ),
    );
  });
}
