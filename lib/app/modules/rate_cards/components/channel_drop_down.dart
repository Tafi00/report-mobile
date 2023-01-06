import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';

Widget buildChannelDropDown() {
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
        value: controller.currentChannelName.value,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String? value) {
          controller.currentChannelName.value = value!;
          controller.update();
        },
        borderRadius: BorderRadius.circular(4),
        menuMaxHeight: 400,
        isExpanded: true,
        underline: Container(),
        items: controller.listChannel
            .map<DropdownMenuItem<String>>((String value) {
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
