import 'package:flutter/material.dart';
import './reminder_row.dart';
import './custom_fade_line.dart';

class RemainderWidget extends StatelessWidget {
  const RemainderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reminders",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              child: CustomPaint(
                painter:  FadeLinePainter(),
                size:const Size(double.infinity, 5),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Communication channel",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
           const SizedBox(
              height: 18,
            ),
            RemainderRowWidget(
              title: "Whatsapp Remainder",
              checkvalue: false,
              url: "assets/images/whatsapp.jpeg",
            ),
            RemainderRowWidget(
              title: "SMS Remainder",
              checkvalue: false,
            ),
            RemainderRowWidget(
              title: "Email Remainder",
              checkvalue: false,
            )
          ],
        ));
  }
}
