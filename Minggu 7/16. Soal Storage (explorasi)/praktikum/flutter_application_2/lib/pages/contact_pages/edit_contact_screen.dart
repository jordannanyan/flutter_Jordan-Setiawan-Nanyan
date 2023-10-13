import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:flutter_application_2/provider/db_manager.dart';
import 'package:flutter_application_2/provider/form_model.dart';
import 'package:flutter_application_2/theme/theme_color.dart';
import 'package:flutter_application_2/widget/text_field_widget.dart';
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

  void editContact(
      String nameNew, String numberNew, int index, BuildContext context) {
    final taskData =
        TaskModel(id: index, taskName: nameNew, taskNumber: numberNew);
    final taskModel = Provider.of<DbManager>(context, listen: false);
    taskModel.updateTask(taskData);
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
        return Consumer<DbManager>(builder: (context, taskModel, child) {
          final taskData =
              ModalRoute.of(context)?.settings.arguments as TaskModel;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nama Sebelumnya'),
                      Text(taskData.taskName),
                    ],
                  ),
                  InputTextField(
                    controller: nameController,
                    labelText: 'Edit Nama',
                    hintText: 'Masukan nama baru',
                    errorText: 'Nama tidak benar',
                    obscureText: false,
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
                      Text(taskData.taskNumber),
                    ],
                  ),
                  InputTextField(
                    controller: numberController,
                    labelText: 'Edit No Telp',
                    hintText: 'Masukan Nomor baru',
                    errorText: 'Nomor tidak benar',
                    obscureText: false,
                    isNameValid: isPhoneNumberValid(context),
                    onChanged: (val) {
                      formProvider.updatePhoneNo(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(darkpurpleColor),
                      ),
                      onPressed: ((isNameValid(context) &&
                              isPhoneNumberValid(context)))
                          ? () {
                              editContact(
                                formProvider.formData.name,
                                formProvider.formData.phoneNo,
                                taskData.id!.toInt(),
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
