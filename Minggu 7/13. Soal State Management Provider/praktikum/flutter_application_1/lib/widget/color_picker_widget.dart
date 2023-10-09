import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/form_model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class CustomColorPicker extends StatelessWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;
  const CustomColorPicker({
    super.key,
    required this.initialColor,
    required this.onColorChanged,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return Consumer<FormDataProvider>(builder: (context, formProvider, child) {
      return Column(
        children: [
          const Text('Color'),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: double.infinity,
            color: formProvider.formData.currentColor,
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    formProvider.formData.currentColor),
              ),
              child: const Text('Pick Color'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick Your Color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: formProvider.formData.currentColor,
                          onColorChanged: (color) {
                            onColorChanged(color);
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
