import 'package:b2b/app/modules/dealer/views/dealer_view.dart';
import 'package:b2b/app/modules/dealerProfile/views/dealer_profile_view.dart';
import 'package:b2b/app/modules/historyAdmin/views/history_admin_view.dart';
import 'package:b2b/app/modules/historyDealer/views/history_dealer_view.dart';
import 'package:b2b/app/modules/product/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  String isAdmin = GetStorage().read('isAdmin');
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
                  children: isAdmin == '1'
                      ? [
                          ProductView(),
                          DealerView(),
                          HistoryAdminView(),
                        ]
                      : [
                          ProductView(),
                          HistoryDealerView(),
                          DealerProfileView(),
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
              child: SvgPicture.network("icons/home.svg", fit: BoxFit.contain),
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
                    if (controller.menus[index].title == 'ออกจากระบบ') {
                      Get.offNamed(Routes.LOGIN);
                    } else {
                      controller.navIndex.value = index;
                      controller.update();
                    }
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
