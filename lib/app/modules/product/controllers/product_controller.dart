import 'package:graphql/client.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';

import 'package:get/get.dart';

import '../../../data/graphql/graphql_product.dart';
import '../../../data/product.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

final logTitle = "ProductController";

class ProductController extends GetxController {
  RxString currentCategory = "1".obs;
  final productsList = <ProductsResponseQuery>[].obs;

  @override
  void onInit() {
    listProducts();
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

  listProducts() async {
    try {
      final graphqlClient = createNhostGraphQLClient(nhostClient);
      var result = await graphqlClient.query(
        QueryOptions(
          document: productsQuery,
          variables: {'limit': 50, 'offset': 1},
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'listBrandAndModel:: ${result.exception}');
      }
      final products = (result.data!['products'] as List)
          .map((e) => ProductsResponseQuery.fromMap(e))
          .toList();
      for (var element in products) {
        productsList.add(ProductsResponseQuery(
          id: element.id,
          name: element.name,
          price: element.price,
        ));
      }
      // bams.forEach((element) {
      //   Log.loga(logTitle, 'listBrandAndModel:: ${element.id}');
      //   Log.loga(logTitle, 'listBrandAndModel:: ${element.brand}');
      //   Log.loga(logTitle, 'listBrandAndModel:: ${element.model}');
      //   bamsList.value.add(BrandAndModel(
      //     brand: element.brand,
      //     model: element.model,
      //   ));
      // });
      update();
    } catch (e) {
      Log.loga(logTitle, 'listBrandAndModel:: $e');
    }
  }
}
