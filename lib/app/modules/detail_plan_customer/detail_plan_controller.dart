import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/apis/kpi.dart';
import 'package:report_azvidi/app/apis/report.dart';
import 'package:report_azvidi/app/models/chart_model.dart';
import 'package:report_azvidi/app/models/profit_model.dart';
import 'package:report_azvidi/app/utils/loading_dialog.dart';

import '../../apis/marketing.dart';
import '../main/main_controller.dart';

class DetailPlanController extends GetxController {
  RxMap dataDetailPlanInfo = {}.obs;
  RxMap dataDetailPlan = {}.obs;
  RxMap dataSummaryPlan = {}.obs;
  final avgPercent = 0.0.obs;
  final idPlan = ''.obs;
  final searchText = ''.obs;
  RxBool isShowMore = false.obs;
  RxBool isChangeRange = false.obs;
  Color percentColor = const Color(0xFFE24329);
  final startDatePicker = '01/01/2022'.obs;
  final endDatePicker = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final pageController = [
    PageController(initialPage: 0),
    PageController(initialPage: 0),
    PageController(initialPage: 0),
    PageController(initialPage: 0),
    PageController(initialPage: 0),
    PageController(initialPage: 0),
  ];
  final currentPage = [0, 0, 0, 0, 0, 0].obs;
  RxList<ProfitModel> chartTargetPlanData = <ProfitModel>[].obs;
  RxList<ProfitModel> chartTargetData = <ProfitModel>[].obs;
  RxList<ProfitModel> chartDashboardPlanData = <ProfitModel>[].obs;
  RxList<ProfitModel> chartDashboardData = <ProfitModel>[].obs;
  RxList listKpiReport = [].obs;
  RxMap dataGroup = {}.obs;
  RxList<Color> listColor = <Color>[].obs;
  RxList<double> sumBranding = [0.0, 0.0].obs;
  RxList<double> sumPushSale = [0.0, 0.0].obs;
  RxList<double> sumProduction = [0.0, 0.0].obs;
  RxList<double> sumFacebook = [0.0, 0.0].obs;
  RxList<double> sumGoogle = [0.0, 0.0].obs;
  RxList<double> sumVnExpress = [0.0, 0.0].obs;
  RxList<double> sumAdmicro = [0.0, 0.0].obs;
  RxList<double> sumAdbro = [0.0, 0.0].obs;
  RxList<double> sumAdtima = [0.0, 0.0].obs;
  RxList<double> sumZalo = [0.0, 0.0].obs;
  RxList<double> sumTiktok = [0.0, 0.0].obs;
  RxList<double> sumLeadGeneration = [0.0, 0.0].obs;
  RxList<double> sumOther = [0.0, 0.0].obs;
  RxList<String> listChannel = <String>[].obs;
  RxList listChannelRaw = [].obs;
  RxList listReportTimeline = [].obs;
  RxList<ChartModel> listDetailReportDay = <ChartModel>[].obs;
  RxList<ChartModel> listDetailReportDayPlan = <ChartModel>[].obs;
  RxList<ChartModel> listDetailReportWeek = <ChartModel>[].obs;
  RxList<ChartModel> listDetailReportWeekPlan = <ChartModel>[].obs;
  RxList listDetailNameWeek = [].obs;
  RxMap dataDetailReportTimeline = {}.obs;
  RxList listDetailReportTimeline = [].obs;
  RxList listDetailNameWeek2 = [].obs;
  RxList<ChartModel> listReportDay = <ChartModel>[].obs;
  RxList<ChartModel> listReportDayPlan = <ChartModel>[].obs;
  RxList<ChartModel> listReportWeek = <ChartModel>[].obs;
  RxList<ChartModel> listReportWeekPlan = <ChartModel>[].obs;

  RxString currentChannelName = ''.obs;
  RxString currentDvtName = ''.obs;
  RxString currentGroupName = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      idPlan.value = Get.arguments;
    } catch (e) {
      print(e);
    }
    isLoading.value = true;
    isChangeRange.listen((p0) async {
      isLoading.value = true;
      clearData();
      fetchPlanInfoReport();
      fetchPlanReport();
      fetchKpiReport().then((value) => {
            sortGroup(),
            chartTargetPlanData.value = getChartPlanData(),
            chartTargetData.value = getChartData(),
          });

      fetchListReportTimeLine();
      fetchSummaryDashboardCustomer().then((value) => {
            getAvgPercent(),
            getColorPercent(),
            chartDashboardPlanData.value = getChartDashboardPlanData(),
            chartDashboardData.value = getChartDashboardData(),
          });
    });
    MainController mainController = Get.put(MainController());
    mainController.roleView.listen((p0) async {
      isLoading.value = true;
      clearData();
      fetchPlanInfoReport().then((value) => {
            startDatePicker.value = DateFormat('dd/MM/yyyy').format(
                DateTime.parse(
                    dataDetailPlanInfo['startDate'] ?? '2000-01-01T00:00:00')),
            endDatePicker.value = DateFormat('dd/MM/yyyy').format(
                DateTime.parse(
                    dataDetailPlanInfo['endDate'] ?? '2000-01-01T00:00:00')),
          });
      fetchPlanReport().then((value) => {
            getAvgPercent(),
            getColorPercent(),
            chartDashboardPlanData.value = getChartDashboardPlanData(),
            chartDashboardData.value = getChartDashboardData(),
          });
      fetchKpiReport().then((value) => {
            sortGroup(),
            chartTargetPlanData.value = getChartPlanData(),
            chartTargetData.value = getChartData(),
          });

      fetchListReportTimeLine();
      fetchSummaryDashboardCustomer().then((value) => {
            getAvgPercent(),
            getColorPercent(),
            chartDashboardPlanData.value = getChartDashboardPlanData(),
            chartDashboardData.value = getChartDashboardData(),
          });
    });
    fetchPlanInfoReport().then((value) => {
          startDatePicker.value = DateFormat('dd/MM/yyyy').format(
              DateTime.parse(
                  dataDetailPlanInfo['startDate'] ?? '2000-01-01T00:00:00')),
          endDatePicker.value = DateFormat('dd/MM/yyyy').format(DateTime.parse(
              dataDetailPlanInfo['endDate'] ?? '2000-01-01T00:00:00')),
          fetchListReportTimeLine()
        });
    fetchPlanReport().then((value) => {
          getAvgPercent(),
          getColorPercent(),
          chartDashboardPlanData.value = getChartDashboardPlanData(),
          chartDashboardData.value = getChartDashboardData(),
        });
    fetchKpiReport().then((value) => {
          sortGroup(),
          chartTargetPlanData.value = getChartPlanData(),
          chartTargetData.value = getChartData(),
        });

    fetchSummaryDashboardCustomer().then((value) => {
          getAvgPercent(),
          getColorPercent(),
          chartDashboardPlanData.value = getChartDashboardPlanData(),
          chartDashboardData.value = getChartDashboardData(),
        });
  }

  void refreshData() {
    isLoading.value = true;
    startDatePicker.value = DateFormat('dd/MM/yyyy').format(DateTime.parse(
        dataDetailPlanInfo['startDate'] ?? '2000-01-01T00:00:00'));
    endDatePicker.value = DateFormat('dd/MM/yyyy').format(
        DateTime.parse(dataDetailPlanInfo['endDate'] ?? '2000-01-01T00:00:00'));
    clearData();
    fetchPlanInfoReport();
    fetchPlanReport().then((value) => {
          getAvgPercent(),
          getColorPercent(),
          chartDashboardPlanData.value = getChartDashboardPlanData(),
          chartDashboardData.value = getChartDashboardData(),
        });
    fetchKpiReport().then((value) => {
          sortGroup(),
          chartTargetPlanData.value = getChartPlanData(),
          chartTargetData.value = getChartData(),
        });

    fetchListReportTimeLine();
    fetchSummaryDashboardCustomer().then((value) => {
          getAvgPercent(),
          getColorPercent(),
          chartDashboardPlanData.value = getChartDashboardPlanData(),
          chartDashboardData.value = getChartDashboardData(),
        });
  }

  Future<RxList<String>> fetchListChannel() async {
    listChannel.clear();
    final dataListChannelRequest =
        await MarketingApi().getListPagingMarketingRequest();
    if (dataListChannelRequest?['code'] == 0) {
      listChannelRaw.value = dataListChannelRequest['content'];

      for (var x in listChannelRaw) {
        listChannel.add(x['name']);
      }
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    return listChannel;
  }

  Future fetchSummaryDashboardCustomer() async {
    dataSummaryPlan.clear();
    final dataSummaryPlanRequest = await CustomerApi()
        .getSummaryDashboardCustomerPlanRequest(
            startDatePicker.value, endDatePicker.value, idPlan.value);
    if (dataSummaryPlanRequest['code'] == 0) {
      dataSummaryPlan.value = dataSummaryPlanRequest['content'];
      isLoading.value = false;
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
      isLoading.value = false;
    }
    update();
  }

  Future fetchDataDetailWithTimelineKpi(id) async {
    final dataRequest = await KpiApi().getDetailWithTimelineKpiRequest(id);
    if (dataRequest?['code'] == 0) {
      return dataRequest['content'];
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    return dataRequest;
  }

  void clearData() {
    sumFacebook.value = [0.0, 0.0];
    sumBranding.value = [0.0, 0.0];
    sumProduction.value = [0.0, 0.0];
    sumPushSale.value = [0.0, 0.0];
    searchText.value = '';
    sumAdmicro.value = [0.0, 0.0];
    sumAdbro.value = [0.0, 0.0];
    sumAdtima.value = [0.0, 0.0];
    sumGoogle.value = [0.0, 0.0];
    sumOther.value = [0.0, 0.0];
    sumTiktok.value = [0.0, 0.0];
    sumVnExpress.value = [0.0, 0.0];
    sumZalo.value = [0.0, 0.0];
    listReportWeek.clear();
    listReportWeekPlan.clear();
    listReportDay.clear();
    listReportDayPlan.clear();
    chartDashboardData.clear();
    chartDashboardPlanData.clear();
    chartTargetData.clear();
    chartTargetPlanData.clear();
  }

  void clearDetailData() {
    listDetailReportDayPlan.clear();
    listDetailReportDay.clear();
    listDetailReportTimeline.clear();
    currentPage[5] = 0;
    currentPage[2] = 0;
  }

  void toggleShowMore() {
    isShowMore.value = !isShowMore.value;
  }

  void toggleChangeRange() {
    isChangeRange.value = !isChangeRange.value;
  }

  List<ProfitModel> getChartPlanData() {
    final List<ProfitModel> chartData = [
      if (sumBranding[1].toInt() > 0)
        ProfitModel('BRANDING', sumBranding[1].toInt(),
            '${(sumBranding[1] / (sumBranding[1] + sumPushSale[1] + sumProduction[1]) * 100).toStringAsFixed(0)}%'),
      if (sumPushSale[1].toInt() > 0)
        ProfitModel('PUSHSALE', sumPushSale[1].toInt(),
            '${(sumPushSale[1] / (sumBranding[1] + sumPushSale[1] + sumProduction[1]) * 100).toStringAsFixed(0)}%'),
      if (sumProduction[1].toInt() > 0)
        ProfitModel('PRODUCTIONS', sumProduction[1].toInt(),
            '${(sumProduction[1] / (sumBranding[1] + sumPushSale[1] + sumProduction[1]) * 100).toStringAsFixed(0)}%'),
    ];

    listColor.value = [
      if (sumBranding[1].toInt() > 0) const Color(0xFF065166),
      if (sumPushSale[1].toInt() > 0) const Color(0xFFF27B21),
      if (sumProduction[1].toInt() > 0) const Color(0xFF595A5C),
    ];

    return chartData;
  }

  List<ProfitModel> getChartData() {
    final List<ProfitModel> chartData = [
      if (sumBranding[0] > 0)
        ProfitModel('BRANDING', sumBranding[0].toInt(),
            '${(sumBranding[0] / (sumBranding[0] + sumPushSale[0] + sumProduction[0]) * 100).toStringAsFixed(0)}%'),
      if (sumPushSale[0] > 0)
        ProfitModel('PUSHSALE', sumPushSale[0].toInt(),
            '${(sumPushSale[0] / (sumBranding[0] + sumPushSale[0] + sumProduction[0]) * 100).toStringAsFixed(0)}%'),
      if (sumProduction[0] > 0)
        ProfitModel('PRODUCTIONS', sumProduction[0].toInt(),
            '${(sumProduction[0] / (sumBranding[0] + sumPushSale[0] + sumProduction[0]) * 100).toStringAsFixed(0)}%'),
    ];

    return chartData;
  }

  List<ProfitModel> getChartDashboardPlanData() {
    final profit = (dataSummaryPlan['grossProfitPlan'] ?? 0);
    final cap = dataSummaryPlan['capitalAmountPlan'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(1)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(1)}%'),
    ];

    return chartData;
  }

  List<ProfitModel> getChartDashboardData() {
    final profit = (dataSummaryPlan['grossProfit'] ?? 0);
    final cap = dataSummaryPlan['capitalAmount'] ?? 0;

    final List<ProfitModel> chartData = [
      ProfitModel('Lợi nhuận', profit,
          '${(profit / (cap + profit) * 100).toStringAsFixed(1)}%'),
      ProfitModel('Giá vốn', cap,
          '${(cap / (cap + profit) * 100).toStringAsFixed(1)}%'),
    ];
    return chartData;
  }

  void valSum(dataGroup) {
    List listBranding = [], listPushSale = [], listProduction = [];
    for (String x in dataGroup.keys) {
      if (x.contains('BRAND')) {
        listBranding.addAll(dataGroup[x]);
      } else if (x.contains('PUSH')) {
        listPushSale.addAll(dataGroup[x]);
      } else if (x.contains('PRODUCTION')) {
        listProduction.addAll(dataGroup[x]);
      }
    }
    for (var x in listBranding) {
      sumBranding[0] = sumBranding[0] + (x['cost'] ?? 0);
      sumBranding[1] = sumBranding[1] + (x['budget'] ?? 0);
    }
    for (var x in listPushSale) {
      sumPushSale[0] = sumPushSale[0] + (x['cost'] ?? 0);
      sumPushSale[1] = sumPushSale[1] + (x['budget'] ?? 0);
    }
    for (var x in listProduction) {
      sumProduction[0] = sumProduction[0] + (x['cost'] ?? 0);
      sumProduction[1] = sumProduction[1] + (x['budget'] ?? 0);
    }
  }

  void valSumChannel() {
    for (var x in listKpiReport) {
      if (x['channel'] == 'Facebook') {
        sumFacebook[0] = sumFacebook[0] + (x['cost'] ?? 0);
        sumFacebook[1] = sumFacebook[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Google') {
        sumGoogle[0] = sumGoogle[0] + (x['cost'] ?? 0);
        sumGoogle[1] = sumGoogle[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Admicro') {
        sumAdmicro[0] = sumAdmicro[0] + (x['cost'] ?? 0);
        sumAdmicro[1] = sumAdmicro[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Adbro') {
        sumAdbro[0] = sumAdbro[0] + (x['cost'] ?? 0);
        sumAdbro[1] = sumAdbro[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Zalo') {
        sumZalo[0] = sumZalo[0] + (x['cost'] ?? 0);
        sumZalo[1] = sumZalo[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Tiktok') {
        sumTiktok[0] = sumTiktok[0] + (x['cost'] ?? 0);
        sumTiktok[1] = sumTiktok[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Khác') {
        sumOther[0] = sumOther[0] + (x['cost'] ?? 0);
        sumOther[1] = sumOther[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Vnexpress') {
        sumVnExpress[0] = sumVnExpress[0] + (x['cost'] ?? 0);
        sumVnExpress[1] = sumVnExpress[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Adtima') {
        sumAdtima[0] = sumAdtima[0] + (x['cost'] ?? 0);
        sumAdtima[1] = sumAdtima[1] + (x['budget'] ?? 0);
      } else if (x['channel'] == 'Lead Generation') {
        sumLeadGeneration[0] = sumLeadGeneration[0] + (x['cost'] ?? 0);
        sumLeadGeneration[1] = sumLeadGeneration[1] + (x['budget'] ?? 0);
      }
    }
  }

  List<ChartModel> getListChartModel(int index) {
    return [
      if (sumFacebook[0] != 0 || sumFacebook[1] != 0)
        ChartModel('Facebook', sumFacebook[index]),
      if (sumGoogle[0] != 0 || sumGoogle[1] != 0)
        ChartModel('Google', sumGoogle[index]),
      if (sumAdmicro[0] != 0 || sumAdmicro[1] != 0)
        ChartModel('Admicro', sumAdmicro[index]),
      if (sumAdbro[0] != 0 || sumAdbro[1] != 0)
        ChartModel('Adbro', sumAdbro[index]),
      if (sumZalo[0] != 0 || sumZalo[1] != 0)
        ChartModel('Zalo', sumZalo[index]),
      if (sumTiktok[0] != 0 || sumTiktok[1] != 0)
        ChartModel('Tiktok', sumTiktok[index]),
      if (sumVnExpress[0] != 0 || sumVnExpress[1] != 0)
        ChartModel('VnExpress', sumVnExpress[index]),
      if (sumLeadGeneration[0] != 0 || sumLeadGeneration[1] != 0)
        ChartModel('Lead Generation', sumLeadGeneration[index]),
      if (sumAdtima[0] != 0 || sumAdtima[1] != 0)
        ChartModel('Adtima', sumAdtima[index]),
      if (sumOther[0] != 0 || sumOther[1] != 0)
        ChartModel('Khác', sumOther[index]),
    ];
  }

  void sortGroup() {
    dataGroup.clear();
    for (var x in listKpiReport) {
      dataGroup[x['groupName']] = [];
    }
    for (var x in listKpiReport) {
      dataGroup[x['groupName']].add(x);
    }
    valSum(dataGroup);
    valSumChannel();
  }

  Future fetchKpiReport() async {
    listKpiReport.clear();
    final dataPlanReportRequest = await CustomerApi().getKpiReportApiRequest(
        startDatePicker.value, endDatePicker.value, idPlan.value);
    if (dataPlanReportRequest?['code'] == 0) {
      listKpiReport.value = dataPlanReportRequest['content'];
      isLoading.value = false;
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
      isLoading.value = false;
    }
    update();
  }

  Future fetchListDetailReportTimeLine(id) async {
    dataDetailReportTimeline.clear();
    listDetailReportTimeline.clear();
    final dataReportTimeLineRequest = await KpiApi()
        .getKpiTimeLineRequest(startDatePicker.value, endDatePicker.value, id);
    if (dataReportTimeLineRequest?['code'] == 0) {
      dataDetailReportTimeline.value = dataReportTimeLineRequest['content'];
      listDetailReportTimeline.value = dataDetailReportTimeline['timeline'];
      getListDetailTimeLine();
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
  }

  void getListDetailTimeLine() {
    Map sortWeek = {};
    listDetailReportDay.clear();
    listDetailReportDayPlan.clear();
    listDetailReportWeek.clear();
    listDetailReportWeekPlan.clear();
    for (var x in listDetailReportTimeline) {
      listDetailReportDay.add(ChartModel(
          DateFormat('dd/MM').format(DateTime.parse(x['date'])),
          x['value'] ?? 0));
      listDetailReportDayPlan.add(ChartModel(
          DateFormat('dd/MM').format(DateTime.parse(x['date'])),
          x['valuePlan'] ?? 0));
      sortWeek[x['weekName']] = [];
    }
    for (var x in listDetailReportTimeline) {
      sortWeek[x['weekName']].add(x);
    }
    for (List x in sortWeek.values) {
      num sumTemp = 0;
      num sumPlanTemp = 0;
      String nameWeek = '';
      for (var y in x) {
        sumTemp = sumTemp + (y['value'] ?? 0);
        sumPlanTemp = sumPlanTemp + (y['valuePlan'] ?? 0);
        nameWeek = (y['weekName'] ?? "").replaceFirst('Tuần ', 'T');
      }

      String detailName =
          '${nameWeek.replaceFirst('T', 'Tuần ')}: ${DateFormat('dd/MM').format(DateTime.parse(x[0]['date']))} - ${DateFormat('dd/MM').format(DateTime.parse(x[x.length - 1]['date']))}';
      listDetailNameWeek2.add(detailName);
      listDetailReportWeek.add(ChartModel(nameWeek, sumTemp));
      listDetailReportWeekPlan.add(ChartModel(nameWeek, sumPlanTemp));
    }
    update();
  }

  Future fetchListReportTimeLine() async {
    listReportTimeline.clear();
    final dataReportTimeLineRequest = await ReportApi()
        .getReportTimelineRequest(
            startDatePicker.value, endDatePicker.value, idPlan.value);
    if (dataReportTimeLineRequest?['code'] == 0) {
      listReportTimeline.value = dataReportTimeLineRequest['content'];
      getListTimeLine();
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    update();
  }

  void getListTimeLine() {
    Map sortWeek = {};
    listReportDay.clear();
    listReportDayPlan.clear();
    listReportWeek.clear();
    listReportWeekPlan.clear();
    listDetailNameWeek.clear();
    for (var x in listReportTimeline) {
      listReportDay.add(ChartModel(
          DateFormat('dd/MM').format(DateTime.parse(x['date'])),
          x['cost'] ?? 0));
      listReportDayPlan.add(ChartModel(
          DateFormat('dd/MM').format(DateTime.parse(x['date'])),
          x['budget'] ?? 0));
      sortWeek[x['weekName']] = [];
    }
    for (var x in listReportTimeline) {
      sortWeek[x['weekName']].add(x);
    }
    for (List x in sortWeek.values) {
      num sumTemp = 0;
      num sumPlanTemp = 0;
      String nameWeek = '';
      String detailNameWeek = '';

      for (var y in x) {
        sumTemp = sumTemp + (y['cost'] ?? 0);
        sumPlanTemp = sumPlanTemp + (y['budget'] ?? 0);
        nameWeek = (y['weekName'] ?? "").replaceFirst('Tuần ', 'T');
        detailNameWeek =
            ('${nameWeek.replaceFirst('T', 'Tuần ')}: ${DateFormat('dd/MM').format(DateTime.parse(y['startDate']))} - ${DateFormat('dd/MM').format(DateTime.parse(y['endDate']))}');
      }
      listDetailNameWeek.add(detailNameWeek);
      listReportWeek.add(ChartModel(nameWeek, sumTemp));
      listReportWeekPlan.add(ChartModel(nameWeek, sumPlanTemp));
    }
  }

  Future fetchPlanReport() async {
    dataDetailPlan.clear();
    final dataPlanReportRequest = await CustomerApi().getPlanReportApiRequest(
        startDatePicker.value, endDatePicker.value, idPlan.value);
    if (dataPlanReportRequest?['code'] == 0) {
      dataDetailPlan.value = dataPlanReportRequest['content'];
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    update();
  }

  Future fetchPlanInfoReport() async {
    dataDetailPlanInfo.clear();
    final dataPlanReportRequest =
        await CustomerApi().getPlanInfoApiRequest(idPlan.value);
    if (dataPlanReportRequest?['code'] == 0) {
      dataDetailPlanInfo.value = dataPlanReportRequest['content'];
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    update();
  }

  void getColorPercent() {
    percentColor = avgPercent > .75
        ? const Color(0xFF3949AB)
        : (avgPercent <= 0.75 && avgPercent > 0.5)
            ? const Color(0xFF00CCB1)
            : (avgPercent > 0.25 && avgPercent <= 0.5)
                ? const Color(0xFFFCA326)
                : const Color(0xFFE24329);
  }

  void getAvgPercent() {
    var count = 0;
    num percentClick = 0,
        percentImpression = 0,
        percentView = 0,
        percentAidc = 0,
        percentRLead = 0,
        percentQLead = 0;
    if (dataDetailPlan['aidc'] != 0 &&
        dataDetailPlan['aidc'] != null &&
        dataDetailPlan['aidcPlan'] != 0 &&
        dataDetailPlan['aidcPlan'] != null) {
      count++;
      percentAidc = dataDetailPlan['aidc'] / dataDetailPlan['aidcPlan'];
    }
    if (dataDetailPlan['click'] != 0 &&
        dataDetailPlan['click'] != null &&
        dataDetailPlan['clickPlan'] != 0 &&
        dataDetailPlan['clickPlan'] != null) {
      count++;
      percentClick = dataDetailPlan['click'] / dataDetailPlan['clickPlan'];
    }
    if (dataDetailPlan['impression'] != 0 &&
        dataDetailPlan['impression'] != null &&
        dataDetailPlan['impressionPlan'] != 0 &&
        dataDetailPlan['impressionPlan'] != null) {
      count++;
      percentImpression =
          dataDetailPlan['impression'] / dataDetailPlan['impressionPlan'];
    }
    if (dataDetailPlan['rawLead'] != 0 &&
        dataDetailPlan['rawLead'] != null &&
        dataDetailPlan['rawLeadPlan'] != 0 &&
        dataDetailPlan['rawLeadPlan'] != null) {
      count++;
      percentRLead = dataDetailPlan['rawLead'] / dataDetailPlan['rawLeadPlan'];
    }
    if (dataDetailPlan['qualifiedLead'] != 0 &&
        dataDetailPlan['qualifiedLead'] != null &&
        dataDetailPlan['qualifiedLeadPlan'] != 0 &&
        dataDetailPlan['qualifiedLeadPlan'] != null) {
      count++;
      percentQLead =
          dataDetailPlan['qualifiedLead'] / dataDetailPlan['qualifiedLeadPlan'];
    }
    if (dataDetailPlan['view'] != 0 &&
        dataDetailPlan['view'] != null &&
        dataDetailPlan['viewPlan'] != 0 &&
        dataDetailPlan['viewPlan'] != null) {
      count++;
      percentView = dataDetailPlan['view'] / dataDetailPlan['viewPlan'];
    }
    num avgPercentRaw = 0;
    if (count != 0) {
      avgPercentRaw = (percentQLead +
              percentRLead +
              percentAidc +
              percentView +
              percentClick +
              percentImpression) /
          count;
    }

    avgPercent.value = double.parse(avgPercentRaw.toStringAsFixed(2));
  }
}
