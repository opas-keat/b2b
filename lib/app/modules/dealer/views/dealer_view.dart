import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../data/dealer.dart';
import '../controllers/dealer_controller.dart';

class DealerView extends StatelessWidget {
  DealerController controller = Get.put(DealerController());
  final scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ร้านค้า'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {
                // setState(() {
                //   searchString = value.toLowerCase();
                // });
                // controller.
              },
              decoration: InputDecoration(
                labelText: 'ค้นหา',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollBarController,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(defaultPadding),
                  controller: scrollBarController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // SwitchListTile(
                        //   title: Text('${sampleDealer[index].fTCustName}'),
                        //   subtitle: Text(sampleDealer[index].fTCustAddressInv +
                        //       ' ' +
                        //       sampleDealer[index].fTCustPhoneInv),
                        //   value: sampleDealer[index].status,
                        //   onChanged: (bool value) {
                        //     // setState(() {
                        //     //   appliances[index].isOn = value;
                        //     // });
                        //   },
                        // ),
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            // color: darkBlueColor,
                            size: 40.0,
                          ),
                          title: Text(
                            sampleDealer[index].fTCustName,
                            style: TextStyle(
                              // color: darkBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(sampleDealer[index].fTCustAddressInv +
                              ' ' +
                              sampleDealer[index].fTCustPhoneInv),
                          onTap: () {},
                          trailing: sampleDealer[index].status
                              ? Text(
                                  'เปิดใช้',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  'ปิด',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                  itemCount: sampleDealer.length,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
