import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
    return Column(
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: initialColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(initialColor),
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
                        pickerColor: initialColor,
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
  }
}
