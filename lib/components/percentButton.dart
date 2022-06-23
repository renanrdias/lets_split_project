import 'package:flutter/material.dart';

class PercentButton extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Function() updatePercent;
  final double? width;
  final double? height;
  Color? textColor;

  PercentButton(
      {required this.backgroundColor,
      required this.title,
      required this.updatePercent,
      this.width,
      this.height,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            6,
          ),
        ),
      ),
      child: TextButton(
        onPressed: updatePercent,
        child: Text(
          title,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceMono'),
        ),
      ),
    );
  }
}
