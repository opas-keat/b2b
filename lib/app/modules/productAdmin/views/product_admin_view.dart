import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../controllers/product_admin_controller.dart';

class ProductAdminView extends GetView<ProductAdminController> {
  const ProductAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สินค้าคงคลัง'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                // const SizedBox(height: defaultPadding * 2),
                CustomFlatButton(
                  isWrapped: true,
                  label: "เพิ่มสินค้า".toUpperCase(),
                  onPressed: () {
                    // Get.off(const RegisterView());
                    // controller.login();
                  },
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
