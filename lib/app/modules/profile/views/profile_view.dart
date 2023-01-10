import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_flat_button.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/validator.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

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
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 200,
                                child: Image.network(
                                  'assets/images/undraw_Add_files_re_v09g.png',
                                  fit: BoxFit.cover,
                                ),
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
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {}
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