import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../../../data/sample.dart';
import '../controllers/product_admin_controller.dart';

class ProductAdminView extends StatelessWidget {
  // final isAdmin = GetStorage();
  String isAdmin = GetStorage().read('isAdmin');

  @override
  Widget build(BuildContext context) {
    debugPrint(isAdmin);
    return Scaffold(
      appBar: AppBar(
        title: const Text('สินค้าคงคลัง'),
        centerTitle: true,
      ),
      // body: DatatableProduct(),
      // body: Padding(
      //   padding: const EdgeInsets.all(defaultPadding),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: Column(
      //           children: [
      //             // menu list
      //             // const ProductList(),
      //             MenuWidget(),
      //             // product list
      //             ProductList(),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // menu list
                isAdmin == '0' ? Container() : MenuWidget(),
                // Container(),
                CategoryList(),
                // product list
                ProductList(),
              ],
            ),
          ),

          // list card
          const VerticalDivider(
            width: 12.0,
          ),
          GetBuilder<ProductAdminController>(
            builder: (controller) {
              return Container(
                width: 300,
                child: Column(
                  children: [
                    // top billing
                    Container(
                        height: 64,
                        child: const Center(child: Text("รายการสั่งซื้อ"))),

                    // list  products
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.listOrder.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(controller.listOrder[index].title),
                            trailing: Text('${controller.listOrder[index].qt}'),
                          );
                        },
                      ),
                    ),

                    // purchase
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "สั่งซื้อสินค้า",
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
              );
            },
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  ProductAdminController controller = Get.put(ProductAdminController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductAdminController>(
      init: ProductAdminController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          height: 64 + 8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sampleCategory.length,
            itemBuilder: (BuildContext context, int index) {
              // print(index);
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
  ProductAdminController controller = Get.put(ProductAdminController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductAdminController>(
      builder: (controller) {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
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
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    // add to cart
                    controller.addItem2Cart(product: items[index]);
                  },
                  child: GridTile(
                    footer: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(items[index].fTProdNameTH),
                    ),
                    child: Container(),
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
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const SizedBox(height: defaultPadding * 2),
        CustomFlatButton(
          isWrapped: true,
          label: "เพิ่ม".toUpperCase(),
          onPressed: () {},
        ),
        const SizedBox(width: defaultPadding),
        CustomFlatButton(
          color: Colors.yellow.shade600,
          isWrapped: true,
          label: "แก้ไข".toUpperCase(),
          onPressed: () {},
        ),
        const SizedBox(width: defaultPadding),
        CustomFlatButton(
          color: Colors.redAccent,
          isWrapped: true,
          label: "ลบ".toUpperCase(),
          onPressed: () {},
        ),
      ],
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
