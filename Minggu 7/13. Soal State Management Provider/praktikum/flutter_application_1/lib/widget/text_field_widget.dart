import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_color.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final bool isNameValid;
  final ValueChanged<String> onChanged;

  const InputTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    required this.isNameValid,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: greyColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: lightgreyColor,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        errorText: isNameValid ? null : errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: onChanged,
    );
  }
}
