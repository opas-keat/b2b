import 'package:b2b/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);
  final controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มสินค้า'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.network(
                  'images/undraw_Add_files_re_v09g.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 450,
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'รหัสสินค้า',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 450,
                child: TextField(
                  // keyboardType: TextInputType.multiline,
                  // minLines: 4,
                  // maxLines: 4,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'รายละเอียด',
                    // suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 450,
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'จำนวนสินค้าในคลัง',
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addProduct();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Text(
                      "บันทึก",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}