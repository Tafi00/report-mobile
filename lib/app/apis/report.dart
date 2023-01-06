import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../modules/main/main_controller.dart';
import '../utils/constants.dart';

class ReportApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  MainController mainController = Get.put(MainController());
  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getReportTimelineMonthRequest(String startDate, String endDate) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$getTimeLineByMonth?endDate=$endDate&limit=200&offset=0&startDate=$startDate',
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

  Future getReportTimelineRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$getReportTimeLine$id?endDate=$endDate&limit=200&offset=0&startDate=$startDate',
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
