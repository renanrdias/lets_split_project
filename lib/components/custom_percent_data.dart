import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPercentData extends StatelessWidget {
  const CustomPercentData(
      {Key? key,
      this.width,
      this.height,
      required this.customInputController,
      required this.onChanged,
      this.hintTitle,
      required this.keyboardType,
      this.restrictions,
      this.onTap})
      : super(key: key);

  final double? width;
  final double? height;
  final TextEditingController customInputController;
  final Function(String value) onChanged;
  final Function()? onTap;
  final String? hintTitle;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? restrictions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: restrictions,
        controller: customInputController,
        onChanged: onChanged,
        onTap: onTap,
        textAlign: TextAlign.end,
        style: const TextStyle(
          color: Color.fromRGBO(0, 73, 77, 1),
          fontFamily: 'SpaceMono',
          fontWeight: FontWeight.w700,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          hintText: hintTitle,
          contentPadding: const EdgeInsets.only(right: 15.0),
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
      ),
    );
  }
}
