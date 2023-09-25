import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/halaman_detail.dart';
import 'package:flutter_application_1/screen/halaman_gambar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const ListGambar(),
        '/detail': (_) => const DetailGambar(),
      },
    );
  }
}
