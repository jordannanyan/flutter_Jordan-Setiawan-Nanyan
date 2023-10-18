import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/theme/theme_color.dart';
import 'package:flutter_application_1/screen/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class HalamanEditContact extends StatelessWidget {
  HalamanEditContact({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  void editContact(int id, String name, String phone, BuildContext context) {
    Contact contact = Contact(id: id, name: name, phone: phone);
    Provider.of<ContactViewModel>(context, listen: false).putContacts(contact);
    Provider.of<ContactViewModel>(context, listen: false).clearFormData();
    nameController.clear();
    numberController.clear();
    Navigator.of(context).popAndPushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    final contactData = ModalRoute.of(context)?.settings.arguments as Contact;
    final formData = Provider.of<ContactViewModel>(context);
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
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nama'),
                  Text(contactData.name),
                ],
              ),
              InputTextField(
                controller: nameController,
                labelText: 'Edit Nama',
                hintText: 'Masukan nama baru',
                errorText: formData.formData.nameMessageError,
                onChanged: (val) {
                  formData.updateName(val);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('No Telp'),
                  Text(contactData.phone),
                ],
              ),
              InputTextField(
                controller: numberController,
                labelText: 'Edit No Telp',
                hintText: 'Masukan Nomor baru',
                errorText: formData.formData.phoneMessageError,
                onChanged: (val) {
                  formData.updatePhoneNo(val);
                },
              ),
              const SizedBox(
                height: 20,
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
                          editContact(
                            contactData.id,
                            formData.formData.name,
                            formData.formData.phoneNo,
                            context,
                          );
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
      ),
    );
  }
}
