import 'package:flutter/material.dart';
import 'package:insurstaq_task/model/dataobject.dart';
import 'package:insurstaq_task/utils/sizeconfig.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.obj});

  final DataObject obj;
  late Color categorybg;

  void setColor(String type) {
    if (type == "Paid") {
      categorybg = Colors.blueAccent;
    } else if (type == "Overdue") {
      categorybg = Colors.redAccent;
    } else {
      categorybg = Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setColor(obj.category);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.heightUnitBlock! * 17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.heightUnitBlock! * 6,
                  width: SizeConfig.heightUnitBlock! * 6,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: categorybg, width: 2),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      obj.type,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: SizeConfig.widthUnitBlock! * 70,
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                text: obj.info1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      obj.category == "Paid" ? " was" : " is"),
                              TextSpan(
                                text: " ${obj.info2}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: " on"),
                              TextSpan(
                                text: " ${obj.date}.",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    obj.renewed
                        ? const SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.check_rounded,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Mark as Renewed",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: "Due: ${obj.date}"),
                          obj.due != ""
                              ? TextSpan(
                                  text: " (${obj.due}day ago)",
                                  style: const TextStyle(color: Colors.red),
                                )
                              : const TextSpan(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                color: categorybg,
              ),
              width: 80,
              child: Text(
                obj.category,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
