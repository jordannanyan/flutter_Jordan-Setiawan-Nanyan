import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/colors.dart';
import '../model/contact_model.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const ContactList({
    super.key,
    required this.contacts,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: contacts.length,
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
          subtitle: Text(contacts[index].phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: lightblackColor,
                ),
                onPressed: () {
                  onEdit(index);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: lightblackColor,
                ),
                onPressed: () {
                  onDelete(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
