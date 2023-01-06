import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';

Widget buildUnitDropDown() {
  RateCardsController controller = Get.put(RateCardsController());
  return Obx(() {
    return Container(
      width: Get.width * .39,
      height: 30,
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFF9B9B9B), width: 1)),
      child: DropdownButton<String>(
        value: controller.currentUnitName.value,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String? value) {
          controller.currentUnitName.value = value!;
          controller.update();
        },
        borderRadius: BorderRadius.circular(4),
        isExpanded: true,
        menuMaxHeight: 400,
        underline: Container(),
        items:
            controller.listUnit.map<DropdownMenuItem<String>>((String value) {
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
