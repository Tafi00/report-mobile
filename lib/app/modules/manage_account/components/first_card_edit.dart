import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

Widget buildFirstCardEdit() {
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
                        backgroundImage: MemoryImage(
                            controller.base64ImagePicker != null
                                ? controller.base64ImagePicker!
                                : controller.base64Image),
                        radius: 36,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final XFile? image = await controller.picker
                                .pickImage(source: ImageSource.gallery);
                            controller.base64ImagePicker =
                                await image!.readAsBytes();
                            controller.update();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Update avatar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 12,
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
