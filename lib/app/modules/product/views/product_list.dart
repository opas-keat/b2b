import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/product.dart';
import '../../../shared/constants.dart';
import '../controllers/product_controller.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({
    Key? key,
    required this.items,
  }) : super(key: key);
  ProductController controller = Get.find<ProductController>();

  final List<ProductsResponseQuery> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CustomScrollView(
        shrinkWrap: true,
        primary: false,
        slivers: [
          SliverDynamicHeightGridView(
            itemCount: items.length,
            crossAxisCount: 5,
            builder: (ctx, index) {
              return InkWell(
                hoverColor: Colors.grey.shade300,
                onTap: () {
                  
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
  }
}
