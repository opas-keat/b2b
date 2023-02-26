import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/graphql/graphql_artwork.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

class ProfileController extends GetxController {
  final logTitle = "ProfileController";
  Rx<String> filePath = ''.obs;
  Rx<XFile> fileUpload = XFile('').obs;

  Rx<String> imageUrl = 'assets/images/undraw_Add_files_re_v09g.png'.obs;

  @override
  void onInit() {
    getImageUrl();
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

  updateArtwork() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      Log.loga(logTitle, 'updateArtwork before:: ');
      //add product image
      final fileMeta = await nhostClient.storage.uploadBytes(
        fileName: 'artwork',
        fileContents: await fileUpload.value.readAsBytes().then((value) {
          return value.toList();
        }),
      );
      Log.loga(logTitle, 'updateArtwork file id:: ${fileMeta.id}');
      Get.back();
    } catch (e) {
      Get.back();
      Log.loga(logTitle, 'updateArtwork error :: ${e.toString()}');
    }
  }

  getImageUrl() async {
    try {
      final graphqlClient = createNhostGraphQLClient(nhostClient);
      var result = await graphqlClient.query(
        QueryOptions(
          document: getArtWork,
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'getImageUrl:: ${result.exception}');
      }
      final fileList = (result.data!['files'] as List);
      String fileId = fileList[0]['id'];
      if (fileId.isNotEmpty) {
        // Log.loga(logTitle, 'fileList:: $fileId');
        final resultUrl = await nhostClient.storage.getPresignedUrl(fileId);
        imageUrl.value = resultUrl.url;
        // Log.loga(logTitle, 'fileList::resultUrl: ${resultUrl.url.toString()}');
      }
    } catch (e) {
      Log.loga(logTitle, 'getImageUrl error :: ${e.toString()}');
    }
  }
}
