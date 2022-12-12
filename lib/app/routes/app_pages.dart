import 'package:get/get.dart';

import '../modules/dealer/bindings/dealer_binding.dart';
import '../modules/dealer/views/dealer_view.dart';
import '../modules/historyAdmin/bindings/history_admin_binding.dart';
import '../modules/historyAdmin/views/history_admin_view.dart';
import '../modules/historyDealer/bindings/history_dealer_binding.dart';
import '../modules/historyDealer/views/history_dealer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
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
  ];
}
