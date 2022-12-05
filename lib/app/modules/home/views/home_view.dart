import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                  children: [],
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
      width: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 150,
              child: SvgPicture.asset("icons/home.svg", fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItemsAdmin.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    menuItemsAdmin[index].title,
                    textAlign: (index == 0) ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      fontWeight: (index == 0)
                          ? FontWeight.w800
                          : (controller.navIndex.value == index)
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
