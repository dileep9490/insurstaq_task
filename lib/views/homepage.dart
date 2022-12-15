import 'package:flutter/material.dart';
import 'package:insurstaq_task/model/dataobject.dart';
import 'package:insurstaq_task/widgets/list_item.dart';
import 'package:insurstaq_task/widgets/remainder_widget.dart';

List<Map> data = [
  {
    "type": "Motor",
    "category": "Upcoming",
    "info1": "i20's motor policy",
    "info2": "due",
    "date": "21 June,2022",
    "renewed": false,
    "due": "",
  },
  {
    "type": "Health",
    "category": "Overdue",
    "info1": "Shivam's health policy",
    "info2": "due",
    "date": "21 April,2022",
    "renewed": false,
    "due": 1,
  },
  {
    "type": "Equipment",
    "category": "Paid",
    "info1": "iphone's equipment policy",
    "info2": "renewed",
    "date": "21 March,2022",
    "renewed": true,
    "due": "",
  }
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const RemainderWidget(),
           const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              padding:const EdgeInsets.only(bottom: 10),
              itemBuilder: (ctx, count) {
                DataObject obj = DataObject.fromMap(data[count]);
                return ListItem(obj: obj);
              },
              itemCount: data.length,
            ))
          ],
        ),
      ),
    ));
  }
}
