import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_color.dart';

class FormDataModel {
  String name = "";
  String phoneNo = "";
  String formattedDate = "";
  DateTime dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  Color colors = orangeColor;
  Color currentColor = orangeColor;
  String fileName = "";
}
