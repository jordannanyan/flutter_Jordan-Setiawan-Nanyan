import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_list_model.dart';
import 'package:flutter_application_1/provider/contact_model.dart';
import 'package:flutter_application_1/provider/form_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:flutter_application_1/widget/color_picker_widget.dart';
import 'package:flutter_application_1/widget/contact_list_widget.dart';
import 'package:flutter_application_1/widget/date_picker_widget.dart';
import 'package:flutter_application_1/widget/file_picker_widget.dart';
import 'package:flutter_application_1/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class HalamanContact extends StatelessWidget {
  HalamanContact({super.key});

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

  void addContact(String nameNew, String numberNew, String formatDateNew,
      Color colorsNew, String fileNew, BuildContext context) {
    final contact =
        Contact(nameNew, numberNew, formatDateNew, colorsNew, fileNew);
    final contactModel = Provider.of<ContactModel>(context, listen: false);
    contactModel.addContact(contact);
    nameController.clear();
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context);

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
            const SizedBox(
              height: 48,
            ),
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
              InputTextField(
                controller: nameController,
                labelText: 'Name',
                isNameValid: isNameValid(context),
                hintText: 'Insert your name',
                errorText: 'Nama tidak benar',
                onChanged: (val) {
                  formData.updateName(val);
                },
              ),
              const SizedBox(height: 16),
              InputTextField(
                controller: numberController,
                labelText: 'Nomor',
                isNameValid: isPhoneNumberValid(context),
                hintText: '08...',
                errorText: 'Nomor tidak benar',
                onChanged: (val) {
                  formData.updatePhoneNo(val);
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
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: CustomDatePicker(
                  currentDate: formData.formData.currentDate,
                  selectedDate: formData.formData.dueDate,
                  onDateSelected: (date) {
                    formData.updateDate(date);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomColorPicker(
                initialColor: formData.formData.currentColor,
                onColorChanged: (color) {
                  formData.updateColor(color);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFilePicker(),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(darkpurpleColor),
                  ),
                  onPressed: ((isNameValid(context) &&
                          isPhoneNumberValid(context) &&
                          formData.formData.formattedDate.isNotEmpty &&
                          formData.formData.formattedDate.isNotEmpty &&
                          formData.formData.fileName.isNotEmpty))
                      ? () {
                          addContact(
                            formData.formData.name,
                            formData.formData.phoneNo,
                            formData.formData.formattedDate,
                            formData.formData.colors,
                            formData.formData.fileName,
                            context,
                          );
                          formData.clearFormData();
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
                  Consumer<ContactModel>(
                      builder: (context, contactModel, child) {
                    return ContactList(
                      onEdit: (index) {
                        // _showEditDialog(context, index);
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
