import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/color_picker_bloc/color_picker_bloc.dart';
import 'package:flutter_application_1/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_application_1/bloc/date_picker_blog/date_picker_bloc.dart';
import 'package:flutter_application_1/bloc/file_picker_bloc/file_picker_bloc.dart';
import 'package:flutter_application_1/bloc/name_bloc/name_bloc.dart';
import 'package:flutter_application_1/bloc/number_state/number_bloc.dart';
import 'package:flutter_application_1/pages/contact_pages/contact_screen.dart';
import 'package:flutter_application_1/pages/contact_pages/edit_contact_screen.dart';
import 'package:flutter_application_1/pages/gambar_pages/detailgambar_screen.dart';
import 'package:flutter_application_1/pages/gambar_pages/gambar_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NameBloc>(
          create: (context) => NameBloc(),
        ),
        BlocProvider<NumberBloc>(
          create: (context) => NumberBloc(),
        ),
        BlocProvider<DatePickerBloc>(
          create: (context) => DatePickerBloc(),
        ),
        BlocProvider<ColorPickerBloc>(
          create: (context) => ColorPickerBloc(),
        ),
        BlocProvider<FilePickerBloc>(
          create: (context) => FilePickerBloc(),
        ),
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
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
