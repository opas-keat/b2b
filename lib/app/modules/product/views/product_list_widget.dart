import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../data/product.dart';
import '../controllers/product_controller.dart';

class ProductList extends StatelessWidget {
  ProductController controller = Get.find<ProductController>();
  final isAdmin = "";
  final scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final items = sampleProducts
        .where((element) =>
            (element.categoryId == controller.currentCategory.value))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 4),
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
                  controller.selectProduct(product: items[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Image.network(
                          items[index].fTProdImage,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Text(
                        items[index].fTProdNameTH,
                        style: const TextStyle(
                          // fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text("ราคา : ${items[index].fNPrice.toString()}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
