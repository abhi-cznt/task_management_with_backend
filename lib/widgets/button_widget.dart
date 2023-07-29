import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  const ButtonWidget(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
