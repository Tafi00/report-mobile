import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

Widget buildFirstCard() {
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
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: MemoryImage(controller.base64Image),
                        radius: 36,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        controller.dataUser['fullName'] ?? '',
                        style: const TextStyle(
                            color: Color(0xFF3949ab),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        controller.dataUser['position'] ?? "",
                        style: const TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFF6fcf97).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text('ACTIVE',
                        style: TextStyle(
                            color: Color(0xFF219653),
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ))
            ],
          ),
        ),
      ],
    );
  });
}
