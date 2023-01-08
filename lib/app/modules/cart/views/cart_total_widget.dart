import 'package:b2b/shared/constants.dart';
import 'package:b2b/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/convert.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/cart_controller.dart';

class CartTotalWidget extends StatelessWidget {
  CartTotalWidget({super.key});
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
        child: Column(
          children: [
            cardTotalDetail(
              'รายการทั้งหมด',
              formatterItem.format(controller.cartTotalItem.value),
            ),
            cardTotalDetail(
              'ราคารวม',
              formatterPrice.format(controller.cartTotal.value),
            ),
            cardTotalDetail(
              'ส่วนลด',
              formatterPrice.format(controller.discount.value),
            ),
            cardTotalDetail(
              'ยอดรวมทั้งสิ้น',
              formatterPrice.format(controller.grandTotal.value),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFlatButton(
                  color: accentColor,
                  overlayColor: accentLightColor,
                  padding: const EdgeInsets.all(defaultPadding),
                  isWrapped: true,
                  label: 'ยืนยันสั่งซื้อสินค้า',
                  onPressed: () {
                    controller.confirmOrder();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row cardTotalDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: label,
          color: label == 'ยอดรวมทั้งสิ้น'
              ? Colors.amber.shade500
              : Colors.grey.shade700,
          size: 22,
          weight: label == 'ยอดรวมทั้งสิ้น' ? FontWeight.bold : FontWeight.w600,
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 150,
          child: CustomText(
            text: value,
            color: label == 'ยอดรวมทั้งสิ้น'
                ? Colors.black87
                : Colors.grey.shade700,
            size: 22,
            weight:
                label == 'ยอดรวมทั้งสิ้น' ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
