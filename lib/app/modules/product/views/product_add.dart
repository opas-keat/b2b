import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/constants.dart';
import '../controllers/product_controller.dart';

class ProductAddWidget extends StatelessWidget {
  ProductAddWidget({
    Key? key,
  }) : super(key: key);
  ProductController controller = Get.find<ProductController>();

  final _productCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 450),
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 640,
                          maxWidth: 480,
                        );
                        if (pickedFile != null) {
                          controller.fileUpload.value = pickedFile;
                          controller.update();
                        }
                      },
                      child: Obx(() => SizedBox(
                            height: 150,
                            child: (controller.fileUpload.value.path.isNotEmpty)
                                ? Image.network(
                                    controller.fileUpload.value.path,
                                    height: 150,
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.network(
                                    'assets/images/undraw_Add_files_re_v09g.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                          )),
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
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('ชื่อสินค้า',
                          controller.productInsert.value.name.toString(), 4),
                    ),
                    // const SizedBox(height: defaultPadding),
                    // detailForm('รายละเอียด', "", 4),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('ขนาด',
                          controller.productInsert.value.matSize.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('สี',
                          controller.productInsert.value.color.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('ยี่ห้อ',
                          controller.productInsert.value.brand.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('รุ่น',
                          controller.productInsert.value.model.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('ความกว้าง',
                          controller.productInsert.value.width.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('Offset',
                          controller.productInsert.value.offset.toString(), 1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm(
                          'ค่าสึกหรอ',
                          controller.productInsert.value.treadWare.toString(),
                          1),
                    ),
                    GetBuilder<ProductController>(
                      init: controller,
                      builder: (_) => detailForm('ราคา',
                          controller.productInsert.value.price.toString(), 1),
                    ),
                    // SizedBox(
                    //   width: 450,
                    //   child: TextField(
                    //     inputFormatters: <TextInputFormatter>[
                    //       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    //       FilteringTextInputFormatter.digitsOnly,
                    //     ],
                    //     onChanged: (value) {},
                    //     decoration: const InputDecoration(
                    //       labelText: 'จำนวนสินค้าในคลัง',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
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
                  onPressed: () {
                    controller.saveProduct();
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
                    controller.hideAddProduct();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding / 4),
                    child: Text(
                      "ปิด",
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
    );
  }
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
