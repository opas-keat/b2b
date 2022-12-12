import 'package:b2b/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddProductController extends GetxController {
  final isAdmin = GetStorage().read('isAdmin');

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

  addProduct() {
    Get.toNamed(Routes.HOME);
  }
}
