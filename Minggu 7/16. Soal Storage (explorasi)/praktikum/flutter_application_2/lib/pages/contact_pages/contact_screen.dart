import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:flutter_application_2/pages/login_page/loginscreen.dart';
import 'package:flutter_application_2/provider/contact_model.dart';
import 'package:flutter_application_2/provider/db_manager.dart';
import 'package:flutter_application_2/provider/form_model.dart';
import 'package:flutter_application_2/theme/theme_color.dart';
import 'package:flutter_application_2/widget/contact_list_widget.dart';
import 'package:flutter_application_2/widget/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanContact extends StatefulWidget {
  HalamanContact({super.key});

  @override
  State<HalamanContact> createState() => _HalamanContactState();
}

class _HalamanContactState extends State<HalamanContact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  late SharedPreferences loginData;
  String name = "";

  @override
  void initState() {
    super.initState();
    dataLogin();
  }

  void dataLogin() async {
    FormDataProvider formData =
        Provider.of<FormDataProvider>(context, listen: false);
    loginData = await SharedPreferences.getInstance();
    formData.updateUsername(loginData.getString('username').toString());
  }

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

  void addContact(String nameNew, String numberNew, BuildContext context) {
    final taskData = TaskModel(taskName: nameNew, taskNumber: numberNew);
    final taskModel = Provider.of<DbManager>(context, listen: false);
    taskModel.addTask(taskData);
    nameController.clear();
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: Text(
          formData.formData.username,
          style: const TextStyle(
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
            ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                loginData.setBool('login', false);
                loginData.remove('username');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
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
                obscureText: false,
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
                obscureText: false,
                onChanged: (val) {
                  formData.updatePhoneNo(val);
                },
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
                  onPressed:
                      ((isNameValid(context) && isPhoneNumberValid(context)))
                          ? () {
                              addContact(
                                formData.formData.name,
                                formData.formData.phoneNo,
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
