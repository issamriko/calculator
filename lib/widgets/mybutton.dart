import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String buttontext;
  final Color color;
  final Color textcolor;
  const Mybutton({
    super.key,
    required this.buttontext,
    required this.color,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Text(
          buttontext,
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
    );
  }
}
