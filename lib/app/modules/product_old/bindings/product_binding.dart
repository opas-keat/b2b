import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductOldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductOldController>(
      () => ProductOldController(),
    );
  }
}
