import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';
import 'package:report_azvidi/app/utils/date_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Column buildHeader() {
  HomeController controller = Get.put(HomeController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 18,
      ),
      Container(
        height: 60,
        width: 160,
        decoration: const BoxDecoration(
            color: Color(0xFFFAFEFF),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 13, right: 13),
          child: Image.asset('assets/images/logo_azvd.png'),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 11),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Xin chào,',
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.userName.value.toUpperCase(),
                    style: const TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
