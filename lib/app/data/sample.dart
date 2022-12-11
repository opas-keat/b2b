import 'package:b2b/app/data/dealer.dart';

import 'category.dart';
import 'product.dart';

List<Product> sampleProducts = [
  Product(
    fNMSysProdId: "210340020",
    fTProdCode: "1855516DLTYLM75",
    fTProdNameTH: "ยาง DUNLOP LM705 185-55-16",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product(
    fNMSysProdId: "210340021",
    fTProdCode: "2853520ZTTY07SL",
    fTProdNameTH: "ยาง ZESTINO 285-35-20 GREDGE 07RS (SILVER)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 2,
  ),
  Product(
    fNMSysProdId: "210400001",
    fTProdCode: "2457016LLD20000",
    fTProdNameTH: "ยาง LINGLONG 245-70-16  (D2)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product(
    fNMSysProdId: "210420001",
    fTProdCode: "2355018YK00AE61",
    fTProdNameTH: "ยาง YOKOHAMA BLUEARTH AE61 235-50-18",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product(
    fNMSysProdId: "210480001",
    fTProdCode: "2656517RSD20000",
    fTProdNameTH: "ยาง ROADSTONE  265-65-17  (D2)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 3,
  ),
  Product(
    fNMSysProdId: "210570002",
    fTProdCode: "1955516BSD20000",
    fTProdNameTH: "ยาง BRIDGESTONE 195-55-16  (D2)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product(
    fNMSysProdId: "210370003",
    fTProdCode: "F6R0ABGTD69DA25",
    fTProdNameTH:
        "แม็กซ์ FATTAH/F6-R(YA033) 18X9.5 6X139.7 ET25 CB.106 B-LPTG-WTG-PLATE  (สีดำ+ขอบไดร์ทอง+CNCข้างก้านไดร์ทอง+เพลท)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "2",
    fNDealerPrice1: 25,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 2,
  ),
  Product(
    fNMSysProdId: "210360004",
    fTProdCode: "3760LFRBLTGC040",
    fTProdNameTH:
        "แม็กซ์ VESA(376) 17X7.5 10X100/114.3 ET40 CB.73.1 *B-P/FACERED*  (สีหน้าไดร์แดง+ร่องดำ)Custom",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "2",
    fNDealerPrice1: 15,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product(
    fNMSysProdId: "210350008",
    fTProdCode: "MUZ0GPDSV5NFA32",
    fTProdNameTH:
        "แม็กซ์ M-UZ 20X9.0 5X113 ET32 CB.73 BRUSHED/SILVER  (สีหน้าปัดลายซิลเวอร์)",
    fTProdImage: "https://via.placeholder.com/150",
    categoryId: "2",
    fNDealerPrice1: 5,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  )
  // Product(
  //   fNMSysProdId: "10",
  //   fTProdCode: "1",
  //   fTProdNameTH: "ก๋วยเตี๋ยว",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 40,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 1,
  // ),
  // Product(
  //   fNMSysProdId: "11",
  //   fTProdCode: "1",
  //   fTProdNameTH: "เย็นตาโฟ",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 50,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // ),
  // Product(
  //   fNMSysProdId: "12",
  //   fTProdCode: "1",
  //   fTProdNameTH: "เกาหลา",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 50,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // ),
  // Product(
  //   fNMSysProdId: "13",
  //   fTProdCode: "1",
  //   fTProdNameTH: "ข้าวเปล่า",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 20,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // )
];

List<Category> sampleCategory = [
  Category(
    id: "1",
    title: "ล้อ",
  ),
  Category(
    id: "2",
    title: "ยาง",
  ),
  Category(
    id: "3",
    title: "อื่นๆ",
  ),
];

List<Dealer> sampleDealer = [
  Dealer(
    fTCustName: "ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์",
    fTCustAddressInv:
        "316 ถนนสันติภาพ แขวงป้อมปราบ เขตป้อมปราบศัตรูพ่าย กรุงเทพมหานคร 10100 ",
    fTCustPhoneInv: "โทรศัพท์ : 02-6230040   โทรสาร : ",
    status: true,
  ),
  Dealer(
    fTCustName: "ร้าน ธนสินการยาง",
    fTCustAddressInv:
        "9 ซ.สุทธิสารวินิจฉัย 1 ถ.สุทธิสารวินิจฉัย แขวงสามเสนใน เขตพญาไท กรุงเทพมหานคร 10400",
    fTCustPhoneInv: "โทรศัพท์ : 092-3592978   โทรสาร : ",
    status: false,
  ),
  Dealer(
    fTCustName: "บริษัท ซีเค คาร์ออดิโอ จำกัด",
    fTCustAddressInv:
        "1/17 หมู่ 4 ต.บางพึ่ง อ.พระประแดง    จ.สมุทรปราการ    10130",
    fTCustPhoneInv: "โทรศัพท์ : 084-209-7666,064-240-6464   โทรสาร : ",
    status: true,
  ),
  Dealer(
    fTCustName: "ห้างหุ้นส่วนจำกัด ทรัพย์สินยางยนต์",
    fTCustAddressInv:
        "16/51 หมู่ที่ 2 ต.บางหลวง อ.เมืองปทุมธานี    จ.ปทุมธานี    12000",
    fTCustPhoneInv: "โทรศัพท์ : 061-821-3441   โทรสาร : ",
    status: false,
  ),
  Dealer(
    fTCustName: "นาย วัฒนา รอดเป้า",
    fTCustAddressInv:
        "บ.เมืองไทยแคปปิตอล หมู่ 4 ต.ท่าบัว    อ.โพทะเล    จ.พิจิตร    66130",
    fTCustPhoneInv: "โทรศัพท์ : 092-257-3399   โทรสาร : ",
    status: true,
  ),
  Dealer(
    fTCustName: "บริษัท มาโนช ออโต้แม๊กซ์ จำกัด",
    fTCustAddressInv: "85/1 หมู่ 2 ต.ตะเคียนเตี้ย    อ.บางละมุง    จ.ชลบุรี",
    fTCustPhoneInv: "โทรศัพท์ : 089-9360936 ,083-1775557   โทรสาร : ",
    status: true,
  ),
];
