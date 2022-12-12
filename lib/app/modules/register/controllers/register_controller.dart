import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final memberCode = TextEditingController();

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

  Future<void> register() async {
    debugPrint('email: ${email.text}');
    debugPrint('password: ${password.text}');
    debugPrint('memberCode: ${memberCode.text}');
    Get.offNamed(Routes.LOGIN);
  }
}
