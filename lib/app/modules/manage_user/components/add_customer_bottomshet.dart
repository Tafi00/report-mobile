import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/modules/manage_account/components/gender_dropdown.dart';
import 'package:report_azvidi/app/modules/manage_user/components/roles_dropdown.dart';
import 'package:report_azvidi/app/modules/manage_user/manage_user_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import '../../../utils/constants.dart';

void showAddUserBottomSheet() {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Get.bottomSheet(
    GetBuilder<ManageUserController>(builder: (controller) {
      return Form(
        key: formKey,
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Thêm thành viên',
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      ElevatedBtn(
                        onPressed: () {
                          Get.back();
                        },
                        circular: 50,
                        paddingAllValue: 2,
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFF3949ab),
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Họ và tên',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        width: Get.width * 0.55,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Họ và tên không được để trống';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF828282)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vị trí',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        width: Get.width * 0.55,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vị trí không được để trống';
                            }
                            return null;
                          },
                          controller: positionController,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF828282)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Email',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        width: Get.width * 0.55,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!emailValidatorRegExp.hasMatch(value!)) {
                              return 'Email không hợp lệ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF828282)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Số điện thoại',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        width: Get.width * 0.55,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (!phonenumValidatorRegExp.hasMatch(value!)) {
                              return 'Số điện thoại không hợp lệ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF828282)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vai trò',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF828282)),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        width: Get.width * 0.55,
                        child: buildRolesDropDown(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Giới tính',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF828282)),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        width: Get.width * 0.55,
                        child: buildGenderDropDown(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final newDate = await showDatePicker(
                          context: Get.context!,
                          initialDate: controller.dobController.value != ''
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(controller.dobController.value)
                              : DateTime.now(),
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now());
                      if (newDate == null) {
                        return;
                      }
                      controller.dobController.value =
                          DateFormat('dd/MM/yyyy').format(newDate);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ngày sinh',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF828282)),
                        ),
                        Container(
                          constraints: const BoxConstraints(minHeight: 30),
                          width: Get.width * 0.55,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xFF828282)
                                      .withOpacity(0.8))),
                          child: Obx(() {
                            return Text(
                              controller.dobController.value != ''
                                  ? controller.dobController.value
                                  : 'Chọn ngày ...',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Địa chỉ',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        width: Get.width * 0.55,
                        child: TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF828282)))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Hủy bỏ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              // if (dataRequest['code'] == 0) {
                              //   Get.snackbar(
                              //       'Thành công', 'Thành viên đã được thêm');
                              // } else {
                              //   Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
                              // }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Lưu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }),
    isScrollControlled: true,
  );
}
