import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_flat_button.dart';
import '../controllers/product_controller.dart';
import 'product_add.dart';
import 'product_list.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);
  ProductController controller = Get.put(ProductController());
  final scrollBarController = ScrollController();

  final _productCodeController = TextEditingController();

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
                // loading
                if (controller.isLoading.value) {
                  return Center(
                    child: const CircularProgressIndicator().reactive(),
                  );
                }
                // show data
                if (controller.productList.value.isNotEmpty) {
                  return ProductListWidget(items: controller.productList.value);
                }
                if (controller.isShowAddProduct.value) {
                  return ProductAddWidget();
                }
                return SizedBox(
                  width: 0,
                );

                // final items = controller.productList.value;
                // return ProductListWidget(items: items);
              },
            ),
            // const SizedBox(height: defaultPadding / 2),
            // TextButton(
            //   onPressed: () {
            //     // print(controller.offset.value++);
            //     // controller.offset.value++;
            //     // print(controller.offset.value);
            //     // controller.update();
            //     // controller.listProducts();
            //     controller.loadMore();
            //   },
            //   child: const Text(
            //     'โหลดเพิ่ม',
            //     style: TextStyle(
            //       decoration: TextDecoration.underline,
            //       fontSize: 20,
            //       color: primaryLightColor,
            //     ),
            //   ),
            // ),
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
              controller.showAddProduct();
            },
          ),
          const SizedBox(width: defaultPadding),
        ],
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
