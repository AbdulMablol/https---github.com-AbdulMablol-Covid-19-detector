// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PcrMenu extends StatelessWidget {
  const PcrMenu({
    Key key,
    @required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [Expanded(child: Text(text)), Icon(Icons.call)],
        ),
      ),
    );
  }
}
