import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:get/get.dart';

import '../../../api/services/logs_service.dart';
import '../../../data/graphql/graphql_dealer.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../shared/constants.dart';
import '../../../data/dealer.dart';
import '../../../shared/custom_text.dart';
import '../controllers/dealer_controller.dart';

class DealerView extends StatelessWidget {
  DealerController controller = Get.put(DealerController());
  final scrollBarController = ScrollController();

  final _productName = TextEditingController();
  final _userId = nhostClient.auth.currentUser!.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ร้านค้า'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: TextField(
              controller: _productName,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'ค้นหา',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Subscription(
            options: SubscriptionOptions(
              document: getDealersSubscription,
              // variables: {},r
            ),
            builder: (result) {
              //loading
              if (result.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!result.isConcrete) return SizedBox();
              // has error
              if (result.hasException) {
                return Text('${result.exception}');
              }

              //show data
              // print(result);
              final dealers = (result.data!['dealers'] as List)
                  .map((json) => DealerResponseSubscription.fromJson(json))
                  .toList();
              // print("----" + dealers.length.toString());
              if (dealers.isNotEmpty) {
                return Expanded(
                  child: Card(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(defaultPadding),
                      controller: scrollBarController,
                      itemCount: dealers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Mutation(
                              options: MutationOptions(
                                document: updateDealerStatus,
                                // variables: {
                                //   "id": "",
                                //   "disabled": true,
                                //   "updated_by": "",
                                // },
                              ),
                              builder: (runMutation, result) {
                                // print(dealers[index].disabled);
                                return ListTile(
                                  leading: const Icon(
                                    Icons.account_circle,
                                    size: 40.0,
                                  ),
                                  title: CustomText(
                                    text: dealers[index].name,
                                    size: 18,
                                  ),
                                  subtitle: CustomText(
                                    text:
                                        '${dealers[index].address} \n${dealers[index].phone}',
                                    size: 14,
                                  ),
                                  trailing: (dealers[index].disabled)
                                      ? TextButton(
                                          child: const CustomText(
                                            text: 'ปิด',
                                            size: 14,
                                            color: Colors.red,
                                            weight: FontWeight.bold,
                                          ),
                                          onPressed: () async {
                                            Get.dialog(
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              barrierDismissible: false,
                                            );
                                            runMutation({
                                              "id": dealers[index].id,
                                              "disabled": false,
                                              "updated_by": _userId,
                                              "dealerCode":
                                                  "{\"dealerCode\": \"${dealers[index].dealerCode}\"}",
                                            });
                                            // create log
                                            final logsCreate =
                                                LogsCreateRequestModel(
                                                    createdBy: nhostClient
                                                        .auth.currentUser!.id,
                                                    detail:
                                                        'admin : $logActionEnableDealer : ${dealers[index].name}');
                                            final resultCreateLog =
                                                await LogsService()
                                                    .createLogs(logsCreate);
                                            Get.back();
                                          })
                                      : TextButton(
                                          child: const CustomText(
                                            text: 'เปิดใช้',
                                            size: 14,
                                            color: Colors.green,
                                            weight: FontWeight.bold,
                                          ),
                                          onPressed: () async {
                                            Get.dialog(
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              barrierDismissible: false,
                                            );
                                            runMutation({
                                              "id": dealers[index].id,
                                              "disabled": true,
                                              "updated_by": _userId,
                                              "dealerCode":
                                                  "{\"dealerCode\": \"${dealers[index].dealerCode}\"}",
                                            });
                                            // create log
                                            final logsCreate =
                                                LogsCreateRequestModel(
                                                    createdBy: nhostClient
                                                        .auth.currentUser!.id,
                                                    detail:
                                                        'admin : $logActionDisableDealer : ${dealers[index].name}');
                                            final resultCreateLog =
                                                await LogsService()
                                                    .createLogs(logsCreate);
                                            Get.back();
                                          }),
                                );
                              },
                            ),
                            const Divider(
                              height: 5.0,
                            ),
                          ],
                        );
                        //           // return Column(
                        //           //   mainAxisSize: MainAxisSize.min,
                        //           //   children: <Widget>[
                        //           //     ListTile(
                        //           //       leading: const Icon(
                        //           //         Icons.account_circle,
                        //           //         size: 40.0,
                        //           //       ),
                        //           //       title: CustomText(
                        //           //         text: dealers[index].name,
                        //           //         size: 18,
                        //           //       ),
                        //           //       subtitle: CustomText(
                        //           //         text:
                        //           //             '${dealers[index].address}\n${dealers[index].phone}',
                        //           //         size: 14,
                        //           //       ),
                        //           //       onTap: () {},
                        //           //       trailing: dealers[index].disabled
                        //           //           ? TextButton(
                        //           //               child: CustomText(
                        //           //                 text: 'ปิด',
                        //           //                 size: 14,
                        //           //                 color: Colors.red,
                        //           //                 weight: FontWeight.bold,
                        //           //               ),
                        //           //               onPressed: () async {

                        //           //               })
                        //           //           : TextButton(
                        //           //               child: CustomText(
                        //           //                 text: 'เปิดใช้',
                        //           //                 size: 14,
                        //           //                 color: Colors.green,
                        //           //                 weight: FontWeight.bold,
                        //           //               ),
                        //           //               onPressed: () async {}),
                        //           //     ),
                        //           //     const Divider(
                        //           //       height: 5.0,
                        //           //     ),
                        //           //   ],
                        //           // );
                      },
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}


// Expanded(
          //   child: Card(
          //     margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          //     child: Scrollbar(
          //       thumbVisibility: true,
          //       controller: scrollBarController,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(defaultPadding),
          //         controller: scrollBarController,
          //         itemBuilder: (context, index) {
          //           return Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //               // SwitchListTile(
          //               //   title: Text('${sampleDealer[index].fTCustName}'),
          //               //   subtitle: Text(sampleDealer[index].fTCustAddressInv +
          //               //       ' ' +
          //               //       sampleDealer[index].fTCustPhoneInv),
          //               //   value: sampleDealer[index].status,
          //               //   onChanged: (bool value) {
          //               //     // setState(() {
          //               //     //   appliances[index].isOn = value;
          //               //     // });
          //               //   },
          //               // ),
          //               ListTile(
          //                 leading: const Icon(
          //                   Icons.account_circle,
          //                   // color: darkBlueColor,
          //                   size: 40.0,
          //                 ),
          //                 title: Text(
          //                   sampleDealer[index].fTCustName,
          //                   style: const TextStyle(
          //                     // color: darkBlueColor,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 subtitle: Text('${sampleDealer[index].fTCustAddressInv} ${sampleDealer[index].fTCustPhoneInv}'),
          //                 onTap: () {},
          //                 trailing: sampleDealer[index].status
          //                     ? const Text(
          //                         'เปิดใช้',
          //                         style: TextStyle(
          //                           color: Colors.green,
          //                           fontWeight: FontWeight.bold,
          //                         ),
          //                       )
          //                     : const Text(
          //                         'ปิด',
          //                         style: TextStyle(
          //                           color: Colors.red,
          //                           fontWeight: FontWeight.bold,
          //                         ),
          //                       ),
          //               ),
          //               const Divider(
          //                 height: 5.0,
          //               ),
          //             ],
          //           );
          //         },
          //         itemCount: sampleDealer.length,
          //       ),
          //     ),
          //   ),
          // ),