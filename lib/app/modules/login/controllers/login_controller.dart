import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/menu.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final isAdmin = GetStorage();

  final count = 0.obs;
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
    debugPrint("LoginController onClose");
  }

  Future<void> login(String email, String password) async {
    debugPrint('user: ${email}');
    debugPrint('pass: ${password}');
    // menuItems2 = menuItemsAdmin
    //     .where((element) => (element.isAdmin == false))
    //     .toList()
    //     .obs;
    if (email != 'admin') {
      isAdmin.write('isAdmin', '0');
      Get.offNamed(Routes.HOME);
    } else {
      isAdmin.write('isAdmin', '1');
      Get.offNamed(Routes.HOME);
    }
    // Get.dialog(const Center(child: CircularProgressIndicator()),
    //     barrierDismissible: false);
    // String responseLogin = '';
    // LoginService loginService = LoginService();
    // responseLogin = await loginService.login(
    //     usernameController.text, passwordController.text);
    // print(responseLogin);
    // Get.back();
    // if (responseLogin.isNotEmpty) {
    //   Get.defaultDialog(
    //     radius: 10.0,
    //     contentPadding: const EdgeInsets.all(20.0),
    //     title: '',
    //     middleText: responseLogin,
    //     textConfirm: 'Okay',
    //     confirm: OutlinedButton.icon(
    //       onPressed: () => Get.back(),
    //       icon: Icon(
    //         Icons.close,
    //         color: Colors.red.shade700,
    //       ),
    //       label: const Text(
    //         'ปิด',
    //         style: TextStyle(color: Colors.blue),
    //       ),
    //     ),
    //   );
    // } else {
    //   Get.offNamed(Routes.dashboardPageRoute);
    // }
    // Get.offNamed(Routes.HOME);
    // return responseLogin;
  }
}
