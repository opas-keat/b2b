import 'package:get/get.dart';

import '../modules/addProduct/bindings/add_product_binding.dart';
import '../modules/addProduct/views/add_product_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/dealer/bindings/dealer_binding.dart';
import '../modules/dealer/views/dealer_view.dart';
import '../modules/historyDealer/bindings/history_dealer_binding.dart';
import '../modules/historyDealer/views/history_dealer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/logging/bindings/logging_binding.dart';
import '../modules/logging/views/logging_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import 'app_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.DEALER,
      page: () => DealerView(),
      binding: DealerBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_DEALER,
      page: () => HistoryDealerView(),
      binding: HistoryDealerBinding(),
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
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: _Paths.LOGGING,
      page: () => LoggingView(),
      binding: LoggingBinding(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
      middlewares: [RouteGuard()],
    ),
  ];
}
