import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/authentication.dart';

import '../../apis/user.dart';

class ManageUserController extends GetxController {
  RxList listUserData = [].obs;
  final listRoles = <String>[].obs;
  final listRolesRaw = [].obs;
  RxString? genderController;
  RxString? rolesController;
  final dobController = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchListUser();
    fetchListRoles();
    super.onInit();
  }

  Future fetchListUser() async {
    final dataRequest = await UserApi().getListUserRequest();
    listUserData.value = dataRequest['data'];
    update();
  }

  Future fetchListRoles() async {
    listRolesRaw.value = (await UserApi().getRolesRequest())['content'];
    for (var x in listRolesRaw) {
      listRoles.add(x['name']);
    }
    update();
  }
}
