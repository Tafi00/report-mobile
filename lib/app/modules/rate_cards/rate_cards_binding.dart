import 'package:get/get.dart';

import 'rate_cards_controller.dart';

class RateCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateCardsController());
  }
}
