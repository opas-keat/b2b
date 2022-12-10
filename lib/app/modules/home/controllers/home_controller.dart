import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/menu.dart';

class HomeController extends GetxController {
  RxInt navIndex = 0.obs;
  // String isAdmin = GetStorage().read('isAdmin');
  // RxString isAdmin = GetStorage().read('isAdmin').obs;
  // RxList<MenuItem2> menuItems2 = GetStorage().read('menu').obs;
  // String isAdmin = GetStorage().read('isAdmin');
  // RxString isAdmin = GetStorage().read('isAdmin').obs;
  List<MenuItem2> menus = menuItems
      .where((element) => (element.isAdmin == GetStorage().read('isAdmin')))
      .toList();

  @override
  void onInit() {
    super.onInit();
    // menuItems2 = menuItemsAdmin
    //     .where((element) => (element.isAdmin == false))
    //     .toList()
    //     .obs;
    // debugPrint('length: ${menuItems2.length}');
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
