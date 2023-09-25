import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String imagePath;
  final String imageName;
  const DialogWidget(
      {required this.imagePath, required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Apakah anda ingin memilih gambar ini?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Image(
            image: AssetImage(imagePath),
            height: 200,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Tidak',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(
              '/detail',
              arguments: imagePath,
            );
          },
          child: const Text(
            'Iya',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
