List<Log> sampleLog = [
  Log(
    detail: 'ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์ : เข้าสู่ระบบ',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail:
        'ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์ : สั่งสินค้า : ใบสั่งขาย XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'บริษัท มาโนช ออโต้แม๊กซ์ จำกัด : เข้าสู่ระบบ',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'ห้างหุ้นส่วนจำกัด ทรัพย์สินยางยนต์ : ลงทะเบียนสมาชิก',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : เข้าสู่ระบบ',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : เพิ่มสินค้า : รหัสสินค้า 2656517RSD20000',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : แก้ไขสินค้า : รหัสสินค้า 2355018YK00AE61',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : ลบสินค้า : รหัสสินค้า 1855516DLTYLM75',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : ปิดร้านค้า : ร้าน ธนสินการยาง',
    dateTime: DateTime.now().toString(),
  ),
  Log(
    detail: 'admin : เปิดร้านค้า : ร้าน ธนสินการยาง',
    dateTime: DateTime.now().toString(),
  ),
];

class Log {
  String detail;
  String dateTime;
  Log({
    required this.detail,
    required this.dateTime,
  });
}
