import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/gambar_pages/gambar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

typedef NavigationCallback = void Function();

class _SplassScreenState extends State<SplassScreen> {
  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      navigateToListGambar();
    } else {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pushNamed('/login');
        },
      );
    }
  }

  void navigateToListGambar() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ListGambar(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.contact_mail),
      ),
    );
  }
}
