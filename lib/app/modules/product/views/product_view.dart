import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../../../data/category.dart';
import '../../../data/product.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  final isAdmin = GetStorage().read('isAdmin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการสินค้า'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // menu list
                isAdmin == '1' ? MenuWidget() : CategoryList(),
                // product list
                ProductList(),
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
                              child: Text(
                                "รายการสั่งซื้อ",
                              ),
                            ),
                          ),

                          // list  products
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.listOrder.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title:
                                      Text(controller.listOrder[index].title),
                                  trailing:
                                      Text('${controller.listOrder[index].qt}'),
                                );
                              },
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.all(defaultPadding),
                            child: CustomFlatButton(
                              color: accentColor,
                              overlayColor: accentLightColor,
                              label: "สั่งซื้อสินค้า".toUpperCase(),
                              onPressed: () {
                                controller.gotoCartOrder();
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

class CategoryList extends StatelessWidget {
  CategoryList({super.key});
  ProductController controller = Get.put(ProductController());

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

class ProductList extends StatelessWidget {
  ProductController controller = Get.put(ProductController());
  final isAdmin = GetStorage().read('isAdmin');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(defaultPadding / 2),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: defaultPadding / 2,
              childAspectRatio: isAdmin == '1' ? 0.60 : 0.50,
              maxCrossAxisExtent: 300,
            ),
            itemCount: sampleProducts
                .where((element) =>
                    (element.categoryId == controller.currentCategory.value))
                .toList()
                .length,
            itemBuilder: (BuildContext context, int index) {
              final items = sampleProducts
                  .where((element) =>
                      (element.categoryId == controller.currentCategory.value))
                  .toList();
              return InkWell(
                onTap: () {
                  // add to cart
                  controller.addItem2Cart(product: items[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(items[index].fTProdNameTH),
                      SizedBox(
                        width: 300,
                        child: Image.network(items[index].fTProdImage),
                      ),
                      Text(
                        items[index].fTProdNameTH,
                        style: const TextStyle(
                          // fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text("ราคาขาย : ${items[index].fNPrice.toString()}"),
                      Text(
                          "ราคาเงินสด : ${items[index].fNDealerPrice1.toString()}"),
                      Text(
                          "ราคาเครดิต : ${items[index].priceCredit.toString()}"),
                      Text(
                          "มีสินค้า : ${items[index].fNQuantityBal <= 4 ? items[index].fNQuantityBal.toString() : '4+'}"),
                    ],
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
  ProductController controller = Get.put(ProductController());

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

class DatatableProduct extends StatelessWidget {
  const DatatableProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              // const SizedBox(height: defaultPadding * 2),
            ],
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(defaultPadding),
          //     child: DataTable2(
          //         columnSpacing: 12,
          //         horizontalMargin: 12,
          //         minWidth: 600,
          //         smRatio: 0.75,
          //         lmRatio: 1.5,
          //         columns: [
          //           DataColumn2(
          //             label: Text('รหัสสินค้า'),
          //             size: ColumnSize.M,
          //           ),
          //           DataColumn2(
          //             label: Text('รายละเอียด'),
          //             size: ColumnSize.L,
          //           ),
          //           DataColumn2(
          //             size: ColumnSize.S,
          //             label: Text('จำนวน'),
          //             numeric: true,
          //           ),
          //         ],
          //         rows: List<DataRow>.generate(
          //             50,
          //             (index) => DataRow(cells: [
          //                   DataCell(Text('A' * (10 - index % 10))),
          //                   DataCell(Text('D' * (15 - (index + 10) % 10))),
          //                   DataCell(Text(((index + 0.1) * 25.4).toString()))
          //                 ]))),
          //   ),
          // ),
        ],
      ),
    );
  }
}
