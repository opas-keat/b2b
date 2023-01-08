import 'dart:ui';

import 'package:b2b/app/shared/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'cart_total_widget.dart';
import 'payment_channel_widget.dart';

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
                          child: PaymentChannelWidget(),
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
                                    "${index + 1}. ${controller.cartOrders[index].fTProdNameTH}",
                                    style: const TextStyle(
                                      // color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "ราคา: ${controller.cartOrders[index].fNDealerPrice1} จำนวน: ${controller.cartOrders[index].quantity}",
                                  ),
                                  trailing: Text(
                                    '${(controller.cartOrders[index].fNDealerPrice1 * controller.cartOrders[index].quantity)}',
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
                          itemCount: controller.cartOrders.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          CartTotalWidget(),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
