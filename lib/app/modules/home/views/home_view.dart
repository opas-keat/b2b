import 'package:b2b/app/modules/dealer/views/dealer_view.dart';
import 'package:b2b/app/modules/logging/views/logging_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../data/menu.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants.dart';
import '../../product/views/product_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Row(
            children: [
              // side menu
              SideMenu(),

              Expanded(
                child: IndexedStack(
                  index: controller.navIndex.value,
                  children: [
                    ProductView(),
                    DealerView(),
                    LoggingView(),
                    ProfileView(),
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
  // HomeController controller = Get.find<HomeController>();

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
              child: SvgPicture.network(
                  "assets/icons/undraw_sweet_home_dkhr.svg",
                  fit: BoxFit.contain),
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
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    menuItems[index].title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: (controller.navIndex.value == index)
                          ? FontWeight.w800
                          : FontWeight.w300,
                    ),
                  ),
                  onTap: () {
                    if (controller.menus[index].title == 'ออกจากระบบ') {
                      nhostClient.auth.signOut();
                      Get.offNamed(Routes.SIGNIN);
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
