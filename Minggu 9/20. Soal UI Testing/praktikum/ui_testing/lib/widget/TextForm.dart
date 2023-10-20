import 'package:flutter/material.dart';
import 'package:ui_testing/style/themecolor.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? textController;
  final String labelText;
  final String errorText;
  final int lines;
  final void Function(String?)? onSavedValue;
  const TextFormWidget({
    super.key,
    required this.labelText,
    required this.errorText,
    this.onSavedValue,
    required this.lines,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorLightGrey,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: colorGrey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorGrey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorGrey,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorRed,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: colorRed,
            ),
          ),
        ),
        maxLines: lines,
        validator: (val) {
          if (val!.isEmpty) {
            return errorText;
          }
          return null;
        },
        onSaved: onSavedValue,
      ),
    );
  }
}
