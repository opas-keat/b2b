import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/order.dart';
import '../../../data/product.dart';

class ProductController extends GetxController {
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

  addNewItem() {
    // Get.dialog(const Center(child: CircularProgressIndicator()),
    //     barrierDismissible: false);
    // Get.defaultDialog(
    //   radius: 10.0,
    //   contentPadding: const EdgeInsets.all(20.0),
    //   title: 'เพิ่มสินค้า',
    //   // middleText: responseLogin,
    //   content: Container(),
    //   textConfirm: 'Okay',
    //   confirm: OutlinedButton.icon(
    //     onPressed: () => Get.back(),
    //     icon: Icon(
    //       Icons.close,
    //       color: Colors.red.shade700,
    //     ),
    //     label: const Text(
    //       'ปิด',
    //       style: TextStyle(color: Colors.blue),
    //     ),
    //   ),
    // );
  }

  addItem2Cart({required Product product}) {
    // add to cart
    OrderItem? orderExist = listOrder.firstWhereOrNull(
        (element) => (element.productId == product.fNMSysProdId));

    if (orderExist != null) {
      orderExist.qt = orderExist.qt + 1;
      orderExist.total = orderExist.price * orderExist.qt;
    } else {
      listOrder.add(
        OrderItem(
          productId: product.fNMSysProdId,
          title: product.fTProdNameTH,
          qt: 1,
          price: product.fNDealerPrice1,
          total: (product.fNDealerPrice1) * 1,
        ),
      );
    }

    update();
  }
}
