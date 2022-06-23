import 'package:flutter/material.dart';
import "package:flutter/services.dart";

class InputData extends StatelessWidget {
  final String? hintTitle;
  final IconData icon;
  final TextInputType keyboardType;
  final Function(String?) onChange;
  final TextEditingController? controller;
  final List<TextInputFormatter>? restrictionsForInput;

  InputData(
      {this.hintTitle,
      required this.icon,
      required this.keyboardType,
      required this.onChange,
      this.controller,
      this.restrictionsForInput});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      textAlign: TextAlign.end,
      style: const TextStyle(
        color: Color.fromRGBO(0, 73, 77, 1),
        fontFamily: 'SpaceMono',
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      keyboardType: keyboardType,
      inputFormatters: restrictionsForInput,
      decoration: InputDecoration(
        hintText: hintTitle,
        contentPadding: const EdgeInsets.only(right: 15.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Icon(
            icon,
            color: const Color(0xFFA8C3C5),
            size: 20,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(244, 250, 250, 1),
        enabledBorder: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(38, 192, 171, 1),
            width: 2,
          ),
        ),
      ),
    );
  }
}
