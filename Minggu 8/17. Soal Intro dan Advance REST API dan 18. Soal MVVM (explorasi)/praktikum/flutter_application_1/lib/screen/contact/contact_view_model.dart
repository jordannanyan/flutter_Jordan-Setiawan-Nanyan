import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/api/contact_api.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/model/text_form_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }

  postContacts(Contact contactData) async {
    final c = await ContactAPI.postContact(contactData);
    print(c.toString());
    notifyListeners();
  }

  putContacts(Contact contactData) async {
    final c = await ContactAPI.putContact(contactData);
    print(c.toString());
    notifyListeners();
  }

  deleteContacts(Contact contactData) async {
    final c = await ContactAPI.deleteContact(contactData.id);
    print(c.toString());
    notifyListeners();
  }

  final FormDataModel _formData = FormDataModel();

  FormDataModel get formData => _formData;

  void updateName(String name) {
    _formData.name = name;
    _formData.nameMessageError = "";
    if (name.isEmpty) _formData.nameMessageError = "Nama Tidak Boleh Kosong";
    final words = name.split(' ');
    if (words.length < 2) _formData.nameMessageError = "Harus Lebih Dari 2";
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        _formData.nameMessageError = "Tidak Boleh Ada Karakter Khusus";
      }
    }
    notifyListeners();
  }

  void updatePhoneNo(String phoneNo) {
    _formData.phoneNo = phoneNo;
    _formData.phoneMessageError = "";
    if (phoneNo.isEmpty) {
      _formData.phoneMessageError = "Tdak Boleh Kosong";
    } else if (!phoneNo.startsWith('0')) {
      _formData.phoneMessageError = "Harus Mulai Dengan 0";
    } else if (!RegExp(r'^[0-9]{8,15}$').hasMatch(phoneNo)) {
      _formData.phoneMessageError = "TIdak Boleh Kurang Dari 7 Angka";
    }
    notifyListeners();
  }

  void clearFormData() {
    formData.name = '';
    formData.phoneNo = '';
    notifyListeners();
  }
}
