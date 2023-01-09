import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../controllers/product_controller.dart';

class BrandAndModelWidget extends StatelessWidget {
  ProductOldController controller = Get.find<ProductOldController>();
  final scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // return Text("BrandAndModelWidget");
    // final items = controller.brandAndModels.value.data!.rows!.toList();
    return Obx(() {
      final items = controller.brandAndModels.value.data!.rows!.toList();
      return CustomScrollView(
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
                      // SizedBox(
                      //   width: 300,
                      //   child: Image.network(
                      //     controller.brandAndModels.value.data!.rows![index].brand,
                      //     fit: BoxFit.scaleDown,
                      //   ),
                      // ),
                      Text(
                        "ยี่ห้อ: ${items[index].brand}",
                        style: const TextStyle(
                          // fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "รุ่น: ${items[index].model}",
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
      );
    });
  }
}
