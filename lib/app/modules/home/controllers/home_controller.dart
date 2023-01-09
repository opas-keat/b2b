import 'package:get/get.dart';

import '../../../data/menu.dart';

class HomeController extends GetxController {
  RxInt navIndex = 0.obs;
  List<MenuItem> menus =
      menuItems.where((element) => element.isShow == true).toList();

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
