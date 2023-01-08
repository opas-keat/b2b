import 'package:b2b/app/data/history_order.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class HistoryDealerView extends StatelessWidget {
  HistoryDealerView({super.key});
  final scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการสั่งซื้อ'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {
                // setState(() {
                //   searchString = value.toLowerCase();
                // });
                // controller.
              },
              decoration: const InputDecoration(
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
                        ListTile(
                          title: Text(
                            sampleHistoryOrder[index].detail,
                            style: const TextStyle(
                              // color: darkBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(sampleHistoryOrder[index].dateTime),
                        ),
                        const Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                  itemCount: sampleHistoryOrder.length,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
