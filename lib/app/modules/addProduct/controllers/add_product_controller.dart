import 'package:b2b/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../data/constants.dart';
import '../../../data/product.dart';

class AddProductController extends GetxController {
  final isAdmin = GetStorage().read('isAdmin');

  Rx<Product> product = Product(
    id: '',
    code: '',
    name: '',
    matSize: '',
    color: '',
    brand: '',
    model: '',
    width: '',
    offset: '',
    treadWare: '',
    pitchCircleCode: '',
    price: 0,
    dealerPrice1: 0,
    groupCode: '',
  ).obs;
  // RxString productName = "".obs;

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

  getProductByCode(String productCode) async {
    debugPrint(productCode);
    productCode = "99934BEXM6FD025P";
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final res = await apiUtils.get(
        url:
            "${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkProducts}/$productCode",
      );
      Get.back();
      ProductResponseModel productResponseModel =
          ProductResponseModel.fromJson(res.data);
      product.value.id = productResponseModel.data!.id;
      product.value.code = productResponseModel.data!.code;
      product.value.name = productResponseModel.data!.name;
      product.value.matSize = productResponseModel.data!.matSize;
      product.value.color = productResponseModel.data!.color;
      product.value.brand = productResponseModel.data!.brand;
      product.value.model = productResponseModel.data!.model;
      product.value.width = productResponseModel.data!.width;
      product.value.offset = productResponseModel.data!.offset;
      product.value.treadWare = productResponseModel.data!.treadWare;
      product.value.pitchCircleCode =
          productResponseModel.data!.pitchCircleCode;
      product.value.groupCode = productResponseModel.data!.groupCode;
      update();
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

  addProduct() async {
    debugPrint(product.value.name);
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final res = await apiUtils.post(
        url: Api.baseUrlProducts,
        data: product.toJson(),
      );
      Get.back();
    } catch (e) {
      Get.back();
    }

    // Get.toNamed(Routes.HOME);
  }

  gotoHome() {
    Get.offNamed(Routes.HOME);
  }
}
