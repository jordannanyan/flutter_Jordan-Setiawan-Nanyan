import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/screen/contact/widget/contact_list_widget.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/theme/theme_color.dart';
import 'package:flutter_application_1/screen/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class HalamanContact extends StatefulWidget {
  const HalamanContact({super.key});

  @override
  State<HalamanContact> createState() => _HalamanContactState();
}

class _HalamanContactState extends State<HalamanContact> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  void addContact(int id, String name, String phone) {
    Contact contact = Contact(id: id, name: name, phone: phone);
    Provider.of<ContactViewModel>(context, listen: false).postContacts(contact);
    Provider.of<ContactViewModel>(context, listen: false).clearFormData();
    nameController.clear();
    numberController.clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<ContactViewModel>(context);
    List<Contact> contactData = formData.contacts;
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
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: blackColor, width: 1),
                  ),
                ),
                child: const Text('Tugas API dan MVVM Minggu 8'),
              ),
              const SizedBox(
                height: 16,
              ),
              InputTextField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Insert your name',
                errorText: formData.formData.nameMessageError,
                onChanged: (val) {
                  formData.updateName(val);
                },
              ),
              const SizedBox(height: 16),
              InputTextField(
                controller: numberController,
                labelText: 'Nomor',
                hintText: '08...',
                errorText: formData.formData.phoneMessageError,
                onChanged: (val) {
                  formData.updatePhoneNo(val);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
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
                  onPressed: ((formData.formData.name.isNotEmpty) &&
                          (formData.formData.phoneNo.isNotEmpty))
                      ? () {
                          addContact(
                            (contactData.last.id + 1),
                            formData.formData.name,
                            formData.formData.phoneNo,
                          );
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
                    contacts: contactData,
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
