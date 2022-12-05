import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dealer_controller.dart';

class DealerView extends GetView<DealerController> {
  const DealerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DealerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
