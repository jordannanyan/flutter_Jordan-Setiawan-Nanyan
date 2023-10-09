import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/contact_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  final Function(int) onEdit;
  const ContactList({
    super.key,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (context, contactModel, child) {
      return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: contactModel.contacts.length,
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
            title: Text(contactModel.contacts[index].name),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contactModel.contacts[index].phoneNumber),
                Text(contactModel.contacts[index].dateNow),
                Text(contactModel.contacts[index].colorNow.toString()),
                Text(contactModel.contacts[index].fileNow),
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
                      arguments: index,
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: lightblackColor,
                  ),
                  onPressed: () {
                    contactModel.deleteContact(index);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
