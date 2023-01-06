import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../modules/main/main_controller.dart';

class ProjectApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  MainController mainController = Get.put(MainController());
  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getListPagingProjectRequest(String id) async {
    try {
      final accessToken = await getAccessToken();

      final response = await dio.get('$getListPagingProjectApi?CustomerId=$id',
          options: ops(accessToken));
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

  Future createProjectRequest(Map param) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.post(createProjectApi,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $accessToken"
            },
          ),
          data: jsonEncode(param));
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
