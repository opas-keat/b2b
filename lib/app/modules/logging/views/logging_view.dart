import 'package:b2b/app/shared/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'ค้นหา',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.listLogs();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Obx(() {
                // loading
                if (controller.isLoading.value) {
                  return Center(
                    child: const CircularProgressIndicator().reactive(),
                  );
                }
                if (controller.logsList.value.isNotEmpty) {
                  List<LogsList> logsList = controller.logsList.value;
                  return Scrollbar(
                    thumbVisibility: true,
                    controller: scrollBarController,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(defaultPadding),
                      controller: scrollBarController,
                      itemCount: logsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: CustomText(
                                text: logsList[index].detail,
                                weight: FontWeight.bold,
                              ),
                              subtitle: Text(DateFormat("dd-MM-yyyy hh:mm:ss")
                                  .format(DateFormat("yyyy-MM-dd hh:mm:ss")
                                      .parse(controller
                                          .logsList[index].createdAt
                                          .toString()))),
                            ),
                            const Divider(
                              height: 5.0,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
          ),
          const SizedBox(height: 10),
        ],
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
