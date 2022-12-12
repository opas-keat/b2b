List<MenuItem2> menuItems = [
  MenuItem2(
    title: 'สินค้าคงคลัง',
    isAdmin: '1',
  ),
  MenuItem2(
    title: "ร้านค้า",
    isAdmin: '1',
  ),
  // MenuItem2(
  //   title: "ตั้งค่า admin",
  //   isAdmin: '1',
  // ),
  MenuItem2(
    title: "ประวัติการใช้งาน",
    isAdmin: '1',
  ),
  MenuItem2(
    title: "รายการสินค้า",
    isAdmin: '0',
  ),
  MenuItem2(
    title: "รายการสั่งซื้อ",
    isAdmin: '0',
  ),
  // MenuItem2(
  //   title: "ประวัติการสั่งซื้อ",
  //   isAdmin: '0',
  // ),
  MenuItem2(
    title: "ตั้งค่า",
    isAdmin: '0',
  ),
  // MenuItem(
  //   title: "รายงาน",
  // ),
  MenuItem2(
    title: "ออกจากระบบ",
    isAdmin: '2',
  ),
];

class MenuItem2 {
  String title;
  String isAdmin;
  MenuItem2({
    required this.title,
    required this.isAdmin,
  });
}
