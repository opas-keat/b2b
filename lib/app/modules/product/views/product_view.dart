import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:get/get.dart';

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
      body: Column(
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
              final items = controller.productsList.value;
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
                                    // fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  items[index].price.toString(),
                                  style: const TextStyle(
                                    // fontSize: 24,
                                    fontWeight: FontWeight.w800,
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
          // Expanded(
          //     // child: ProductList(),
          //     // child: BrandAndModelWidget(),

          //     ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});
  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CustomFlatButton(
            // color: darkRedColor,
            isWrapped: true,
            label: "เพิ่มสินค้า".toUpperCase(),
            onPressed: () {
              Get.toNamed(Routes.ADD_PRODUCT);
            },
          ),
          const SizedBox(width: defaultPadding),
        ],
      ),
    );
  }
}
