import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_admin_controller.dart';

class ProductAdminView extends GetView<ProductAdminController> {
  const ProductAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductAdminView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
