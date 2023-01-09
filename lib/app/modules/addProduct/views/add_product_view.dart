import 'package:b2b/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);
  final controller = Get.put(AddProductController());
  final scrollBarController = ScrollController();

  final _productCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มสินค้า'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.network(
                    'assets/images/undraw_Add_files_re_v09g.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                SizedBox(
                  width: 450,
                  child: TextField(
                    controller: _productCodeController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'รหัสสินค้า',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          controller.getProductByCode(
                            _productCodeController.text,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                // Obx(
                //   () => detailForm('ชื่อสินค้า', controller.product.value.name),
                // ),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ชื่อสินค้า',
                      controller.productInsert.value.name.toString(), 4),
                ),
                // const SizedBox(height: defaultPadding),
                // detailForm('รายละเอียด', "", 4),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ขนาด',
                      controller.productInsert.value.matSize.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm(
                      'สี', controller.productInsert.value.color.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ยี่ห้อ',
                      controller.productInsert.value.brand.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('รุ่น',
                      controller.productInsert.value.model.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ความกว้าง',
                      controller.productInsert.value.width.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('Offset',
                      controller.productInsert.value.offset.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ค่าสึกหรอ',
                      controller.productInsert.value.treadWare.toString(), 1),
                ),
                const SizedBox(height: defaultPadding),
                detailForm('ราคา', "", 1),
                GetBuilder<AddProductController>(
                  init: controller,
                  builder: (_) => detailForm('ราคา',
                      controller.productInsert.value.price.toString(), 1),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),

                        // style: const ButtonStyle(
                        //   backgroundColor: primaryColor,
                        // ),
                        onPressed: () {
                          controller.addProduct();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 4),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.gotoHome();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: Text(
                            "ย้อนกลับ",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox detailForm(String label, String value, int maxLine) {
    return SizedBox(
      width: 450,
      child: TextField(
        readOnly: true,
        minLines: 1,
        maxLines: maxLine,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
