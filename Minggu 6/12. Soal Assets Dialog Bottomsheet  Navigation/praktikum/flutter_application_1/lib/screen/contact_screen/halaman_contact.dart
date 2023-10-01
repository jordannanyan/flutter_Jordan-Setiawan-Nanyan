import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:flutter_application_1/widget/contact_list.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class HalamanContact extends StatefulWidget {
  const HalamanContact({super.key});

  @override
  State<HalamanContact> createState() => _HalamanContactState();
}

class _HalamanContactState extends State<HalamanContact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  String name = "";
  String phoneNo = "";
  List<Contact> list = [];
  String formattedDate = "";
  Color colors = orangeColor;
  String fileName = "";
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = orangeColor;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
    setState(() {
      fileName = file.name; // Store the file name
    });
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

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

  void deleteList(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void addContact(String nameNew, String numberNew, String formatDateNew,
      Color colorsNew, String fileNew) {
    final contact =
        Contact(nameNew, numberNew, formatDateNew, colorsNew, fileNew);
    setState(() {
      list.add(contact);
      nameController.clear();
      numberController.clear();
      name = "";
      phoneNo = "";
    });
  }

  void editlist(int index, String newName, String newNumber) {
    setState(() {
      list[index].name = newName;
      list[index].phoneNumber = newNumber;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  void _showEditDialog(BuildContext context, int index) {
    String newName = list[index].name;
    String newNumber = list[index].phoneNumber;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit List"),
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
                          editlist(index, newName, newNumber);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: const Text(
          'Interactive Widget',
          style: TextStyle(
            color: lightpurpleColor,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: darkpurpleColor,
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "Contact",
                style: TextStyle(
                    color: lightgreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                "Gambar",
                style: TextStyle(
                    color: lightgreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/',
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: blackColor, width: 1),
                  ),
                ),
                child: const Text('Tugas Prioritas Dua Untuk Minggu 5 Flutter'),
              ),
              const SizedBox(
                height: 16,
              ),
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
                  fillColor: lightgreyColor,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorText: isNameValid(name) ? null : 'Nama Tidak Benar',
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
                  fillColor: lightgreyColor,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorText:
                      isPhoneNumberValid(phoneNo) ? null : 'Nomor Tidak Benar',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (val) {
                  setState(() {
                    phoneNo = val;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Date'),
                        TextButton(
                          child: const Text('Select'),
                          onPressed: () async {
                            final selectDate = await showDatePicker(
                              context: context,
                              initialDate: currentDate,
                              firstDate: DateTime(1970),
                              lastDate: DateTime(currentDate.year + 50),
                            );
                            setState(() {
                              if (selectDate != null) {
                                _dueDate = selectDate;
                                formattedDate = (DateFormat('dd-MM-yyyy')
                                    .format(selectDate));
                              }
                            });
                          },
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(_dueDate),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Color'),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: _currentColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_currentColor),
                  ),
                  child: const Text('Pick Color'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick Your Color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                                pickerColor: _currentColor,
                                onColorChanged: (color) {
                                  setState(() {
                                    _currentColor = color;
                                    colors = _currentColor;
                                  });
                                }),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Pick File'),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Pick and Open File'),
                  onPressed: () {
                    _pickFile();
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(darkpurpleColor),
                  ),
                  onPressed: ((isNameValid(name) &&
                          isPhoneNumberValid(phoneNo) &&
                          formattedDate.isNotEmpty))
                      ? () {
                          print(name);
                          print(phoneNo);
                          print(formattedDate);
                          print(colors);
                          print(fileName);
                          addContact(
                              name, phoneNo, formattedDate, colors, fileName);
                        }
                      : null,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: lightpurpleColor,
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
                    list: list,
                    onEdit: (index) {
                      _showEditDialog(context, index);
                    },
                    onDelete: (index) {
                      deleteList(index);
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
