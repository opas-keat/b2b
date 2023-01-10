import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../data/graphql/graphql_product.dart';
import '../../../data/graphql/graphql_product_file.dart';
import '../../../data/product.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

final logTitle = "AddProductController";

class AddProductController extends GetxController {
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
    // setInitProduct();
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

  getImageUrl() async {
    final resultUrl = await nhostClient.storage
        .getPresignedUrl('4011f327-12d8-4b52-ad5d-58ee91b58a92');
    if (resultUrl.url.isNotEmpty) {
      Log.loga(logTitle, 'addProduct url :: ${resultUrl.url.toString()}');
    }
  }

  downloadFile(String fileId) async {
    final scaledImage = await nhostClient.storage.downloadImage(
      fileId,
      transform: ImageTransform(
        quality: 70,
        cornerRadius: ImageCornerRadius.full(),
      ),
    );
    Log.loga(logTitle,
        'addProduct downloadFile size:: ${scaledImage.contentLength}');
  }

  getProductByCode(String productCode) async {
    debugPrint(productCode);
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

  addProduct() async {
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
      setInitProduct();
      Get.back();
    } catch (e) {
      setInitProduct();
      Get.back();
      Log.loga(logTitle, 'addProduct error :: ${e.toString()}');
    }
    // Get.toNamed(Routes.HOME);
  }

  gotoHome() {
    Get.offNamed(Routes.HOME);
    // final controller = Get.put(ProductController());
    // controller.productsList();
    // Get.back();
  }
}
