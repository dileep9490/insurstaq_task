import 'package:flutter/material.dart';

class RemainderRowWidget extends StatefulWidget {
  RemainderRowWidget(
      {super.key, required this.title, required this.checkvalue, this.url});

  final String title;
  late final String? url;
  bool checkvalue;

  @override
  State<RemainderRowWidget> createState() => _RemainderRowWidgetState();
}

class _RemainderRowWidgetState extends State<RemainderRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                widget.url == null
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 30,
                        width: 30,
                        child: Image.asset(widget.url!),
                      ),
              ],
            ),
            Switch(
              value: widget.checkvalue,
              onChanged: (bool val) {
                setState(() {
                  widget.checkvalue = val;
                });
              },
            ),
          ],
        ),
const        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
