import 'package:flutter/material.dart';

class DetailGambar extends StatelessWidget {
  const DetailGambar({super.key});

  @override
  Widget build(BuildContext context) {
    final String imagePath =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          icon: const Icon(Icons.home),
        ),
        centerTitle: true,
        title: const Text(
          'Halaman Detail',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Gambar Full',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
