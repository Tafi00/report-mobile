import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';

Widget buildDvtDropDown() {
  DetailPlanController controller = Get.put(DetailPlanController());

  return SizedBox(
    width: Get.width * .52,
    height: 40,
    child: DropdownSearch<String>(
      onChanged: (String? value) {
        controller.currentDvtName.value = value!;
        controller.update();
      },
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintText: "Select...",
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
      popupProps: const PopupProps.menu(
        fit: FlexFit.loose,
        //comment this if you want that the items do not takes all available height
        constraints: BoxConstraints(maxHeight: 300),
      ),
      validator: (String? item) {
        if (item == null) {
          return "Hãy chọn hạng mục và đvt";
        } else {
          return null;
        }
      },
      items: [],
    ),
  );
}
