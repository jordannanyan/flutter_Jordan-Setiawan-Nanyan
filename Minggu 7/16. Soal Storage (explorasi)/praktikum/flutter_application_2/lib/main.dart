import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/contact_pages/contact_screen.dart';
import 'package:flutter_application_2/pages/contact_pages/edit_contact_screen.dart';
import 'package:flutter_application_2/pages/gambar_pages/detailgambar_screen.dart';
import 'package:flutter_application_2/pages/gambar_pages/gambar_screen.dart';
import 'package:flutter_application_2/pages/login_page/loginscreen.dart';
import 'package:flutter_application_2/pages/splash_page/splashscreen.dart';
import 'package:flutter_application_2/provider/contact_model.dart';
import 'package:flutter_application_2/provider/db_manager.dart';
import 'package:flutter_application_2/provider/form_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => FormDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbManager(),
        ),
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
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplassScreen(),
        '/login': (_) => LoginScreen(),
        '/home': (_) => ListGambar(),
        '/detail': (_) => const DetailGambar(),
        '/contact': (_) => HalamanContact(),
        '/edit_contact': (_) => HalamanEditContact(),
      },
    );
  }
}
