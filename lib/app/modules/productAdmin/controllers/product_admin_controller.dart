import 'package:get/get.dart';

import '../../../data/order.dart';

class ProductAdminController extends GetxController {
  RxString currentCategory = "1".obs;
  RxList<OrderItem> listOrder = <OrderItem>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
