import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';

import '../manage_user_controller.dart';

Widget buildRolesDropDown() {
  ManageUserController controller = Get.put(ManageUserController());
  return SizedBox(
    width: Get.width * .55,
    height: 40,
    child: DropdownSearch<String>(
      onChanged: (value) {
        controller.rolesController?.value = value!;
        controller.update();
      },
      autoValidateMode: AutovalidateMode.onUserInteraction,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintText: "Select...",
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
      selectedItem: controller.rolesController?.value,
      popupProps: const PopupProps.menu(
        fit: FlexFit.loose,
        //comment this if you want that the items do not takes all available height
        constraints: BoxConstraints(maxHeight: 300),
      ),
      validator: (item) {
        if (item == null) {
          return "Hãy chọn vai trò";
        } else {
          return null;
        }
      },
      items: controller.listRoles,
    ),
  );
}
