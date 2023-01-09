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
import '../../../data/product.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

final logTitle = "AddProductController";

class AddProductController extends GetxController {
  Rx<String> filePath = ''.obs;
  // Rx<Uint8List?> bytesData = Uint8List(0).obs;

  // late Future<XFile?> imageFile;
  Rx<XFile> fileUpload = XFile('').obs;
  // Rx<List<PlatformFile>>? _paths = PlatformFile(name: '',size: 0).obs;
  // final _paths = List<PlatformFile>;
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

  // pickFiles() async {
  //   try {
  //     _paths = (await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowMultiple: false,
  //       onFileLoading: (FilePickerStatus status) => print(status),
  //       allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
  //     ))
  //         ?.files;
  //   } on PlatformException catch (e) {
  //     Log.loga(logTitle, 'pickFiles PlatformException :: ${e.toString()}');
  //   } catch (e) {
  //     Log.loga(logTitle, 'pickFiles error :: ${e.toString()}');
  //   }
  //   Log.loga(logTitle, 'pickFiles:: ${_paths!.first.name}');
  //   bytesData.value = _paths!.first.bytes!;
  //   update();
  // }

  getProductByCode(String productCode) async {
    debugPrint(productCode);
    productCode = "99934BEXM6FD025P";
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
      Log.loga(logTitle, 'addProduct before upload:: ${fileUpload.value.path}');
      Log.loga(
          logTitle, 'addProduct before upload:: ${fileUpload.value.mimeType}');

      nhostClient.storage
          .uploadBytes(
        fileName: fileUpload.value.name,
        fileContents: await fileUpload.value.readAsBytes().then((value) {
          return value.toList();
        }),
        // mimeType: fileUpload.value.mimeType.toString(),
      )
          .then((value) {
        Log.loga(logTitle, 'addProduct:: ${value.id}');
      });
      // if (imageMetadata.id.isNotEmpty) {
      //   Log.loga(logTitle, 'addProduct:: ${imageMetadata.id}');
      // }
      //     .then((value) {
      //   Log.loga(logTitle, 'addProduct after upload:: ${value.id}');
      // });

      //66f2a32b-7ffa-4e01-a979-b939205eba18
      // final resultUrl =
      //     await nhostClient.storage.getPresignedUrl(imageMetadata.id);
      // if (resultUrl.url.isNotEmpty) {
      //   Log.loga(logTitle, 'addProduct 3 :: ${resultUrl.url.toString()}');
      // } else {}
      //add product detail
      // Log.loga(logTitle, 'addProduct before:: ${productInsert.value.toJson()}');
      // final graphqlClient = createNhostGraphQLClient(nhostClient);
      // var result = await graphqlClient.mutate(
      //   MutationOptions(
      //     document: createProductMutation,
      //     variables: {
      //       'product': productInsert.value,
      //     },
      //   ),
      // );
      // if (result.hasException) {
      //   Log.loga(logTitle, 'addProduct:: ${result.exception}');
      // }

      Get.back();
    } catch (e) {
      Get.back();
      Log.loga(logTitle, 'addProduct error :: ${e.toString()}');
    }
    // Get.toNamed(Routes.HOME);
  }

  gotoHome() {
    Get.offNamed(Routes.HOME);
  }
}
