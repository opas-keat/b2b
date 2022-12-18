import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../data/cart_order.dart';

class CartController extends GetxController {
  final RxList<CartOrder> cartOrders = sampleCartOrders.obs;

  final RxInt cashDiscount = cashDiscountPercent.obs;
  final RxString currentPaymentChannel = '1'.obs;

  final RxInt cartTotalItem = 0.obs;
  final RxDouble cartTotal = 0.0.obs;
  final RxDouble discount = 0.0.obs;
  final RxDouble grandTotal = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    updateCartTotalItem();
    updateTotal();
    updateDiscount();
    updateGrandTotal();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updatePaymentChannel(String value) {
    currentPaymentChannel.value = value;
    updateDiscount();
    updateGrandTotal();
  }

  updateCartTotalItem() {
    cartTotalItem.value = cartOrders.length;
  }

  updateTotal() {
    int tempPrice = 0;
    for (var order in cartOrders) {
      tempPrice += (order.fNDealerPrice1 * order.quantity);
    }
    cartTotal.value = tempPrice / 1;
  }

  updateDiscount() {
    if (currentPaymentChannel.value == '1') {
      discount.value = (cartTotal.value * cashDiscount.value) / 100;
    } else {
      discount.value = cartTotal.value;
    }
  }

  updateGrandTotal() {
    grandTotal.value = cartTotal.value - discount.value;
  }

  confirmOrder() {
    sampleCartOrders.removeWhere((item) => item.fNMSysProdId == '777777');
    cartOrders.value = sampleCartOrders;
    updateCartTotalItem();
    updateTotal();
    updateDiscount();
    updateGrandTotal();
  }
}
