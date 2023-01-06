import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../modules/main/main_controller.dart';

class NotifyApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  MainController mainController = Get.put(MainController());
  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getListNotifyRequest() async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get(getListNotify, options: ops(accessToken));
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
