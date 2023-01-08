List<MenuItem> menuItems = [
  MenuItem(
    title: "รายการสินค้า",
    isShow: true,
  ),
  MenuItem(
    title: "ร้านค้า",
    isShow: true,
  ),
  MenuItem(
    title: "ประวัติการใช้งาน",
    isShow: true,
  ),
  MenuItem(
    title: "ตั้งค่า",
    isShow: true,
  ),
  MenuItem(
    title: "ออกจากระบบ",
    isShow: true,
  ),
];

class MenuItem {
  String title;
  bool isShow;
  MenuItem({
    required this.title,
    required this.isShow,
  });
}
