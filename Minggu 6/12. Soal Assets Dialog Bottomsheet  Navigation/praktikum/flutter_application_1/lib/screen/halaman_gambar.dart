import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/image_sheet.dart';
import 'package:flutter_application_1/modal/image_modal.dart';

class ListGambar extends StatefulWidget {
  const ListGambar({super.key});

  @override
  State<ListGambar> createState() => _ListGambarState();
}

class _ListGambarState extends State<ListGambar> {
  final List<ImageList> items = [
    ImageList(imagePath: 'assets/photo1.jpeg', imageName: 'Foto Pertama'),
    ImageList(imagePath: 'assets/photo2.jpg', imageName: 'Foto Kedua'),
    ImageList(imagePath: 'assets/photo3.jpg', imageName: 'Foto Ketiga'),
    ImageList(imagePath: 'assets/photo4.jpg', imageName: 'Foto Keempat'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Flutter Gallery',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Color(0xFF000000), width: 2),
                  ),
                ),
                child: const Text(
                  'Tugas flutter minggu enam, mengenai assets, dialog, dan navigation',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: GestureDetector(
                      child: Image(
                        image: AssetImage(items[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => ImageBottomSheet(
                            imagePath: items[index].imagePath,
                            imageName: items[index].imageName,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
