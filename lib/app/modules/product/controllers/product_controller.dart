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
  final imageUrl = <String>[].obs;

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

  getImageUrl(String fileId) async {
    final resultUrl = await nhostClient.storage.getPresignedUrl(fileId);
    // if (resultUrl.url.isNotEmpty) {
    //   Log.loga(logTitle, 'getImageUrl url :: ${resultUrl.url.toString()}');
    // }
    return resultUrl.url.toString();
  }

  listProducts() async {
    Log.loga(logTitle, 'listProducts::');
    try {
      final graphqlClient = createNhostGraphQLClient(nhostClient);
      var result = await graphqlClient.query(
        QueryOptions(
          document: productsQuery,
          variables: {'limit': 50, 'offset': 1},
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'listProducts:: ${result.exception}');
      }
      productsList.value = (result.data!['products'] as List)
          .map((e) => ProductsResponseQuery.fromMap(e))
          .toList();
      for (var i = 0; i < productsList.value.length; i++) {
        final u =
            await getImageUrl(productsList.value[i].productFiles.first.fileId);
        Log.loga(logTitle, 'listProducts::$u');
        imageUrl.value.add(
          u,
        );
      }
      // Log.loga(logTitle, 'listProducts after:: ${productsList.value}');
      update();
    } catch (e) {
      Log.loga(logTitle, 'listProducts:: $e');
    }
  }
}
