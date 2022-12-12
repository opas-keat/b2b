import 'package:get/get.dart';

import '../controllers/history_admin_controller.dart';

class HistoryAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryAdminController>(
      () => HistoryAdminController(),
    );
  }
}
