import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/drop_down_project.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';
import 'package:report_azvidi/app/utils/date_dialog.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../add_project_bottomsheet.dart';

Future<void> showEditScheduleBottomSheet(String planId) async {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController projectIdController = TextEditingController();
  TextEditingController contractIdController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController targetController = TextEditingController();

  DetailCustomerController controller = Get.put(DetailCustomerController());
  controller.dropdownProjectValue.value = '';
  await CustomerApi().getPlanInfoApiRequest(planId).then((value) => {
        controller.dropdownProjectValue.value = value['content']['projectName'],
        controller.startDateSchedule.value = DateFormat('dd/MM/yyyy')
            .format(DateTime.parse(value['content']['startDate'])),
        controller.endDateSchedule.value = DateFormat('dd/MM/yyyy')
            .format(DateTime.parse(value['content']['endDate'])),
        nameController.text = value['content']['name'],
        contractIdController.text = value['content']['contractId'],
        feeController.text = value['content']['fee'].toStringAsFixed(0),
        objectiveController.text = value['content']['objective'],
        targetController.text = value['content']['target'],
      });

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
                      'Sửa phụ lục',
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
                      'Dự án *',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    SizedBox(
                      width: Get.width * 0.55,
                      child: Row(
                        children: [
                          buildDropDownProject(),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              showAddProjectBottomSheet();
                            },
                            child: const Icon(
                              Icons.add_circle_outline,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      'Phụ lục *',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phụ lục không được để trống';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        controller: nameController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
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
                      'Số hợp đồng',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: contractIdController,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
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
                Obx(() {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Timeline triển khai',
                        style:
                            TextStyle(color: Color(0xFF828282), fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDateDialog((PickerDateRange p0) async {
                            final startDate = p0.startDate;
                            final endDate = p0.endDate ?? p0.startDate;
                            controller.startDateSchedule.value =
                                DateFormat('dd/MM/yyyy').format(startDate!);
                            controller.endDateSchedule.value =
                                DateFormat('dd/MM/yyyy').format(endDate!);
                            Get.back();
                          }, controller.startDateSchedule.value,
                              controller.endDateSchedule.value);
                        },
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 30),
                          width: Get.width * 0.55,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF828282)),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${controller.startDateSchedule.value} - ${controller.endDateSchedule.value}',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.calendar_month,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Phí dịch vụ (%)',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 30),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: feeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (!(RegExp(
                                  r"\b(?<!\.)(?!0+(?:\.0+)?%)(?:\d|[1-9]\d|100)(?:(?<!100)\.\d+)?")
                              .hasMatch(value!))) {
                            return 'Giá trị không hợp lệ';
                          }
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
                // const SizedBox(
                //   height: 12,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       'Liên kết CRM',
                //       style:
                //           TextStyle(color: Color(0xFF828282), fontSize: 14),
                //     ),
                //     Container(
                //       constraints: const BoxConstraints(minHeight: 30),
                //       width: Get.width * 0.55,
                //       child: TextFormField(
                //         controller: azCrmProjectNameController,
                //         keyboardType: TextInputType.emailAddress,
                //         validator: (value) {},
                //         decoration: InputDecoration(
                //             isDense: true,
                //             contentPadding: const EdgeInsets.symmetric(
                //                 horizontal: 13, vertical: 7),
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(6),
                //                 borderSide: const BorderSide(
                //                     color: Color(0xFF828282)))),
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mục tiêu',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: targetController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
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
                      'Đối tượng',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      width: Get.width * 0.55,
                      child: TextFormField(
                        controller: objectiveController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 6),
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
                            final startDate = DateFormat('yyyy-MM-dd').format(
                                DateFormat('dd/MM/yyyy')
                                    .parse(controller.startDateSchedule.value));
                            final endDate = DateFormat('yyyy-MM-dd').format(
                                DateFormat('dd/MM/yyyy')
                                    .parse(controller.endDateSchedule.value));

                            final dataRequest =
                                await CustomerApi().createScheduleRequest({
                              "name": nameController.text,
                              "projectId": controller.listPagingProjectId[
                                  controller.listPagingProjectString.indexOf(
                                      controller.dropdownProjectValue.value)],
                              "contractId": contractIdController.text,
                              "startDate": startDate,
                              "endDate": endDate,
                              "fee": feeController.text,
                              "objective": objectiveController.text,
                              "target": targetController.text,
                            });
                            Get.back();
                            if (dataRequest['code'] == 201) {
                              AwesomeDialog(
                                context: Get.context!,
                                animType: AnimType.leftSlide,
                                headerAnimationLoop: false,
                                dialogType: DialogType.success,
                                showCloseIcon: true,
                                title: 'Thành công',
                                desc: 'Thêm phụ lục thành công',
                                btnOkOnPress: () {
                                  debugPrint('OnClcik');
                                },
                                btnOkIcon: Icons.check_circle,
                                onDismissCallback: (type) {
                                  debugPrint(
                                      'Dialog Dissmiss from callback $type');
                                },
                              ).show();
                              controller.refreshData();
                            } else {
                              AwesomeDialog(
                                context: Get.context!,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                headerAnimationLoop: false,
                                title: 'Lỗi',
                                desc: dataRequest['message'],
                                btnOkOnPress: () {},
                                btnOkIcon: Icons.cancel,
                                btnOkColor: Colors.red,
                              ).show();
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
