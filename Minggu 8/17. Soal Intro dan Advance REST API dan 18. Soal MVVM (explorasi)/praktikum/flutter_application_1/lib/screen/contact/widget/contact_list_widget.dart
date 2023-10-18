import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/theme/theme_color.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  const ContactList({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    final deleteData = Provider.of<ContactViewModel>(context);
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: contacts.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: lightpurpleColor,
            child: Text(
              "A",
              style: TextStyle(
                color: darkpurpleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(contacts[index].name),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contacts[index].phone),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: lightblackColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/edit_contact',
                    arguments: contacts[index],
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: lightblackColor,
                ),
                onPressed: () {
                  deleteData.deleteContacts(contacts[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
