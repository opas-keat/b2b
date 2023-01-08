import 'package:get/get.dart';

import '../modules/addProduct/bindings/add_product_binding.dart';
import '../modules/addProduct/views/add_product_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/dealer/bindings/dealer_binding.dart';
import '../modules/dealer/views/dealer_view.dart';
import '../modules/dealerProfile/bindings/dealer_profile_binding.dart';
import '../modules/dealerProfile/views/dealer_profile_view.dart';
import '../modules/historyAdmin/bindings/history_admin_binding.dart';
import '../modules/historyAdmin/views/history_admin_view.dart';
import '../modules/historyDealer/bindings/history_dealer_binding.dart';
import '../modules/historyDealer/views/history_dealer_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.DEALER,
      page: () => DealerView(),
      binding: DealerBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_ADMIN,
      page: () => HistoryAdminView(),
      binding: HistoryAdminBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_DEALER,
      page: () => HistoryDealerView(),
      binding: HistoryDealerBinding(),
    ),
    GetPage(
      name: _Paths.DEALER_PROFILE,
      page: () => DealerProfileView(),
      binding: DealerProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
  ];
}
