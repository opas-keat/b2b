import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final email = TextEditingController();
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

  Future<void> sendNewPassword() async {
    debugPrint('email: ${email.text}');
    debugPrint('memberCode: ${memberCode.text}');
    Get.offNamed(Routes.LOGIN);
  }
}
