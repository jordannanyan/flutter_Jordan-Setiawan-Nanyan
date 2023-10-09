import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_list_model.dart';
import 'package:flutter_application_1/provider/contact_model.dart';
import 'package:flutter_application_1/provider/form_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:flutter_application_1/widget/color_picker_widget.dart';
import 'package:flutter_application_1/widget/date_picker_widget.dart';
import 'package:flutter_application_1/widget/file_picker_widget.dart';
import 'package:flutter_application_1/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class HalamanEditContact extends StatelessWidget {
  HalamanEditContact({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool isNameValid(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context, listen: false);
    if (formData.formData.name.isEmpty) return false;
    final words = formData.formData.name.split(' ');
    if (words.length < 2) return false;
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }

  bool isPhoneNumberValid(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context, listen: false);
    if (formData.formData.phoneNo.isEmpty) return false;
    if (!RegExp(r'^[0-9]{8,15}$').hasMatch(formData.formData.phoneNo)) {
      return false;
    }
    if (!formData.formData.phoneNo.startsWith('0')) return false;
    return true;
  }

  void editContact(String nameNew, String numberNew, String formatDateNew,
      Color colorsNew, String fileNew, int index, BuildContext context) {
    final contact =
        Contact(nameNew, numberNew, formatDateNew, colorsNew, fileNew);
    final contactModel = Provider.of<ContactModel>(context, listen: false);
    contactModel.editContact(contact, index);
    Navigator.of(context).popAndPushNamed('/contact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: const Text(
          'Edit Data',
          style: TextStyle(
            color: lightpurpleColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/contact');
            },
          ),
        ],
      ),
      body: Consumer<FormDataProvider>(builder: (context, formProvider, child) {
        return Consumer<ContactModel>(builder: (context, contactModel, child) {
          final index = ModalRoute.of(context)?.settings.arguments as int;
          final contact = contactModel.contacts[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nama'),
                      Text(contact.name),
                    ],
                  ),
                  InputTextField(
                    controller: nameController,
                    labelText: 'Edit Nama',
                    hintText: 'Masukan nama baru',
                    errorText: 'Nama tidak benar',
                    isNameValid: isNameValid(context),
                    onChanged: (val) {
                      formProvider.updateName(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('No Telp'),
                      Text(contact.phoneNumber),
                    ],
                  ),
                  InputTextField(
                    controller: numberController,
                    labelText: 'Edit No Telp',
                    hintText: 'Masukan Nomor baru',
                    errorText: 'Nomor tidak benar',
                    isNameValid: isPhoneNumberValid(context),
                    onChanged: (val) {
                      formProvider.updatePhoneNo(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tanggal'),
                      Text(contact.dateNow),
                    ],
                  ),
                  CustomDatePicker(
                    currentDate: formProvider.formData.currentDate,
                    selectedDate: formProvider.formData.dueDate,
                    onDateSelected: (date) {
                      formProvider.updateDate(date);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Warna'),
                      Text(contact.colorNow.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomColorPicker(
                    initialColor: contact.colorNow,
                    onColorChanged: (color) {
                      formProvider.updateColor(color);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('File Sebelumnya'),
                      Text(contact.fileNow, overflow: TextOverflow.fade),
                    ],
                  ),
                  const CustomFilePicker(),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(darkpurpleColor),
                      ),
                      onPressed: ((isNameValid(context) &&
                              isPhoneNumberValid(context) &&
                              formProvider.formData.formattedDate.isNotEmpty &&
                              formProvider.formData.formattedDate.isNotEmpty &&
                              formProvider.formData.fileName.isNotEmpty))
                          ? () {
                              editContact(
                                formProvider.formData.name,
                                formProvider.formData.phoneNo,
                                formProvider.formData.formattedDate,
                                formProvider.formData.colors,
                                formProvider.formData.fileName,
                                index,
                                context,
                              );
                              formProvider.clearFormData();
                            }
                          : null,
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: lightpurpleColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
