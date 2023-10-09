import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact_pages/contact_screen.dart';
import 'package:flutter_application_1/pages/contact_pages/edit_contact_screen.dart';
import 'package:flutter_application_1/pages/gambar_pages/detailgambar_screen.dart';
import 'package:flutter_application_1/pages/gambar_pages/gambar_screen.dart';
import 'package:flutter_application_1/provider/contact_model.dart';
import 'package:flutter_application_1/provider/form_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactModel()),
        ChangeNotifierProvider(create: (_) => FormDataProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/': (_) => ListGambar(),
        '/detail': (_) => const DetailGambar(),
        '/contact': (_) => HalamanContact(),
        '/edit_contact': (_) => HalamanEditContact(),
      },
    );
  }
}
