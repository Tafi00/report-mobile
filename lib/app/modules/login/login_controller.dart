import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/models/profit_model.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formAccountKey = GlobalKey<FormState>();
  final formPassKey = GlobalKey<FormState>();
  final email = ''.obs;
  final pass = ''.obs;
  final errorMess = ''.obs;

  RxBool obscureText = true.obs;

  void toggle() {
    obscureText.value = !obscureText.value;
  }
}
