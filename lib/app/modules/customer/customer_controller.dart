import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:report_azvidi/app/apis/user.dart';
import 'package:report_azvidi/app/models/marketing_customer_model.dart';
import 'package:report_azvidi/app/modules/home/home_controller.dart';

import '../../apis/customer.dart';
import '../main/main_controller.dart';

class CustomerController extends GetxController {
  final searchText = ''.obs;
  RxList<MarketingCustomerModel> dataListPagingCustomer =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListPagingCustomerSearch =
      <MarketingCustomerModel>[].obs;
  final dropdownValue = 'Tất cả'.obs;
  MainController mainController = Get.put(MainController());
  final startDatePicker = '01/01/2023'.obs;
  final endDatePicker = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final base64Image = ''.obs;
  final ImagePicker picker = ImagePicker();

  RxList<MarketingCustomerModel> dataListRunning =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListDone = <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListCancel =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListInactive =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListUnknown =
      <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListNew = <MarketingCustomerModel>[].obs;
  RxList<MarketingCustomerModel> dataListDeal = <MarketingCustomerModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mainController.roleView.listen((p0) async {
      fetchListPagingCustomer();
    });
  }

  void refreshData() async {
    await UserApi().clearCache();
    fetchListPagingCustomer();
  }

  Future fetchListPagingCustomer() async {
    try {
      dataListPagingCustomer.clear();

      final dataCustomerRequest = (await CustomerApi()
          .getListPagingMarketingCustomerRequest(
              startDatePicker.value, endDatePicker.value));
      if (dataCustomerRequest?['code'] == 0) {
        List<dynamic> dataCustomer = [];
        dataCustomer = dataCustomerRequest['content'];
        dataListPagingCustomer.addAll(dataCustomer
            .map((e) => MarketingCustomerModel.fromJson(e))
            .toList());
      } else {
        Get.snackbar('Lỗi', dataCustomerRequest['message']);
      }
      update();
    } catch (err) {
      print(err);
    }
  }

  void onTextChanged() {
    dataListPagingCustomerSearch.clear();
    for (var x in dataListPagingCustomer) {
      if (x.customerName
          .toLowerCase()
          .contains(searchText.value.toLowerCase())) {
        dataListPagingCustomerSearch.add(x);
      }
    }
  }
}
