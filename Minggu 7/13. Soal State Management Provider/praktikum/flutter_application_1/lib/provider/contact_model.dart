import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_list_model.dart';

class ContactModel extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    if (index >= 0 && index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }

  void editContact(Contact newContact, int index) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] =
          newContact; // Replace the contact at the specified index
      notifyListeners();
    }
  }
}
