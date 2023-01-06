import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

import '../../../utils/constants.dart';

void showAddCustomerBottomSheet() {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CustomerController controller = Get.put(CustomerController());
  Get.bottomSheet(
    Form(
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
                      'Thêm khách hàng',
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
                      'Tên khách hàng',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tên khách hàng không được để trống';
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
                      'Tên công ty',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tên công ty không được để trống';
                          }
                          return null;
                        },
                        controller: companyController,
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
                      'Ảnh đại diện',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: Obx(() {
                        return Row(
                          children: [
                            if (controller.base64Image.value != '')
                              Row(
                                children: [
                                  Image.memory(
                                    base64Decode(controller.base64Image.value),
                                    height: 50,
                                    width: 50,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            OutlinedButton(
                                onPressed: () async {
                                  final XFile? image = await controller.picker
                                      .pickImage(source: ImageSource.gallery);
                                  controller.base64Image.value =
                                      base64Encode(await image!.readAsBytes());
                                  controller.update();
                                },
                                child: const Text(
                                  'Chọn',
                                  style: TextStyle(
                                      color: Color(0xFF3949ab), fontSize: 14),
                                )),
                          ],
                        );
                      }),
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
                      'Người liên hệ',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: contactNameController,
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
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
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
                      'Email',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                      'Địa chỉ công ty',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
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
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ghi chú',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
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
                            final dataRequest =
                                await CustomerApi().createCustomerRequest({
                              "name": nameController.text,
                              "company": companyController.text,
                              "phone": phoneController.text,
                              "email": emailController.text,
                              "contactName": contactNameController.text,
                              "address": addressController.text,
                              "description": descriptionController.text,
                              "avatar": controller.base64Image.value
                            });
                            Get.back();
                            if (dataRequest['code'] == 0) {
                              Get.snackbar(
                                  'Thành công', 'Khách hàng đã được thêm');
                            } else {
                              Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: const Color(0xFF3949ab)),
                        child: const Text(
                          'Hoàn tất',
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
    ),
    isScrollControlled: true,
  );
}
