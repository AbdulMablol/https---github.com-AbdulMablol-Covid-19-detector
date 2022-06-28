import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'pcr_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class Pcr extends StatelessWidget {
  const Pcr({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF473F97),
          title: Text(
            "Pcr locations",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PcrMenu(
              text: "OCMU Oncology Center - Mansoura University",
              press: () => launch("tel:+20502358021"),
            ),
            PcrMenu(
              text: "معامل تحاليل المجد",
              press: () => launch("tel:+201020520457"),
            ),
            PcrMenu(
              text: "El Mansoura International Hospital",
              press: () => launch("tel:+20502215760"),
            ),
            PcrMenu(
              text: "معمل المختبر",
              press: () => launch("tel:+201090011227"),
            ),
            PcrMenu(
              text: "Management Mansoura Labs",
              press: () => launch("tel:+20502218311"),
            ),
            PcrMenu(
              text: "Royal Center",
              press: () => launch("tel:+201016560000"),
            ),
          ],
        ));
  }
}
