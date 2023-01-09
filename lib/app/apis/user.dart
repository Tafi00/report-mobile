import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../modules/main/main_controller.dart';
import '../utils/constants.dart';

class UserApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  MainController mainController = Get.put(MainController());

  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getUserInfo() async {
    try {
      final accessToken = await getAccessToken();
      final response =
          await dio.get('/api/v1/user/profile', options: ops(accessToken));
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
    return null;
  }

  Future clearCache() async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get(clearCacheApi, options: ops(accessToken));
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

  Future getListUserRequest() async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get(
          'https://reportapi.azvidi.vn/api/v1/user/getlistpaging?limit=100&offset=0&sort=%5B%7B%22Column%22%3A%22FullName%22%2C%22Dir%22%3A%22ASC%22%7D%5D',
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

  Future getRolesRequest() async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get(
          'https://reportapi.azvidi.vn/api/v1/setup/role/getlistpaging',
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
}
