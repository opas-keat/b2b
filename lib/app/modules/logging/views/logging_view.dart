import 'package:b2b/app/shared/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/log.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../shared/constants.dart';
import '../controllers/logging_controller.dart';

class LoggingView extends StatelessWidget {
  LoggingView({Key? key}) : super(key: key);
  LoggingController controller = Get.put(LoggingController());
  final scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการใช้งาน'),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          children: [
            Obx(() {
              // loading
              if (controller.isLoading.value) {
                return Center(
                  child: const CircularProgressIndicator().reactive(),
                );
              }
              if (controller.logsList.value.isNotEmpty) {
                List<LogsCreateResponse> logsList = controller.logsList.value;
                return ListView.builder(
                  itemCount: logsList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(defaultPadding),
                  controller: scrollBarController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: CustomText(
                            text: logsList[index].detail,
                            weight: FontWeight.bold,
                          ),
                          subtitle: CustomText(
                            text: logsList[index].createdAt,
                          ),
                        ),
                        Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height: 10),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
      //       child: TextField(
      //         onChanged: (value) {
      //           // setState(() {
      //           //   searchString = value.toLowerCase();
      //           // });
      //           // controller.
      //         },
      //         decoration: InputDecoration(
      //           labelText: 'ค้นหา',
      //           suffixIcon: Icon(Icons.search),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Card(
      //         margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      //         child: Scrollbar(
      //           thumbVisibility: true,
      //           controller: scrollBarController,
      //           child: ListView.builder(
      //             shrinkWrap: true,
      //             padding: const EdgeInsets.all(defaultPadding),
      //             controller: scrollBarController,
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   ListTile(
      //                     title: Text(
      //                       sampleLog[index].detail,
      //                       style: TextStyle(
      //                         // color: darkBlueColor,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     subtitle: Text(sampleLog[index].dateTime),
      //                   ),
      //                   Divider(
      //                     height: 5.0,
      //                   ),
      //                 ],
      //               );
      //             },
      //             itemCount: sampleLog.length,
      //           ),
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 10),
      //   ],
      // ),
    );
  }
}
