import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/themecolor.dart';
import 'package:flutter_application_1/theme/themetext.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi Saya',
          style: TextStyles.textHeader,
        ),
        centerTitle: true,
        backgroundColor: colorBlack,
      ),
      body: const Center(
        child: Text('Halaman Contact Us'),
      ),
    );
  }
}
