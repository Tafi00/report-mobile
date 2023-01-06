import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report_azvidi/app/apis/authentication.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../../apis/user.dart';

class ManageAccountController extends GetxController {
  RxMap dataUser = {}.obs;
  RxBool isEditUser = false.obs;
  Uint8List base64Image = base64Decode(avatarBase64);
  Uint8List? base64ImagePicker;
  final ImagePicker picker = ImagePicker();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  RxString genderController = ''.obs;
  final dobController = ''.obs;

  TextEditingController addressController = TextEditingController();
  @override
  void onInit() {
    UserApi().getUserInfo().then((value) => {
          dataUser.value = value,
          fullNameController.text = value['fullName'] ?? '',
          positionController.text = value['position'] ?? "",
          phoneController.text = value['phone'] ?? "",
          genderController.value = value['gender'] == 1
              ? 'Nam'
              : value['gender'] == 0
                  ? 'Nữ'
                  : 'Khác'
        });
    super.onInit();
  }
}
