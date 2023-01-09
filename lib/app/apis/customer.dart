import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

class CustomerApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  MainController mainController = Get.put(MainController());
  Options ops(accessToken) {
    return Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
      "View": mainController.roleView.value
    });
  }

  Future getDetailCustomerRequest(String id) async {
    try {
      final accessToken = await getAccessToken();
      final response =
          await dio.get('$getDetailCustomer$id', options: ops(accessToken));
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

  Future createCustomerRequest(Map params) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.post(
        createCustomerApi,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        }),
        data: jsonEncode(params),
      );
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

  Future updateCustomerRequest(Map params, id) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.patch(
        '$updateCustomerApi$id',
        options: ops(accessToken),
        data: jsonEncode(params),
      );
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

  Future deleteCustomerRequest(id) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.delete(
        '$deleteCustomerApi$id',
        options: ops(accessToken),
      );
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

  Future createScheduleRequest(Map params) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.post(createPlanApi,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken"
          }),
          data: jsonEncode(params));
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

  Future updateScheduleRequest(Map params, id) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.patch('$updatePlanApi$id',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken"
          }),
          data: jsonEncode(params));
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

  Future deleteScheduleRequest(id) async {
    try {
      final accessToken = await getAccessToken();
      final response = await dio.delete(
        '$deletePlanApi$id',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        }),
      );
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

  Future getKpiReportApiRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$getKpiReportApi?planId=$id&endDate=$endDate&limit=100&offset=0&startDate=$startDate',
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

  Future getPlanReportApiRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$getSummaryPlan?planId=$id&endDate=$endDate&limit=200&offset=0&startDate=$startDate',
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

  Future getPlanInfoApiRequest(String id) async {
    try {
      final accessToken = await getAccessToken();

      final response = await dio.get('$getDetailPlanInfoApi$id?type=All',
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

  Future getListPlanReportCustomerApiRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$getPlanReportApi?customerId=$id&endDate=$endDate&limit=100&offset=0&startDate=$startDate',
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

  Future getSummaryCountCustomerRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$summaryCountCustomerApi?customerId=$id&endDate=$endDate&limit=100&offset=0&searchText=&startDate=$startDate',
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

  Future getSummaryCountRequest(String startDate, String endDate) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$summaryCountCustomerApi?endDate=$endDate&limit=100&offset=0&searchText=&startDate=$startDate',
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

  Future getSummaryDashboardCustomerRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$summaryBudgetAndCostCustomerApi?customerId=$id&endDate=$endDate&limit=100&offset=0&searchText=&startDate=$startDate',
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

  Future getSummaryDashboardCustomerPlanRequest(
      String startDate, String endDate, String id) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$summaryBudgetAndCostCustomerApi?planId=$id&endDate=$endDate&limit=100&offset=0&searchText=&startDate=$startDate',
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

  Future getSummaryDashboardRequest(String startDate, String endDate) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));
      final response = await dio.get(
          '$summaryBudgetAndCostCustomerApi?customerId=&endDate=$endDate&limit=15&offset=0&searchText=&startDate=$startDate',
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

  Future getListPagingMarketingCustomerRequest(
      String startDate, String endDate) async {
    try {
      final accessToken = await getAccessToken();
      startDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(startDate));
      endDate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(endDate));

      final response = await dio.get(
          '$getCustomerReportApi?customerId=&endDate=$endDate&limit=15&offset=0&searchText=&startDate=$startDate',
          options: ops(accessToken));
      print(
          '$getCustomerReportApi?customerId=&endDate=$endDate&limit=15&offset=0&searchText=&startDate=$startDate');
      print({
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        "View": mainController.roleView.value
      });
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
