import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpCode = ''.obs;
  final errorMess = ''.obs;
  RxBool isLoading = false.obs;
}
