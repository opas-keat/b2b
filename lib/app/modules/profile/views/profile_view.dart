import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_flat_button.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/validator.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();
  final _textHistoryShow = TextEditingController(text: '7');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ตั้งค่า'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: defaultPadding),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       border: Border(
          //         bottom: BorderSide(
          //           color: primaryColor,
          //           width: 1.0,
          //         ),
          //       ),
          //     ),
          //     child: const ListTile(
          //       leading: Icon(
          //         Icons.maps_home_work,
          //       ),
          //       title: CustomText(
          //         text: 'การแสดงประวัติการซื้อย้อนหลัง',
          //         size: 24,
          //       ),
          //       dense: false,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 2,
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: primaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.calendar_today_sharp,
                    ),
                    title: CustomText(
                      text: 'การแสดงประวัติการซื้อย้อนหลัง',
                      size: 24,
                    ),
                    dense: false,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding,
                    ),
                    color: const Color(0xFFF5F5F5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          flex: 2,
                          child: SizedBox(height: defaultPadding),
                        ),
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.done,
                            cursorColor: primaryColor,
                            controller: _textHistoryShow,
                            decoration: const InputDecoration(
                              hintText: 'จำนวนวันย้อนหลัง',
                              prefixIcon: Icon(Icons.calendar_today_sharp),
                            ),
                            validator: (value) =>
                                validateNotEmpty(value!, 'จำนวนวันย้อนหลัง'),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                            ),
                            child: CustomFlatButton(
                              label: 'Update'.toUpperCase(),
                              onPressed: () async {},
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 2,
                          child: SizedBox(height: defaultPadding),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const ListTile(
                      leading: Icon(
                        Icons.calendar_today_sharp,
                      ),
                      title: CustomText(
                        text: 'Artwork แสดงข่าวสาร',
                        size: 24,
                      ),
                      dense: false,
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                      ),
                      color: const Color(0xFFF5F5F5),
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              flex: 2,
                              child: SizedBox(height: defaultPadding),
                            ),
                            InkWell(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? pickedFile =
                                    await picker.pickImage(
                                  source: ImageSource.gallery,
                                  maxHeight: 640,
                                  maxWidth: 480,
                                );
                                if (pickedFile != null) {
                                  controller.fileUpload.value = pickedFile;
                                  controller.update();
                                }
                              },
                              child: Obx(() => SizedBox(
                                    height: 200,
                                    child: controller.imageUrl.value.isNotEmpty
                                        ? Image.network(
                                            controller.imageUrl.value,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          )
                                        : (controller.fileUpload.value.path
                                                .isNotEmpty)
                                            ? Image.network(
                                                controller
                                                    .fileUpload.value.path,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                'assets/images/undraw_Add_files_re_v09g.png',
                                                fit: BoxFit.cover,
                                              ),
                                  )),
                            ),
                            // Flexible(
                            //   flex: 2,
                            // child: SizedBox(
                            //   height: 200,
                            //   child: Image.network(
                            //     'assets/images/undraw_Add_files_re_v09g.png',
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            // child: Obx(
                            //   () => SizedBox(
                            //     height: 200,
                            //     child: (controller
                            //             .fileUpload.value.path.isNotEmpty)
                            //         ? Image.network(
                            //             controller.fileUpload.value.path,
                            //             height: 200,
                            //             fit: BoxFit.cover,
                            //           )
                            //         : Image.network(
                            //             'assets/images/undraw_Add_files_re_v09g.png',
                            //             fit: BoxFit.cover,
                            //           ),
                            //   ),
                            //   // ),
                            //   // ),
                            // ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding,
                                ),
                                child: CustomFlatButton(
                                  label: 'Update'.toUpperCase(),
                                  onPressed: () async {
                                    controller.updateArtwork();
                                  },
                                ),
                              ),
                            ),
                            const Flexible(
                              flex: 2,
                              child: SizedBox(height: defaultPadding),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

// Future<Widget> getImageUrl(String fileId) async {
//   print(fileId);
//   if (fileId.isNotEmpty) {
//     final resultUrl = await nhostClient.storage.getPresignedUrl(fileId);
//     return SizedBox(
//       width: 300,
//       child: Image.network(
//         resultUrl.url,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
//   return CircularProgressIndicator();
// }