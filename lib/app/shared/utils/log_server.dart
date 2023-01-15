class LogServer {
  static const logActionLogin = "เข้าสู่ระบบ"; // admin, dealer : finish
  static const logActionAddProduct = "เพิ่มสินค้า"; // admin : finish
  static const logActionEditProduct = "แก้ไขสินค้า"; // admin
  static const logActionDelete = "ลบสินค้า"; //admin
  static const logActionDisableDealer = "ปิดร้านค้า"; // admin : finish
  static const logActionEnableDealer = "เปิดร้านค้า"; //admin : finish
  static const logActionRegister = "ลงทะเบียนสมาชิก"; //dealer : finish
  static const logActionOrder = "สั่งสินค้า"; //dealer

  static bool logLogin() {
    // detail: 'ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์ : เข้าสู่ระบบ',
    const name = '';
    const detail = '$name : $logActionLogin';
    return true;
  }
}
