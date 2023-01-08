import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/logging_controller.dart';

class LoggingView extends GetView<LoggingController> {
  const LoggingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoggingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoggingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
