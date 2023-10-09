import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/text_form_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:intl/intl.dart';

class FormDataProvider extends ChangeNotifier {
  final FormDataModel _formData = FormDataModel();

  FormDataModel get formData => _formData;

  void updateName(String name) {
    _formData.name = name;
    notifyListeners();
  }

  void updatePhoneNo(String phoneNo) {
    _formData.phoneNo = phoneNo;
    notifyListeners();
  }

  void updateDate(DateTime? date) {
    _formData.dueDate = date ?? _formData.currentDate;
    _formData.formattedDate =
        DateFormat('dd-MM-yyyy').format(_formData.dueDate);
    notifyListeners();
  }

  void updateColor(Color color) {
    _formData.currentColor = color;
    _formData.colors = color;
    notifyListeners();
  }

  void updateFileName(String fileName) {
    _formData.fileName = fileName;
    notifyListeners();
  }

  void clearFormData() {
    formData.name = '';
    formData.phoneNo = '';
    formData.formattedDate = '';
    formData.colors = orangeColor;
    formData.currentColor = orangeColor;
    formData.fileName = '';
    formData.dueDate = DateTime.now();
    notifyListeners();
  }
}
