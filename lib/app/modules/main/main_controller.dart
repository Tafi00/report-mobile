import 'dart:convert';

import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/authentication.dart';
import '../../apis/local_auth_api.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;
  final roleView = ''.obs;
  final positive = false.obs;
  final isShowSwitch = true.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    final isAuthenticated = await LocalAuthApi.authenticate();
    print(isAuthenticated);
    final prefs = await SharedPreferences.getInstance();
    UserApi().getUserInfo().then((value) {
      if (value is! String) {
        List? listRoleView = value?['roleView'];
        if (listRoleView?.length == 1) {
          roleView.value = listRoleView?[0];
          positive.value = roleView.value == 'BAORA' ? true : false;
          isShowSwitch.value = false;
        } else if (prefs.getString('roleView') == null) {
          roleView.value = listRoleView?[0];
          positive.value = roleView.value == 'BAORA' ? true : false;
          prefs.setString('roleView', roleView.value);
        } else {
          roleView.value = prefs.getString('roleView')!;
          positive.value = roleView.value == 'BAORA' ? true : false;
        }
      }
    });
  }

  void onTapped(int index) {
    selectedIndex.value = index;
  }
}
