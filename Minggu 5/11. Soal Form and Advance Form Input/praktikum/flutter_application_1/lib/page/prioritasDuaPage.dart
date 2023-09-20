import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/contactList.dart';
import '../model/contact_model.dart';
import '../style/colors.dart';

class PrioritasDua extends StatefulWidget {
  const PrioritasDua({super.key});

  @override
  State<PrioritasDua> createState() => _PrioritasDuaState();
}

class _PrioritasDuaState extends State<PrioritasDua> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  String name = "";
  String phoneNo = "";
  List<Contact> contacts = [];

  bool isNameValid(String name) {
    if (name.isEmpty) return false;
    final words = name.split(' ');
    if (words.length < 2) return false;
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }

  bool isPhoneNumberValid(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;
    if (!RegExp(r'^[0-9]{8,15}$').hasMatch(phoneNumber)) return false;
    if (!phoneNumber.startsWith('0')) return false;
    return true;
  }

  void addContact(String name, String number) {
    final contact = Contact(name, number);
    setState(() {
      contacts.add(contact);
      nameController.clear();
      numberController.clear();
      name = "";
      phoneNo = "";
    });
  }

  void editContact(int index, String newName, String newNumber) {
    setState(() {
      contacts[index].name = newName;
      contacts[index].phoneNumber = newNumber;
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _showEditDialog(BuildContext context, int index) {
    String newName = contacts[index].name;
    String newNumber = contacts[index].phoneNumber;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Contact"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "New Name"),
                onChanged: (value) {
                  newName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "New Number"),
                onChanged: (value) {
                  newNumber = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed:
                  ((isNameValid(newName) && isPhoneNumberValid(newNumber)))
                      ? () {
                          editContact(index, newName, newNumber);
                          Navigator.of(context).pop();
                        }
                      : null,
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "Contacts",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: lightgreyColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: Color(0xFF625B71),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Create New Contacts",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
                        style: TextStyle(
                          fontSize: 14,
                          color: greyColor,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  hintText: "Insert your name",
                  hintStyle: const TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: const Color(0xFFE7E0EC),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorText: isNameValid(name) ? null : 'Name invalid',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: numberController,
                decoration: InputDecoration(
                  labelText: "Number",
                  labelStyle: const TextStyle(
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  hintText: "+62 ....",
                  hintStyle: const TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: const Color(0xFFE7E0EC),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorText: isPhoneNumberValid(phoneNo)
                      ? null
                      : 'Phone number invalid',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (val) {
                  setState(() {
                    phoneNo = val;
                  });
                },
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed:
                      ((isNameValid(name) && isPhoneNumberValid(phoneNo)))
                          ? () {
                              addContact(name, phoneNo);
                            }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 24,
                      left: 24,
                      top: 10,
                      bottom: 10,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 49,
              ),
              Column(
                children: [
                  const Text(
                    "List Contact",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: lightblackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ContactList(
                    contacts: contacts,
                    onEdit: (index) {
                      _showEditDialog(context, index);
                    },
                    onDelete: (index) {
                      deleteContact(index);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
