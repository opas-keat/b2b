import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../../../../shared/widgets/custom_text.dart';
import '../../../data/category.dart';
import '../controllers/product_controller.dart';
import 'product_detail.dart';
import 'product_list_widget.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  ProductController controller = Get.put(ProductController());
  final isAdmin = GetStorage().read('isAdmin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการสินค้า'),
        centerTitle: true,
        actions: <Widget>[
          shoppingCartBadge(),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // menu list
                const SizedBox(height: defaultPadding / 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    onChanged: (value) {
                      // setState(() {
                      //   searchString = value.toLowerCase();
                      // });
                      // controller.
                    },
                    decoration: const InputDecoration(
                      labelText: 'ค้นหา',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                isAdmin == '1' ? MenuWidget() : CategoryList(),
                // product list
                Expanded(
                  child: ProductList(),
                ),
              ],
            ),
          ),

          // list card
          isAdmin == '1'
              ? const VerticalDivider(
                  width: 12.0,
                )
              : Container(),
          isAdmin == '1'
              ? Container()
              : GetBuilder<ProductController>(
                  builder: (controller) {
                    return SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          // top billing
                          const SizedBox(
                            height: 64,
                            child: Center(
                              child: CustomText(
                                text: 'รายละเอียดสินค้า',
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),

                          ProductDetail(),

                          Container(
                            margin: const EdgeInsets.all(defaultPadding),
                            child: CustomFlatButton(
                              color: accentColor,
                              overlayColor: accentLightColor,
                              label: "เพิ่มลงตะกร้า".toUpperCase(),
                              onPressed: () {
                                controller.addItem2Cart();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class shoppingCartBadge extends StatelessWidget {
  shoppingCartBadge({super.key});
  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: defaultPadding,
      ),
      child: Badge(
        position: BadgePosition.topEnd(top: 0, end: 0),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.scale,
        badgeContent: Obx(
          () => Text(
            controller.cartTotalItem.value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          color: Colors.white,
          onPressed: () {
            controller.gotoCartOrder();
          },
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({super.key});
  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (_) {
        return SizedBox(
          height: 64 + 8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sampleCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    controller.currentCategory.value = sampleCategory[index].id;
                    controller.update();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: Text(
                        sampleCategory[index].title,
                        style: TextStyle(
                          fontWeight: (controller.currentCategory.value ==
                                  sampleCategory[index].id)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
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
              controller.addNewItem();
            },
          ),
          const SizedBox(width: defaultPadding),
        ],
      ),
    );
  }
}

// class DatatableProduct extends StatelessWidget {
//   const DatatableProduct({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(defaultPadding),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // const SizedBox(height: defaultPadding * 2),
//             ],
//           ),
//           // Expanded(
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(defaultPadding),
//           //     child: DataTable2(
//           //         columnSpacing: 12,
//           //         horizontalMargin: 12,
//           //         minWidth: 600,
//           //         smRatio: 0.75,
//           //         lmRatio: 1.5,
//           //         columns: [
//           //           DataColumn2(
//           //             label: Text('รหัสสินค้า'),
//           //             size: ColumnSize.M,
//           //           ),
//           //           DataColumn2(
//           //             label: Text('รายละเอียด'),
//           //             size: ColumnSize.L,
//           //           ),
//           //           DataColumn2(
//           //             size: ColumnSize.S,
//           //             label: Text('จำนวน'),
//           //             numeric: true,
//           //           ),
//           //         ],
//           //         rows: List<DataRow>.generate(
//           //             50,
//           //             (index) => DataRow(cells: [
//           //                   DataCell(Text('A' * (10 - index % 10))),
//           //                   DataCell(Text('D' * (15 - (index + 10) % 10))),
//           //                   DataCell(Text(((index + 0.1) * 25.4).toString()))
//           //                 ]))),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
