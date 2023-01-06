import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:report_azvidi/app/apis/authentication.dart';
import 'package:report_azvidi/app/modules/otp/otp_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/constants.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 130, bottom: 60),
                  child: Text(
                    "Xác minh OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 24),
                  ),
                ),
                Text(
                  "Mã OTP đã được gửi đến email của bạn\n${Get.arguments[0]}",
                  textAlign: TextAlign.center,
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          cursorColor: Colors.black,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            errorBorderColor: Colors.black,
                            borderWidth: 1,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: kSecondaryColor,
                            selectedColor: Colors.black,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black,
                            selectedFillColor: kSecondaryColor,
                            inactiveFillColor: kSecondaryColor,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onChanged: (value) async {
                            controller.otpCode.value = value;
                            if (value.length == 6) {
                              var dataRequest = await AuthApi()
                                  .verifyOtpRequest(Get.arguments[1],
                                      controller.otpCode.value);
                              if (dataRequest['code'] == 400) {
                                controller.errorMess.value =
                                    'Mã xác nhận không hợp lệ';
                                controller.formKey.currentState!.validate();
                              } else if (dataRequest['code'] == 0) {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString('userData',
                                    jsonEncode(dataRequest['metadata']));
                                Get.offAllNamed(AppRoutes.main);
                              }
                            }
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                          appContext: context,
                        ),
                        controller.errorMess.value != ''
                            ? Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Error.svg",
                                    height: 14,
                                    width: 14,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.errorMess.value,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
