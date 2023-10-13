import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/text_form_model.dart';

class FormDataProvider extends ChangeNotifier {
  final FormDataModel _formData = FormDataModel();

  FormDataModel get formData => _formData;

  void updateId(int id) {
    _formData.id = id;
    notifyListeners();
  }

  void updateName(String name) {
    _formData.name = name;
    notifyListeners();
  }

  void updatePhoneNo(String phoneNo) {
    _formData.phoneNo = phoneNo;
    notifyListeners();
  }

  void updateUsername(String username) async {
    _formData.username = username;
    notifyListeners();
  }

  void updatePassword(String password) {
    _formData.password = password;
    notifyListeners();
  }

  void clearFormData() {
    formData.name = '';
    formData.phoneNo = '';
    notifyListeners();
  }
}
