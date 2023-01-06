import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/manage_account/components/first_card.dart';
import 'package:report_azvidi/app/modules/manage_account/components/first_card_edit.dart';
import 'package:report_azvidi/app/modules/manage_account/components/second_card.dart';
import 'package:report_azvidi/app/modules/manage_account/manage_account_controller.dart';

import 'components/second_card_edit.dart';

class ManageAccountPage extends StatelessWidget {
  const ManageAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageAccountController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF4F4F4F),
                  size: 30,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Quản lý tài khoản',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      controller.isEditUser.value
                          ? buildFirstCardEdit()
                          : buildFirstCard(),
                      const SizedBox(
                        height: 18,
                      ),
                      controller.isEditUser.value
                          ? buildSecondCardEdit()
                          : buildSecondCard()
                    ],
                  ),
                );
              }),
            ));
      },
    );
  }
}
