import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String buttontext;
  final Color color;
  final Color textcolor;
  final buttonTapped;
  const Mybutton({
    super.key,
    required this.buttontext,
    required this.color,
    required this.textcolor, this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
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
      ),
    );
  }
}
