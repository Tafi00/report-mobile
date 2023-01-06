import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/project.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';

import '../../../apis/customer.dart';
import '../../../utils/elevated_btn.dart';

void showAddProjectBottomSheet() {
  DetailCustomerController controller = Get.put(DetailCustomerController());
  TextEditingController nameProjectController = TextEditingController();
  TextEditingController investorController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Get.bottomSheet(
    Form(
      key: formKey,
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Thêm dự án',
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
                  height: 14,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Khách hàng',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    SizedBox(
                      width: Get.width * .5,
                      child: Text(
                        controller.dataDetailCustomer['name'] ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tên dự án',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 34),
                      width: Get.width * .5,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy điền tên dự án';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        controller: nameProjectController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Chủ đầu tư',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    SizedBox(
                      height: 34,
                      width: Get.width * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: investorController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Loại hình dự án',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    SizedBox(
                      height: 34,
                      width: Get.width * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: propertyController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vị trí',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    SizedBox(
                      height: 34,
                      width: Get.width * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: locationController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ghi chú',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    SizedBox(
                      height: 34,
                      width: Get.width * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: descriptionController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Color(0xFF828282)))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                                await ProjectApi().createProjectRequest({
                              "name": nameProjectController.text,
                              "customerId":
                                  controller.dataDetailCustomer['customerId'],
                              "investor": investorController.text,
                              "location": locationController.text,
                              "property": propertyController.text,
                              "description": descriptionController.text,
                            });
                            if (dataRequest['code'] == 0 ||
                                dataRequest['code'] == 201) {
                              controller.fetchListPagingProject();
                              Get.back();
                              Get.snackbar(
                                'Thành công',
                                'Dự án đã được thêm',
                                showProgressIndicator: true,
                              );
                            } else {
                              Get.snackbar('Thất bại', 'Đã có lỗi xảy ra',
                                  showProgressIndicator: true);
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
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
