import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/customer.dart';
import 'package:report_azvidi/app/apis/kpi.dart';
import 'package:report_azvidi/app/apis/marketing.dart';
import 'package:report_azvidi/app/apis/unit.dart';

class RateCardsController extends GetxController {
  final searchText = ''.obs;
  final dataChannel = {}.obs;
  final currentIndex = 0.obs;
  final isPcCheck = false.obs;
  final isMbCheck = false.obs;
  final listCurrentName = ['ALL'].obs;
  final listFilterData = [].obs;
  final listCategoryKpi = [].obs;
  final listCategoryKpiSort = [].obs;
  final listCategoryKpiSearch = [].obs;
  final lengthListCard = 0.obs;
  final dataListCard = {}.obs;
  final nameDataCard = ''.obs;
  RxList<String> listChannel = <String>[].obs;
  RxList<String> listUnit = <String>[].obs;
  RxList listChannelRaw = [].obs;
  RxList listUnitRaw = [].obs;
  final currentChannelName = 'Google'.obs;
  final currentUnitName = 'Click'.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    await fetchListCategoryKpi();
    listUnit = await fetchListUnit();
    listChannel = await fetchListChannel();
    super.onInit();
  }

  int getIdChannel(String str) {
    return listChannelRaw[listChannel.indexOf(str)]['id'];
  }

  int getIdUnit(String str) {
    return listUnitRaw[listUnit.indexOf(str)]['id'];
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

  Future<RxList<String>> fetchListUnit() async {
    listUnit.clear();
    final dataListUnitRequest = await UnitApi().getListPagingUnitRequest();
    if (dataListUnitRequest?['code'] == 0) {
      listUnitRaw.value = dataListUnitRequest['content'];

      for (var x in listUnitRaw) {
        listUnit.add(x['name']);
      }
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    return listUnit;
  }

  int getLengthListCard() {
    update();
    return (searchText.value != ''
        ? listCategoryKpiSearch.length
        : listCurrentName[0] == 'ALL'
            ? listCategoryKpi.length
            : (getJoinList()?.length ?? 0));
  }

  Map getDataListCard(int index) {
    return (searchText.value != ''
        ? listCategoryKpiSearch[index]
        : listCurrentName[0] == 'ALL'
            ? listCategoryKpi[index]
            : getJoinList()?[index]);
  }

  String getNameDataCard(index) {
    return (searchText.value != ''
        ? listCategoryKpiSearch[index]['channel']['name']
        : listCurrentName[0] == 'ALL'
            ? listCategoryKpi[index]['channel']['name']
            : getJoinList()?[index]['channel']['name']);
  }

  List? getJoinList() {
    listFilterData.clear();
    for (var x in listCurrentName) {
      listFilterData.addAll(dataChannel[x] ?? []);
    }
    return listFilterData;
  }

  void onTextChanged() {
    listCategoryKpiSearch.clear();
    for (var element in listCategoryKpi) {
      if (element['name']
          .toString()
          .toLowerCase()
          .contains(searchText.value.toLowerCase())) {
        listCategoryKpiSearch.add(element);
      } else if (element['objective']
          .toString()
          .toLowerCase()
          .contains(searchText.value.toLowerCase())) {
        listCategoryKpiSearch.add(element);
      } else if (element['channel']['name']
          .toString()
          .toLowerCase()
          .contains(searchText.value.toLowerCase())) {
        listCategoryKpiSearch.add(element);
      }
    }
    update();
  }

  void getDataChannel() {
    listCategoryKpiSort.addAll(listCategoryKpi);
    listCategoryKpiSort.sort((a, b) {
      return a['channel']['name'].compareTo(b['channel']['name']);
    });
    dataChannel.clear();
    for (var x in listCategoryKpiSort) {
      dataChannel[x['channel']['name']] = [];
    }
    for (var x in listCategoryKpiSort) {
      dataChannel[x['channel']['name']].add(x);
    }
  }

  Future fetchListCategoryKpi() async {
    listCategoryKpi.clear();
    final dataSummaryDashboardRequest = await KpiApi().getCategoryKpiRequest();

    if (dataSummaryDashboardRequest?['code'] == 0) {
      listCategoryKpi.value = dataSummaryDashboardRequest['content'];
    } else {
      Get.snackbar('Oh no!', 'Đã có lỗi xảy ra');
    }
    getDataChannel();
    update();
  }

  Color getColorFromIndex(int index) {
    return index == 0
        ? const Color(0xFF065166)
        : index == 1
            ? const Color(0xFF1B74E4)
            : index == 2
                ? const Color(0xFFD72929)
                : index == 3
                    ? const Color(0xFF0091FF)
                    : index == 4
                        ? const Color(0xFFFD9F19)
                        : index == 5
                            ? const Color(0xFFafb0b1)
                            : index == 6
                                ? const Color(0xFF6db368)
                                : index == 7
                                    ? const Color(0xFFc07691)
                                    : index == 8
                                        ? const Color(0xFF77f5f2)
                                        : index == 9
                                            ? const Color(0xFFf2ab76)
                                            : index == 10
                                                ? const Color(0xFF6492a0)
                                                : index == 11
                                                    ? const Color(0xFF6162b4)
                                                    : const Color(0xFFafb0b1);
  }
}
