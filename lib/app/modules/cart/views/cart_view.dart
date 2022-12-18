import 'dart:html';
import 'dart:ui';

import 'package:b2b/app/data/product.dart';
import 'package:b2b/constants.dart';
import 'package:b2b/shared/widgets/custom_flat_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/cart_order.dart';
import '../../../data/history_order.dart';
import '../controllers/cart_controller.dart';
import 'credit_widget.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  CartController controller = Get.put(CartController());
  final scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการสั่งซื้อ'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2,
                  vertical: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'คำสั่งซื้อที่ XXXX-YYYYYYYYYY',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'วันที่ 01/01/2023',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              helperText: 'บริษัทขนส่ง',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                helperText: 'วันที่นัดส่งสินค้า',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_today),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CreditWidget(),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'รายการสินค้า',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: scrollBarController,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(defaultPadding),
                          controller: scrollBarController,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "${index + 1}. ${sampleCartOrders[index].fTProdNameTH}",
                                    style: const TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "ราคา: 100 จำนวน: 2",
                                  ),
                                  trailing: Text(
                                    "200",
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: defaultPadding / 2,
                                ),
                              ],
                            );
                          },
                          itemCount: sampleCartOrders.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          const CartTotalWidget(),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     border: Border(
      //       top: BorderSide(
      //         color: Colors.lightBlue.shade900,
      //         width: 2.0,
      //       ),
      //     ),
      //   ),
      //   width: double.infinity,
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 15,
      //   ),
      //   child: Text(
      //     'สรุป',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
    );
  }
}

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "รายการทั้งหมด",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 120,
                child: Text(
                  "5",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ราคารวม",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 120,
                child: Text(
                  "100",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ส่วนลด",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 120,
                child: Text(
                  "-100",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                isWrapped: true,
                label: 'ยืนยันสั่งซื้อสินค้า',
                onPressed: () {/* ... */},
              ),
            ],
          )
        ],
      ),
    );
  }
}
