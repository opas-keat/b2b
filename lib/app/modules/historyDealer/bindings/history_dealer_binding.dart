import 'package:get/get.dart';

import '../controllers/history_dealer_controller.dart';

class HistoryDealerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryDealerController>(
      () => HistoryDealerController(),
    );
  }
}
