import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CreditWidget extends StatelessWidget {
  CreditWidget({super.key});
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InputDecorator(
        decoration: InputDecoration(
          // suffixText: "วัน",
          // labelText: 'การจ่ายเงิน',
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade900),
          ),
          helperText: 'การจ่ายเงิน',
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            elevation: 0,
            // hint: Text("การจ่ายเงิน", style: TextStyle(color: Colors.grey)),
            value: controller.currentCredit!.value,
            isDense: true,
            // menuMaxHeight: 400,
            style: TextStyle(
              fontSize: 18,
            ),
            onChanged: (newValue) {
              controller.currentCredit!.value = newValue!;
            },
            items: controller.optionCreditType.entries.map((item) {
              return DropdownMenuItem<String>(
                value: item.key,
                child: Text(item.value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
