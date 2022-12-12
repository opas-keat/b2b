import 'package:get/get.dart';

import '../controllers/dealer_profile_controller.dart';

class DealerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DealerProfileController>(
      () => DealerProfileController(),
    );
  }
}
