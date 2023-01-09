import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/multi_card_data_customer/edit_schedule_bottomshet.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';

import '../../../../apis/customer.dart';

void showModelBottomSheet(dataItem) {
  DetailCustomerController controller = Get.put(DetailCustomerController());
  print(dataItem);
  Get.bottomSheet(Container(
    constraints: const BoxConstraints(minHeight: 90),
    padding: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: SizedBox(
      height: 180,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          GestureDetector(
            onTap: () {
              showEditScheduleBottomSheet(dataItem['planId']);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 14),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                SizedBox(width: 14),
                Text(
                  "Sửa",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            color: const Color(0xFFC9D6DF),
            height: 1,
            width: double.infinity,
          ),
          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              AwesomeDialog(
                context: Get.context!,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.topSlide,
                closeIcon: const Icon(Icons.close_fullscreen_outlined),
                title: 'Warning',
                desc: 'Bạn có chắc sẽ xóa ${dataItem['planName']} ?',
                btnCancelOnPress: () {},
                onDismissCallback: (type) {
                  debugPrint('Dialog Dismiss from callback $type');
                },
                btnOkOnPress: () async {
                  final dataRequest = await CustomerApi()
                      .deleteScheduleRequest(dataItem['planId']);
                  Get.back();
                  if (dataRequest['code'] == 0) {
                    AwesomeDialog(
                      context: Get.context!,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: true,
                      title: 'Thành công',
                      desc: 'Phụ lục ${dataItem['planName']} đã bị xóa',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
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
                },
              ).show();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 14),
                Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 14),
                Text(
                  "Xóa",
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}
