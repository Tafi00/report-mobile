import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';

Widget buildSecondCard() {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: Text(
                      controller.dataUser['email'] ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Điện thoại',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: Text(
                      (controller.dataUser['phone'] ?? ""),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vai trò',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: const Text(
                      "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ngày sinh',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: Text(
                      (controller.dataUser['birthDay'] ?? "").toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Giới tính',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: Text(
                      controller.dataUser['gender'] == 1
                          ? 'Nam'
                          : controller.dataUser['gender'] == 0
                              ? 'Nữ'
                              : "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Địa chỉ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                  SizedBox(
                    width: Get.width * .60,
                    child: Text(
                      controller.dataUser['address'] ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                        controller.isEditUser.value = true;
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: const Color(0xFF3949ab)),
                      child: const Text(
                        'Chỉnh sửa',
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
