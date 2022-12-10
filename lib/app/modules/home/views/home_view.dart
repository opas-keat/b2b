import 'package:b2b/app/modules/dealer/views/dealer_view.dart';
import 'package:b2b/app/modules/productAdmin/views/product_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../data/menu.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Row(
            children: [
              // side menu
              SideMenu(),

              // body
              Expanded(
                child: IndexedStack(
                  index: controller.navIndex.value,
                  children: [
                    ProductAdminView(),
                    DealerView(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SideMenu extends GetView<HomeController> {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: 180,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SizedBox(
              height: 150,
              child: SvgPicture.asset("icons/home.svg", fit: BoxFit.contain),
            ),
          ),
          const Text(
            "เมนูการทำงาน",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: ListView.builder(
              // itemCount: menuItemsAdmin.length,
              itemCount: controller.menus.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    controller.menus[index].title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: (controller.navIndex.value == index)
                          ? FontWeight.w800
                          : FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    // goto that view
                    controller.navIndex.value = index;
                    controller.update();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
