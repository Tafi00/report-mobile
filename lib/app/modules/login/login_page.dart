import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/email_field.dart';
import 'components/login_btn.dart';
import 'components/pass_field.dart';
import 'components/welcome_text.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Obx(
                    () => Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          buildWelcomeText(),
                          Form(
                              key: controller.formAccountKey,
                              child: buildPhoneTextFormField(controller)),
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
                          const SizedBox(height: 20),
                          buildLoginBtn(controller),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
