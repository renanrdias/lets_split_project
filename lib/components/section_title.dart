import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({Key? key, required this.title, this.style}) : super(key: key);

  final String title;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}
