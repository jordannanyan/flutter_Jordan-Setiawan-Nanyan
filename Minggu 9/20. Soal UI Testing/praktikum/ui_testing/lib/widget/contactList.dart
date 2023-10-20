import 'package:flutter/material.dart';
import 'package:ui_testing/style/colors.dart';
import '../model/contact_model.dart';

class ContactList extends StatelessWidget {
  final List<Contact> list;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const ContactList({
    super.key,
    required this.list,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: list.length,
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
          title: Text(list[index].name),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(list[index].phoneNumber),
              Text(list[index].dateNow),
              Text(list[index].colorNow.toString()),
              Text(list[index].fileNow),
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
