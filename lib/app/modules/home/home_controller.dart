import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/models/marketing_customer_model.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/routes/app_routes.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/loading_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../apis/customer.dart';
import '../../apis/report.dart';
import '../../models/chart_model.dart';
import '../main/main_controller.dart';

class HomeController extends GetxController {
  final userName = ''.obs;
  final startDatePicker = '01/01/2023'.obs;
  final endDatePicker = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final PageController pageController = PageController(initialPage: 0);
  final currentPage = 0.obs;
  RxList<ProfitModel> chartPlanData = <ProfitModel>[].obs;
  RxList<ProfitModel> chartData = <ProfitModel>[].obs;
  late TooltipBehavior tooltipBehavior;
  RxList<MarketingCustomerModel> dataListPagingCustomer =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListRunning =
      <MarketingCustomerModel>[].obs;

  RxMap dataSummaryDashboard = {}.obs;
  RxMap dataSummaryCount = {}.obs;
  RxList listTimelineMonth = [].obs;
  final isLoading = false.obs;
  MainController mainController = Get.put(MainController());

  @override
  void onInit() async {
    super.onInit();
    dataSummaryDashboard.listen((p0) {
      chartPlanData.value = getChartPlanData();
      chartData.value = getChartData();
      fetchListTimelineMonth();
    });

    tooltipBehavior = TooltipBehavior(
        enable: true,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return Wrap(
            children: [
              Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Text('${point.x}',
                          style: const TextStyle(color: Colors.white)),
                      Text(
                        addComma(point.y.toString()),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          );
        });
    mainController.roleView.listen((p0) {
      refreshData();
    });
  }

  void refreshData() {
    isLoading.value = true;
    fetchSummaryDashboard();
    fetchListPagingCustomer();
    getUserName();
    fetchSummaryCount();
    fetchListTimelineMonth();
  }

  List<ChartModel> getListChartModel(int index) {
    List<ChartModel> listChartModel = [];
    List<ChartModel> listPlanChartModel = [];

    if (index == 1) {
      for (var x in listTimelineMonth) {
        listChartModel.add(ChartModel(x['date'], x['totalAmount'] ?? 0));
      }
      return listChartModel;
    } else {
      for (var x in listTimelineMonth) {
        listPlanChartModel
            .add(ChartModel(x['date'], x['totalAmountPlan'] ?? 0));
      }
      return listPlanChartModel;
    }
  }

  Future fetchSummaryCount() async {
    try {
      dataSummaryCount.clear();
      final dataSummaryCountRequest = await CustomerApi()
          .getSummaryCountRequest(startDatePicker.value, endDatePicker.value);
      if (dataSummaryCountRequest?['code'] == 0) {
        dataSummaryCount.value = dataSummaryCountRequest['content'];
        isLoading.value = false;
      } else {
        Get.snackbar('Lỗi', dataSummaryCountRequest['message']);

        isLoading.value = false;
      }
      update();
    } catch (err) {
      print(err);
    }
  }

  Future fetchListTimelineMonth() async {
    try {
      listTimelineMonth.clear();
      final listTimelineMonthRequest = await ReportApi()
          .getReportTimelineMonthRequest(
              startDatePicker.value, endDatePicker.value);
      if (listTimelineMonthRequest?['code'] == 0) {
        listTimelineMonth.value = listTimelineMonthRequest['content'];
        isLoading.value = false;
      } else {
        Get.snackbar('Lỗi', listTimelineMonthRequest['message']);

        isLoading.value = false;
      }
      update();
    } catch (err) {
      print(err);
    }
  }

  Future fetchSummaryDashboard() async {
    try {
      dataSummaryDashboard.clear();
      final dataSummaryDashboardRequest = await CustomerApi()
          .getSummaryDashboardRequest(
              startDatePicker.value, endDatePicker.value);
      if (dataSummaryDashboardRequest?['code'] == 0) {
        dataSummaryDashboard.value = dataSummaryDashboardRequest['content'];
        isLoading.value = false;
      } else {
        Get.snackbar('Lỗi', dataSummaryDashboardRequest['message']);

        isLoading.value = false;
      }
      update();
    } catch (err) {
      isLoading.value = false;
      MainController controller = Get.put(MainController());
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      controller.selectedIndex.value = 0;
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future fetchListPagingCustomer() async {
    try {
      dataListPagingCustomer.clear();
      dataListRunning.clear();

      final dataCustomerRequest = (await CustomerApi()
          .getListPagingMarketingCustomerRequest(
              startDatePicker.value, endDatePicker.value));
      if (dataCustomerRequest?['code'] == 0) {
        List<dynamic> dataCustomer = [];
        dataCustomer = dataCustomerRequest['content'];
        dataListPagingCustomer.addAll(dataCustomer
            .map((e) => MarketingCustomerModel.fromJson(e))
            .toList());

        for (var x in dataListPagingCustomer) {
          if (x.active == 1) {
            dataListRunning.add(x);
          }
        }

        dataListPagingCustomer.clear();
        dataListPagingCustomer.addAll(dataListRunning);
      } else {
        Get.snackbar('Lỗi', dataCustomerRequest['message']);
      }
      update();
    } catch (err) {
      print(err);
    }
  }

  List<ProfitModel> getChartPlanData() {
    final profit = (dataSummaryDashboard['grossProfitPlan'] ?? 0);
    final cap = dataSummaryDashboard['capitalAmountPlan'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(0)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(0)}%'),
    ];
    return chartData;
  }

  List<ProfitModel> getChartData() {
    final profit = (dataSummaryDashboard['grossProfit'] ?? 0);
    final cap = dataSummaryDashboard['capitalAmount'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(0)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(0)}%'),
    ];
    return chartData;
  }

  void getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = jsonDecode(prefs.getString('userData')!)['fullName'];
    update();
  }
}
