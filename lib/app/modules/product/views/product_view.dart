import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/constants.dart';
import '../../../shared/custom_flat_button.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);
  ProductController controller = Get.put(ProductController());
  final scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการสินค้า'),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          children: [
            // menu list
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'ค้นหา',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            MenuWidget(),
            // product list
            // GetBuilder<ProductController>(
            //     init: controller,
            //     builder: (_) {
            //       return detailForm('ชื่อสินค้า',
            //           controller.productInsert.value.name.toString(), 4);
            //     }),
            GetBuilder<ProductController>(
              init: controller,
              builder: (controller) {
                final items = controller.productList.value;
                return Expanded(
                  flex: 1,
                  child: CustomScrollView(
                    shrinkWrap: true,
                    primary: false,
                    // physics: AlwaysScrollableScrollPhysics.,
                    controller: scrollBarController,
                    slivers: [
                      SliverDynamicHeightGridView(
                        itemCount: items.length,
                        crossAxisCount: 5,
                        builder: (ctx, index) {
                          return InkWell(
                            hoverColor: Colors.grey.shade300,
                            onTap: () {
                              // controller.addItem2Cart(product: items[index]);
                              // controller.selectProduct(product: items[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.imageUrl.value[index].isNotEmpty
                                      ? SizedBox(
                                          width: 300,
                                          child: Image.network(
                                            controller.imageUrl.value[index],
                                            // 'assets/images/undraw_Add_files_re_v09g.png',
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : CircularProgressIndicator(),
                                  Text(
                                    items[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      items[index].price.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  // Text("ราคา : ${items[index].fNPrice.toString()}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: defaultPadding / 2),
            TextButton(
              onPressed: () {
                // print(controller.offset.value++);
                // controller.offset.value++;
                // print(controller.offset.value);
                // controller.update();
                // controller.listProducts();
                controller.loadMore();
              },
              child: const Text(
                'โหลดเพิ่ม',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  color: primaryLightColor,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});
  ProductController controller = Get.find<ProductController>();

  final _productCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          CustomFlatButton(
            // color: darkRedColor,
            isWrapped: true,
            label: "เพิ่มสินค้า".toUpperCase(),
            onPressed: () {
              // Get.toNamed(Routes.ADD_PRODUCT);
              Get.defaultDialog(
                title: 'เพิ่มสินค้า',
                barrierDismissible: true,
                content: Container(
                  child: SingleChildScrollView(
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
                                child: (controller
                                        .fileUpload.value.path.isNotEmpty)
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
                          builder: (_) => detailForm(
                              'ชื่อสินค้า',
                              controller.productInsert.value.name.toString(),
                              4),
                        ),
                        // const SizedBox(height: defaultPadding),
                        // detailForm('รายละเอียด', "", 4),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'ขนาด',
                              controller.productInsert.value.matSize.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'สี',
                              controller.productInsert.value.color.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'ยี่ห้อ',
                              controller.productInsert.value.brand.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'รุ่น',
                              controller.productInsert.value.model.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'ความกว้าง',
                              controller.productInsert.value.width.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'Offset',
                              controller.productInsert.value.offset.toString(),
                              1),
                        ),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'ค่าสึกหรอ',
                              controller.productInsert.value.treadWare
                                  .toString(),
                              1),
                        ),
                        detailForm('ราคา', "", 1),
                        GetBuilder<ProductController>(
                          init: controller,
                          builder: (_) => detailForm(
                              'ราคา',
                              controller.productInsert.value.price.toString(),
                              1),
                        ),
                        SizedBox(
                          width: 450,
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              labelText: 'จำนวนสินค้าในคลัง',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding,
                                  vertical: defaultPadding),
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                ),
                                onPressed: () {
                                  controller.addProduct();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(defaultPadding / 4),
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
                                  horizontal: defaultPadding,
                                  vertical: defaultPadding),
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(defaultPadding / 4),
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
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: defaultPadding),
        ],
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

// GetBuilder<ProductController>(
//               init: controller,
//               builder: (controller) {
//                 final items = controller.productList.value;
//                 return Expanded(
//                   flex: 1,
//                   child: CustomScrollView(
//                     shrinkWrap: true,
//                     primary: false,
//                     // physics: AlwaysScrollableScrollPhysics.,
//                     controller: scrollBarController,
//                     slivers: [
//                       SliverDynamicHeightGridView(
//                         itemCount: items.length,
//                         crossAxisCount: 5,
//                         builder: (ctx, index) {
//                           return InkWell(
//                             hoverColor: Colors.grey.shade300,
//                             onTap: () {
//                               // controller.addItem2Cart(product: items[index]);
//                               // controller.selectProduct(product: items[index]);
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.all(defaultPadding / 2),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   controller.imageUrl.value[index].isNotEmpty
//                                       ? SizedBox(
//                                           width: 300,
//                                           child: Image.network(
//                                             controller.imageUrl.value[index],
//                                             // 'assets/images/undraw_Add_files_re_v09g.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                         )
//                                       : CircularProgressIndicator(),
//                                   Text(
//                                     items[index].name,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: Text(
//                                       items[index].price.toString(),
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w800,
//                                       ),
//                                     ),
//                                   ),
//                                   // Text("ราคา : ${items[index].fNPrice.toString()}"),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: defaultPadding / 2),
//             TextButton(
//               onPressed: () {
//                 // print(controller.offset.value++);
//                 // controller.offset.value++;
//                 // print(controller.offset.value);
//                 // controller.update();
//                 // controller.listProducts();
//                 controller.loadMore();
//               },
//               child: const Text(
//                 'โหลดเพิ่ม',
//                 style: TextStyle(
//                   decoration: TextDecoration.underline,
//                   fontSize: 20,
//                   color: primaryLightColor,
//                 ),
//               ),
//             ),
//             const SizedBox(height: defaultPadding),
//           ],
