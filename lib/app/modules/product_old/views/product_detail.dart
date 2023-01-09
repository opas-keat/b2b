import 'package:b2b/app/shared/constants.dart';
import 'package:b2b/app/shared/convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/custom_text.dart';
import '../controllers/product_controller.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key});
  ProductOldController controller = Get.find<ProductOldController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.selectedProduct.value.fTProdNameTH != ""
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Image.network(
                    controller.selectedProduct.value.fTProdImage,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                label('ชื่อสินค้า'),
                detail(controller.selectedProduct.value.fTProdNameTH),
                label('รหัสสินค้า'),
                detail(controller.selectedProduct.value.fTProdCode),
                label('ราคาแนะนำ'),
                detail(formatterPrice
                    .format(controller.selectedProduct.value.fNPrice)),
                label('ราคาร้านค้า'),
                detail(formatterPrice
                    .format(controller.selectedProduct.value.fNDealerPrice1)),
                label('จำนวน'),
                detail(controller.selectedProduct.value.fNQuantityBal <= 4
                    ? controller.selectedProduct.value.fNQuantityBal.toString()
                    : '4+'),
              ],
            )
          : Container(),
    );
  }

  Padding detail(String detail) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        bottom: defaultPadding,
      ),
      child: CustomText(
        text: detail,
        size: 14,
      ),
    );
  }

  CustomText label(String label) {
    return CustomText(
      text: label,
      weight: FontWeight.bold,
    );
  }
}
