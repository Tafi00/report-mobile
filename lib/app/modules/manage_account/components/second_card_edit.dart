import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';

import 'gender_dropdown.dart';

Widget buildSecondCardEdit() {
  ManageAccountController controller = Get.put(ManageAccountController());

  return Obx(() {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: Color(0xFFFAFEFF),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thông tin',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Họ và tên',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    width: Get.width * 0.55,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Trường này không được để trống';
                        }
                        return null;
                      },
                      controller: controller.fullNameController,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: Color(0xFF828282)))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vị trí',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    width: Get.width * 0.55,
                    child: TextFormField(
                      controller: controller.positionController,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: Color(0xFF828282)))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Điện thoại',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    width: Get.width * 0.55,
                    child: TextFormField(
                      controller: controller.phoneController,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: Color(0xFF828282)))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vai trò',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    width: Get.width * 0.55,
                    child: TextFormField(
                      controller: controller.rolesController,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  const BorderSide(color: Color(0xFF828282)))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
                      style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: const Color(0xFF828282).withOpacity(0.8))),
                      child: Text(
                        controller.dobController.value != ''
                            ? controller.dobController.value
                            : 'Chọn ngày ...',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Giới tính',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    width: Get.width * 0.55,
                    child: buildGenderDropDown(),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.isEditUser.value = false;
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: const Color(0xFF3949ab)),
                      child: const Text(
                        'Hủy bỏ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: const Color(0xFF3949ab)),
                      child: const Text(
                        'Hoàn tất',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  });
}
