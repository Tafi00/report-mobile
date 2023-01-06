import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/authentication.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../login_controller.dart';

ElevatedButton buildLoginBtn(LoginController controller) {
  return ElevatedButton(
    onPressed: () async {
      if (controller.formKey.currentState!.validate() &&
          controller.formAccountKey.currentState!.validate()) {
        controller.formKey.currentState!.save();
        controller.errorMess.value = '';
        controller.formKey.currentState!.validate();
        var dataRequest = await AuthApi().loginRequest(controller.email.value);
        if (dataRequest['code'] == 400) {
          print(dataRequest['message']);
          controller.errorMess.value = dataRequest['message'];
          controller.formKey.currentState!.validate();
        } else if (dataRequest['code'] == 0) {
          Get.toNamed(AppRoutes.otp, arguments: [
            controller.email.value,
            dataRequest['content']['otpId']
          ]);
        }
      }
    },
    style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
    child: const Text(
      'Đăng nhập',
      style: TextStyle(fontSize: 16),
    ),
  );
}
