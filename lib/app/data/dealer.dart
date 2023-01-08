// List<Dealer> sampleDealer = [
//   Dealer(
//     fTCustName: 'ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์',
//     fTCustAddressInv:
//         '316 ถนนสันติภาพ แขวงป้อมปราบ เขตป้อมปราบศัตรูพ่าย กรุงเทพมหานคร 10100 ',
//     fTCustPhoneInv: 'โทรศัพท์ : 02-6230040   โทรสาร : ',
//     status: true,
//   ),
//   Dealer(
//     fTCustName: 'ร้าน ธนสินการยาง',
//     fTCustAddressInv:
//         '9 ซ.สุทธิสารวินิจฉัย 1 ถ.สุทธิสารวินิจฉัย แขวงสามเสนใน เขตพญาไท กรุงเทพมหานคร 10400',
//     fTCustPhoneInv: 'โทรศัพท์ : 092-3592978   โทรสาร : ',
//     status: false,
//   ),
//   Dealer(
//     fTCustName: 'บริษัท ซีเค คาร์ออดิโอ จำกัด',
//     fTCustAddressInv:
//         '1/17 หมู่ 4 ต.บางพึ่ง อ.พระประแดง    จ.สมุทรปราการ    10130',
//     fTCustPhoneInv: 'โทรศัพท์ : 084-209-7666,064-240-6464   โทรสาร : ',
//     status: true,
//   ),
//   Dealer(
//     fTCustName: 'ห้างหุ้นส่วนจำกัด ทรัพย์สินยางยนต์',
//     fTCustAddressInv:
//         '16/51 หมู่ที่ 2 ต.บางหลวง อ.เมืองปทุมธานี    จ.ปทุมธานี    12000',
//     fTCustPhoneInv: 'โทรศัพท์ : 061-821-3441   โทรสาร : ',
//     status: false,
//   ),
//   Dealer(
//     fTCustName: 'นาย วัฒนา รอดเป้า',
//     fTCustAddressInv:
//         'บ.เมืองไทยแคปปิตอล หมู่ 4 ต.ท่าบัว    อ.โพทะเล    จ.พิจิตร    66130',
//     fTCustPhoneInv: 'โทรศัพท์ : 092-257-3399   โทรสาร : ',
//     status: true,
//   ),
//   Dealer(
//     fTCustName: 'บริษัท มาโนช ออโต้แม๊กซ์ จำกัด',
//     fTCustAddressInv: '85/1 หมู่ 2 ต.ตะเคียนเตี้ย    อ.บางละมุง    จ.ชลบุรี',
//     fTCustPhoneInv: 'โทรศัพท์ : 089-9360936 ,083-1775557   โทรสาร : ',
//     status: true,
//   ),
// ];

// class Dealer {
//   // int fNMSysCustId;
//   // String fTCustCode;
//   String fTCustName;
//   String fTCustAddressInv;
//   String fTCustPhoneInv;
//   // double fNCreditAmt;
//   // double fNUsedAmt;
//   // double fNCreditBal;
//   // String fTStateCheckTarget;
//   // int fNTargetAmt;
//   // String fTStateLockSO;
//   // String fTStateLockSONote;
//   bool status;
//   Dealer({
//     // required this.fNMSysCustId,
//     // required this.fTCustCode,
//     required this.fTCustName,
//     required this.fTCustAddressInv,
//     required this.fTCustPhoneInv,
//     // required this.fNCreditAmt,
//     // required this.fNUsedAmt,
//     // required this.fNCreditBal,
//     // required this.fTStateCheckTarget,
//     // required this.fNTargetAmt,
//     // required this.fTStateLockSO,
//     // required this.fTStateLockSONote,
//     required this.status,
//   });
// }

import 'dart:convert';

class DealerResponseSubscription {
  DealerResponseSubscription({
    required this.id,
    required this.dealerCode,
    required this.name,
    required this.address,
    required this.phone,
    required this.disabled,
  });

  String id;
  String dealerCode;
  String name;
  String address;
  String phone;
  bool disabled;

  factory DealerResponseSubscription.fromMap(Map<String, dynamic> json) =>
      DealerResponseSubscription(
        id: json['id'],
        dealerCode: json['dealer_code'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        disabled: json['disabled'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'dealer_code': dealerCode,
        'name': name,
        'address': address,
        'phone': phone,
        'disabled': disabled,
      };

  factory DealerResponseSubscription.fromJson(Map<String, dynamic> json) =>
      DealerResponseSubscription(
        id: json["id"],
        dealerCode: json["dealer_code"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dealer_code": dealerCode,
        "name": name,
        "address": address,
        "phone": phone,
        "disabled": disabled,
      };
}
