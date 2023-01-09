import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/add_project_bottomsheet.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';

Widget buildDropDownProject() {
  DetailCustomerController controller = Get.put(DetailCustomerController());
  return SizedBox(
    width: Get.width * 0.42,
    child: DropdownSearch<String>(
      onChanged: (String? value) {
        controller.dropdownProjectValue.value = value!;
      },
      autoValidateMode: AutovalidateMode.onUserInteraction,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintText: "Select...",
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
      popupProps: const PopupProps.menu(
        fit: FlexFit.loose,

        //comment this if you want that the items do not takes all available height
        constraints: BoxConstraints.tightFor(),
      ),
      selectedItem: controller.dropdownProjectValue.value == ''
          ? null
          : controller.dropdownProjectValue.value,
      validator: (String? item) {
        if (item == null) {
          return "Hãy chọn dự án";
        } else {
          return null;
        }
      },
      items: controller.listPagingProjectString,
    ),
  );
}
