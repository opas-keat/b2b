import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';

import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../api/services/logs_service.dart';
import '../../../data/graphql/graphql_logs.dart';
import '../../../data/graphql/graphql_product.dart';
import '../../../data/graphql/graphql_product_file.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../data/product.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

class ProductController extends GetxController {
  final logTitle = "ProductController";
  RxBool isLoading = true.obs;
  RxBool isShowAddProduct = false.obs;

  final productsResponseQuery = <ProductsResponseQuery>[].obs;
  final productList = <ProductsResponseQuery>[].obs;
  final imageUrl = <String>[].obs;
  final offset = 0.obs;
  final limit = 20.obs;

  Rx<String> filePath = ''.obs;
  Rx<XFile> fileUpload = XFile('').obs;
  Rx<ProductInsert> productInsert = ProductInsert(
    name: '',
    brand: '',
    model: '',
    code: '',
    color: '',
    matSize: '',
    width: '',
    treadWare: '',
    offset: '',
    pitchCircleCode: '',
    price: 0,
    dealerPrice1: 0,
  ).obs;

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

  showAddProduct() {
    productList.clear();
    isLoading.value = false;
    isShowAddProduct.value = true;
    update();
  }

  hideAddProduct() {
    isLoading.value = true;
    isShowAddProduct.value = false;
    productList.clear();
    update();
    listProducts();
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
          variables: {
            'limit': limit.value,
            'offset': (offset.value * limit.value)
          },
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'listProducts:: ${result.exception}');
      }
      // Log.loga(logTitle, 'listProducts:: ${result.data!}');
      productsResponseQuery.value = (result.data!['products'] as List)
          .map((e) => ProductsResponseQuery.fromMap(e))
          .toList();
      for (var i = 0; i < productsResponseQuery.value.length; i++) {
        final u = await getImageUrl(
            productsResponseQuery.value[i].productFiles.first.fileId);
        // Log.loga(logTitle, 'listProducts::$u');
        productList.value.add(productsResponseQuery.value[i]);
        imageUrl.value.add(
          u,
        );
      }
      // Log.loga(logTitle, 'listProducts after:: ${productsList.value}');
      update();
      isLoading.value = false;
    } catch (e) {
      Log.loga(logTitle, 'listProducts:: $e');
      isLoading.value = false;
    }
  }

  loadMore() async {
    offset.value++;
    Log.loga(logTitle, 'listProducts::' + offset.value.toString());
    listProducts();
  }

  setInitProduct() {
    productInsert.value = ProductInsert(
      name: '',
      brand: '',
      model: '',
      code: '',
      color: '',
      matSize: '',
      width: '',
      treadWare: '',
      offset: '',
      pitchCircleCode: '',
      price: 0,
      dealerPrice1: 0,
    );
    update();
  }

  getProductByCode(String productCode) async {
    Log.loga(logTitle, 'getProductByCode::' + productCode);
    // productCode = "99934BEXM6FD025P";
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final userId = nhostClient.auth.currentUser!.id;
      Log.loga(logTitle, 'getProductByCode before:: ${userId}');
      final res = await apiUtils.get(
        url:
            "${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkProducts}/$productCode",
      );
      Get.back();
      final productResponseModel = ProductResponseModel.fromJson(res.data);
      productInsert.value.linkId = productResponseModel.data!.id;
      productInsert.value.code = productResponseModel.data!.code;
      productInsert.value.name = productResponseModel.data!.name;
      productInsert.value.matSize = productResponseModel.data!.matSize;
      productInsert.value.color = productResponseModel.data!.color;
      productInsert.value.brand = productResponseModel.data!.brand;
      productInsert.value.model = productResponseModel.data!.model;
      productInsert.value.width = productResponseModel.data!.width;
      productInsert.value.offset = productResponseModel.data!.offset;
      productInsert.value.treadWare = productResponseModel.data!.treadWare;
      productInsert.value.pitchCircleCode =
          productResponseModel.data!.pitchCircleCode;
      productInsert.value.groupCode = productResponseModel.data!.groupCode;
      productInsert.value.price = productResponseModel.data!.price;
      productInsert.value.dealerPrice1 =
          productResponseModel.data!.dealerPrice1;
      productInsert.value.createdBy = userId;
      update();
      Log.loga(
          logTitle, 'getProductByCode after:: ${productInsert.value.toJson()}');
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: '',
        middleText: 'ไม่พบข้อมูล',
        textConfirm: 'Okay',
        confirm: OutlinedButton.icon(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close,
            color: Colors.red.shade700,
          ),
          label: const Text(
            'ปิด',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
    }
  }

  saveProduct() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      //add product image
      final fileMeta = await nhostClient.storage.uploadBytes(
        fileName: fileUpload.value.name,
        fileContents: await fileUpload.value.readAsBytes().then((value) {
          return value.toList();
        }),
      );
      Log.loga(logTitle, 'addProduct file id:: ${fileMeta.id}');

      Log.loga(logTitle, 'addProduct before:: ${productInsert.value.toJson()}');
      // connect graphqlClient
      final graphqlClient = createNhostGraphQLClient(nhostClient);

      // add product detail
      final resultProductDetail = await graphqlClient.mutate(
        MutationOptions(
          document: createProductMutation,
          variables: {
            'product': productInsert.value,
          },
        ),
      );
      if (resultProductDetail.hasException) {
        Log.loga(logTitle, 'addProduct:: ${resultProductDetail.exception}');
      }

      final products = resultProductDetail.data!['insert_products_one'];
      final productId = products['id'];

      // add product file
      final resultProductFile = await graphqlClient.mutate(
        MutationOptions(
          document: createProductFileMutation,
          variables: {
            'product_id': productId,
            'file_id': fileMeta.id,
          },
        ),
      );
      if (resultProductFile.hasException) {
        Log.loga(logTitle, 'addProduct:: ${resultProductFile.exception}');
      }
      Log.loga(logTitle, 'addProduct id:: ${resultProductFile.data!}');
      productList.value.clear();
      imageUrl.value.clear();
      offset.value = 0;

      // create log
      // final logsCreate = LogsCreateRequestModel(
      //     createdBy: nhostClient.auth.currentUser!.id,
      //     detail:
      //         'admin : $logActionAddProduct : รหัสสินค้า ${productInsert.value.code}');
      // Log.loga(title, 'signInWithEmailPassword:: ${logsCreate.toJson()}');
      // final resultCreateLog = await LogsService().createLogs(logsCreate);
      // logs with nhost
      var mutationResult = await graphqlClient.mutate(
        MutationOptions(document: createLogs, variables: {
          'logs': LogsCreateRequestModel(
              createdBy: nhostClient.auth.currentUser!.id,
              detail:
                  'admin : $logActionAddProduct : รหัสสินค้า ${productInsert.value.code}')
        }),
      );
      update();
      listProducts();
      setInitProduct();
      Get.back();
    } catch (e) {
      setInitProduct();
      Get.back();
      Log.loga(logTitle, 'addProduct error :: ${e.toString()}');
    }
    // Get.toNamed(Routes.HOME);
  }
}
