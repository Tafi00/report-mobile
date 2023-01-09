import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/apis/project.dart';
import 'package:report_azvidi/app/models/marketing_customer_model.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/constants.dart';
import '../customer/customer_controller.dart';
import '../home/home_controller.dart';
import '../main/main_controller.dart';

class DetailCustomerController extends GetxController {
  RxMap dataDetailCustomer = {}.obs;
  RxMap dataSummaryCount = {}.obs;

  RxMap dataSummaryDashboardCustomer = {}.obs;
  RxBool isShowMore = false.obs;
  final idCustomer = ''.obs;
  final searchText = ''.obs;
  RxString startDateSchedule = '01/01/2023'.obs;
  RxString endDateSchedule =
      DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  MainController mainController = Get.put(MainController());
  CustomerController customerController = Get.put(CustomerController());
  final base64Image = ''.obs;

  final ImagePicker picker = ImagePicker();
  final startDatePicker = '01/01/2023'.obs;
  final endDatePicker = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final PageController pageController = PageController(initialPage: 0);
  final currentPage = 0.obs;
  late TooltipBehavior tooltipBehavior;
  RxList listDataPlanReport = [].obs;
  RxList listDataPlanReportSearch = [].obs;
  RxList listPagingProject = [].obs;
  List<String> listPagingProjectString = <String>[].obs;
  List<String> listPagingProjectId = <String>[].obs;

  RxList<ProfitModel> chartPlanData = <ProfitModel>[].obs;
  RxList<ProfitModel> chartData = <ProfitModel>[].obs;
  RxString dropdownProjectValue = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    startDatePicker.value = customerController.startDatePicker.value;
    endDatePicker.value = customerController.endDatePicker.value;

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
    idCustomer.value = Get.arguments;

    dataSummaryDashboardCustomer.listen((p0) {
      chartPlanData.value = getChartPlanData();
      chartData.value = getChartData();
    });
    mainController.roleView.listen((p0) {
      refreshData();
    });
    refreshData();
  }

  void refreshData() {
    isLoading.value = true;

    fetchListPlanReport();
    fetchSummaryCount();
    fetchDetailCustomer(idCustomer.value);
    fetchSummaryDashboardCustomer();
    fetchListPagingProject();
  }

  void toggleShowMore() {
    isShowMore.value = !isShowMore.value;
  }

  void onTextChanged() {
    listDataPlanReportSearch.clear();
    for (var x in listDataPlanReport) {
      if ((x['projectName'] + x['planName'])
          .toLowerCase()
          .contains(searchText.value.toLowerCase())) {
        listDataPlanReportSearch.add(x);
      }
    }
  }

  Future fetchSummaryCount() async {
    // try {
    dataSummaryCount.clear();
    final dataSummaryCountRequest = await CustomerApi()
        .getSummaryCountCustomerRequest(
            startDatePicker.value, endDatePicker.value, idCustomer.value);
    if (dataSummaryCountRequest?['code'] == 0) {
      dataSummaryCount.value = dataSummaryCountRequest['content'];
      isLoading.value = false;
    } else {
      Get.snackbar('Lỗi', dataSummaryCountRequest?['message']);

      isLoading.value = false;
    }
    update();
  }

  Future fetchListPlanReport() async {
    listDataPlanReport.clear();
    final dataPlanReportRequest = await CustomerApi()
        .getListPlanReportCustomerApiRequest(
            startDatePicker.value, endDatePicker.value, idCustomer.value);
    if (dataPlanReportRequest?['code'] == 0) {
      listDataPlanReport.value = dataPlanReportRequest['content'];
      print(listDataPlanReport);
    } else {
      Get.snackbar('Lỗi', dataPlanReportRequest?['message']);
    }
    update();
  }

  Future fetchListPagingProject() async {
    listPagingProject.clear();
    listPagingProjectString.clear();
    listPagingProjectId.clear();

    final dataListPagingProjectRequest =
        await ProjectApi().getListPagingProjectRequest(idCustomer.value);
    if (dataListPagingProjectRequest?['code'] == 0) {
      listPagingProject.value = dataListPagingProjectRequest['content'];

      for (var x in listPagingProject) {
        listPagingProjectString.add(x['name']);
      }
      for (var x in listPagingProject) {
        listPagingProjectId.add(x['projectId']);
      }
    } else {
      Get.snackbar('Lỗi', dataListPagingProjectRequest?['message']);
    }
    update();
  }

  Future fetchSummaryDashboardCustomer() async {
    dataSummaryDashboardCustomer.clear();
    final dataCustomerCardModelRequest = await CustomerApi()
        .getSummaryDashboardCustomerRequest(
            startDatePicker.value, endDatePicker.value, idCustomer.value);
    if (dataCustomerCardModelRequest['code'] == 0) {
      dataSummaryDashboardCustomer.value =
          dataCustomerCardModelRequest['content'];
      isLoading.value = false;
    } else {
      Get.snackbar('Lỗi', dataCustomerCardModelRequest?['message']);
      isLoading.value = false;
    }
    update();
  }

  Future fetchDetailCustomer(String customerId) async {
    dataDetailCustomer.clear();
    final dataDetailCustomerRequest =
        await CustomerApi().getDetailCustomerRequest(customerId);
    if (dataDetailCustomerRequest['code'] == 0) {
      dataDetailCustomer.value = dataDetailCustomerRequest['content'];
      print(dataDetailCustomer);
    } else {
      Get.snackbar('Lỗi', dataDetailCustomerRequest?['message']);
    }
    update();
  }

  List<ProfitModel> getChartPlanData() {
    final profit = (dataSummaryDashboardCustomer['grossProfitPlan'] ?? 0);
    final cap = dataSummaryDashboardCustomer['capitalAmountPlan'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(0)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(0)}%'),
    ];
    return chartData;
  }

  List<ProfitModel> getChartData() {
    final profit = (dataSummaryDashboardCustomer['grossProfit'] ?? 0);
    final cap = dataSummaryDashboardCustomer['capitalAmount'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(0)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(0)}%'),
    ];
    return chartData;
  }
}
