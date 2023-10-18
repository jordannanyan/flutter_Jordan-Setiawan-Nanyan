import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact/contact_screen.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/contact/edit_contact_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ContactViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const HalamanContact(),
        '/edit_contact': (_) => HalamanEditContact(),
      },
    );
  }
}
