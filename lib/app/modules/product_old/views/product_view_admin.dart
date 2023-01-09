import 'package:b2b/app/modules/product_old/views/brand_and_model_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_flat_button.dart';
import '../../../data/category.dart';
import '../controllers/product_controller.dart';
import 'product_list_widget.dart';

class ProductViewAdmin extends StatelessWidget {
  ProductViewAdmin({super.key});
  ProductOldController controller = Get.put(ProductOldController());
  final scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // final items = sampleProducts
    //     .where((element) =>
    //         (element.categoryId == controller.brandAndModels.value))
    //     .toList();
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

                Expanded(
                  // child: ProductList(),
                  child: BrandAndModelWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({super.key});
  ProductOldController controller = Get.find<ProductOldController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductOldController>(
      init: ProductOldController(),
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
  ProductOldController controller = Get.find<ProductOldController>();

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
              // controller.addNewProduct();
              // controller.listBrandAndModel();
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
