import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/prioritasDuaPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
        ),
      ),
      home: const PrioritasDua(),
    );
  }
}
