import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../modules/main/main_controller.dart';

class KpiApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  MainController mainController = Get.put(MainController());
  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getCategoryKpiRequest() async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get('$getCategoryKpiApi?limit=200&offset=0',
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

  Future getDetailWithTimelineKpiRequest(id) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.get('$getDetailWithTimelineKpiApi$id',
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

  Future getKpiTimeLineRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));

      final response = await dio.get(
          '$getDetailWithTimeLine$id?endDate=$endDate&limit=100&offset=0&startDate=$startDate',
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

  Future createCategoryKpiRequest(Map param) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.patch(createCategoryKpiApi,
          options: ops(accessToken), data: jsonEncode(param));
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

  Future updateCategoryKpiRequest(id, Map param) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.patch('$updateCategoryKpiApi$id',
          options: ops(accessToken), data: jsonEncode(param));
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
