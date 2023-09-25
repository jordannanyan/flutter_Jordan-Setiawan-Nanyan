import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/image_dialog.dart';

class ImageBottomSheet extends StatelessWidget {
  final String imagePath;
  final String imageName;

  const ImageBottomSheet(
      {required this.imagePath, required this.imageName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => DialogWidget(
                  imagePath: imagePath,
                  imageName: imageName,
                ),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            imageName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
