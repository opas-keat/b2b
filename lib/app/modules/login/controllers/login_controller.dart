import 'dart:html';

import 'package:b2b/app/api/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api/api.dart';
import '../../../api/api_utils.dart';
import '../../../data/constants.dart';
import '../../../models/login_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var response = <LoginResponse>{}.obs;

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

  Future<void> login(String email, String password, String dealerCode) async {
    debugPrint('user: ${email}');
    debugPrint('pass: ${password}');
    debugPrint('code: ${dealerCode}');
    email = "admin@ppsw.com";
    password = "P@ssw0rd";
    dealerCode = "99999999";
    var login = LoginRequest(
      email: email,
      dealerCode: dealerCode,
      password: password,
    );

    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final res = await apiUtils.post(
        url: Api.baseUrlMembers + ApiEndPoints.membersLogin,
        data: login.toJson(),
      );
      Get.back();
      LoginResponse loginResponse = LoginResponse.fromJson(res.data);
      // debugPrint(loginResponseModel.statusCode.toString());
      // debugPrint(loginResponseModel.code);
      // debugPrint(loginResponseModel.message);
      // debugPrint(loginResponseModel.data?.accessToken.toString());
      if (loginResponse.data.accessToken.toString() != "") {
        window.localStorage["token"] =
            loginResponse.data.accessToken.toString();
        isAdmin.write('isAdmin', dealerCode != "99999999" ? '0' : '1');
        Get.offNamed(Routes.HOME);
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: '',
        middleText: constants.INVALID_EMAIL_OR_PASSWORD,
        textConfirm: 'Okay',
        confirm: OutlinedButton.icon(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close,
            color: Colors.red.shade700,
          ),
          label: const Text(
            'ปิด',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
    }
  }

  void register() {
    Get.offNamed(Routes.REGISTER);
  }

  void forgotPassword() {
    Get.offNamed(Routes.FORGOT_PASSWORD);
  }
}
