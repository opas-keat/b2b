import 'package:b2b/app/data/cart_order.dart';
import 'package:b2b/app/modules/home/controllers/home_controller.dart';
import 'package:b2b/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/order.dart';
import '../../../data/product.dart';
import '../../cart/controllers/cart_controller.dart';

class SelectedProduct {
  String fNMSysProdId = "";
  String fTProdCode = "";
  String fTProdNameTH = "";
  String fTProdImage = "";
  String categoryId = "";
  int fNDealerPrice1 = 0;
  int priceCredit = 0;
  int fNPrice = 0;
  int fNQuantityBal = 0;
}

class ProductController extends GetxController {
  RxString currentCategory = "1".obs;
  RxList<OrderItem> listOrder = <OrderItem>[].obs;
  RxInt cartTotalItem = 0.obs;
  final selectedProduct = SelectedProduct().obs;

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

  addNewItem() {
    // Get.dialog(const Center(child: CircularProgressIndicator()),
    //     barrierDismissible: false);
    // Get.defaultDialog(
    //   radius: 10.0,
    //   contentPadding: const EdgeInsets.all(20.0),
    //   title: 'เพิ่มสินค้า',
    //   // middleText: responseLogin,
    //   content: Container(),
    //   textConfirm: 'Okay',
    //   confirm: OutlinedButton.icon(
    //     onPressed: () => Get.back(),
    //     icon: Icon(
    //       Icons.close,
    //       color: Colors.red.shade700,
    //     ),
    //     label: const Text(
    //       'ปิด',
    //       style: TextStyle(color: Colors.blue),
    //     ),
    //   ),
    // );
    Get.toNamed(Routes.ADD_PRODUCT);
  }

  selectProduct({required Product product}) {
    selectedProduct.value.fTProdNameTH = product.fTProdNameTH;
    selectedProduct.value.fTProdCode = product.fTProdCode;
    selectedProduct.value.fTProdImage = product.fTProdImage;
    selectedProduct.value.fNPrice = product.fNPrice;
    selectedProduct.value.fNDealerPrice1 = product.fNDealerPrice1;
    selectedProduct.value.fNQuantityBal = product.fNQuantityBal;
    update();
  }

  addItem2Cart() {
    // addItem2Cart({required Product product}) {
    // OrderItem? orderExist = listOrder.firstWhereOrNull(
    //     (element) => (element.productId == product.fNMSysProdId));

    // if (orderExist != null) {
    //   orderExist.qt = orderExist.qt + 1;
    //   orderExist.total = orderExist.price * orderExist.qt;
    // } else {
    //   listOrder.add(
    //     OrderItem(
    //       productId: product.fNMSysProdId,
    //       title: product.fTProdNameTH,
    //       qt: 1,
    //       price: product.fNDealerPrice1,
    //       total: (product.fNDealerPrice1) * 1,
    //     ),
    //   );
    // }
    // addItemToCartOrder(product);
    // update();
    cartTotalItem.value += 1;
  }

  addItemToCartOrder(Product product) {
    CartController cartController = Get.find<CartController>();

    CartOrder? cartOrderExist = cartController.cartOrders.firstWhereOrNull(
        (element) => (element.fNMSysProdId == product.fNMSysProdId));

    if (cartOrderExist != null) {
      cartOrderExist.quantity = cartOrderExist.quantity + 1;
    } else {
      cartController.cartOrders.add(
        CartOrder(
          fNMSysProdId: product.fNMSysProdId,
          fTProdCode: product.fTProdCode,
          fTProdNameTH: product.fTProdNameTH,
          fNDealerPrice1: product.fNDealerPrice1,
          priceCredit: 0,
          fNPrice: product.fNPrice,
          fNQuantityBal: product.fNQuantityBal,
          quantity: 1,
        ),
      );
    }
    cartController.updateCartOrder();
  }

  gotoCartOrder() {
    HomeController homeController = Get.find<HomeController>();
    homeController.navIndex.value = 1;
  }
}
