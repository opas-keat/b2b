import 'package:get/get.dart';

class CartController extends GetxController {
  final RxString? currentCredit = '1'.obs;
  final Map<String, String> optionCreditType = {
    // '0': 'การจ่ายเงิน',
    '1': 'เงินสด',
    '2': 'เครดิต 7 วัน',
    '3': 'เครดิต 15 วัน',
    '4': 'เครดิต 30 วัน',
    '5': 'เครดิต 60 วัน',
    '6': 'เครดิต 90 วัน',
  };

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
