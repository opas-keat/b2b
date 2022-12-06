import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../controllers/product_admin_controller.dart';

class ProductAdminView extends GetView<ProductAdminController> {
  const ProductAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สินค้าคงคลัง'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                // const SizedBox(height: defaultPadding * 2),
                CustomFlatButton(
                  isWrapped: true,
                  label: "เพิ่มสินค้า".toUpperCase(),
                  onPressed: () {
                    // Get.off(const RegisterView());
                    // controller.login();
                  },
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: [
                      DataColumn2(
                        label: Text('รหัสสินค้า'),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: Text('รายละเอียด'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        size: ColumnSize.S,
                        label: Text('จำนวน'),
                        numeric: true,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        100,
                        (index) => DataRow(cells: [
                              DataCell(Text('A' * (10 - index % 10))),
                              DataCell(Text('D' * (15 - (index + 10) % 10))),
                              DataCell(Text(((index + 0.1) * 25.4).toString()))
                            ]))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
