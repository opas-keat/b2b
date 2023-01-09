// import 'dart:html';
import 'package:graphql/client.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../data/cart_order.dart';
import '../../../data/graphql/graphql_product.dart';
import '../../../data/order.dart';
import '../../../data/product.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';
import '../../cart/controllers/cart_controller.dart';

final logTitle = "ProductController";

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
  final bamsList = <BrandAndModel>[].obs;

  Rx<ProductBrandAndModelResponseModel> brandAndModels =
      ProductBrandAndModelResponseModel(
    data: BrandAndModelList(rows: <BrandAndModel>[]),
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    listBrandAndModel();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addNewProduct() {
    Get.toNamed(Routes.ADD_PRODUCT);
  }

  listBrandAndModel() async {
    //   debugPrint("listBrandAndModel");
    //   Get.dialog(
    //     const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //     barrierDismissible: false,
    //   );
    try {
      //     String token = window.localStorage["token"].toString();
      //     final res = await apiUtils.post(
      //       url: "${Api.baseUrlProducts}${ApiEndPoints.productListBrandAndModel}",
      //       options: Options(
      //         headers: {"Authorization": "Bearer " + token},
      //       ),
      //       data: ProductBrandAndModelRequestModel(
      //         limit: 10,
      //         offset: 0,
      //         criteria: ProductBrandAndModelCriteria(
      //           productType: "1",
      //         ),
      //       ),
      //     );
      //     Get.back();
      //     brandAndModels.value =
      //         ProductBrandAndModelResponseModel.fromJson(res.data);
      //     // ProductBrandAndModelResponseModel pBAMResponeModel =
      //     //     ProductBrandAndModelResponseModel.fromJson(res.data);
      //     // BrandAndModelList brandAndModelList =
      //     //     BrandAndModelList.fromJson(productBamResModel.data);
      //     // debugPrint(pBAMResponeModel.statusCode.toString());
      //     update();
      final graphqlClient = createNhostGraphQLClient(nhostClient);
      var result = await graphqlClient.query(
        QueryOptions(
          document: listBrandAndModelQuery,
          // variables: {
          //   'product': productInsert.value,
          // },
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'listBrandAndModel:: ${result.exception}');
      }
      final bams = (result.data!['products'] as List)
          .map((e) => BrandAndModelResponseQuery.fromMap(e))
          .toList();
      bams.forEach((element) {
        Log.loga(logTitle, 'listBrandAndModel:: ${element.id}');
        Log.loga(logTitle, 'listBrandAndModel:: ${element.brand}');
        Log.loga(logTitle, 'listBrandAndModel:: ${element.model}');
        bamsList.value.add(BrandAndModel(
          brand: element.brand,
          model: element.model,
        ));
      });
      update();
    } catch (e) {
      Log.loga(logTitle, 'listBrandAndModel:: $e');
    }
  }

  selectProduct({required Product2 product}) {
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

  addItemToCartOrder(Product2 product) {
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
    // HomeController homeController = Get.find<HomeController>();
    // homeController.navIndex.value = 1;
  }
}
