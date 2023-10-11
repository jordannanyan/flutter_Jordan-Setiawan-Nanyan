import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactList extends StatelessWidget {
  final Function(int) onEdit;
  const ContactList({
    super.key,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final ContactBloc contactBloc = BlocProvider.of<ContactBloc>(context);
    return BlocBuilder<ContactBloc, ContactValueState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: state.contact.length,
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
              title: Text(state.contact[index].name),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.contact[index].phoneNumber),
                  Text(state.contact[index].dateNow),
                  Text(state.contact[index].colorNow.toString()),
                  Text(state.contact[index].fileNow),
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
                      contactBloc.add(DeleteContactEvent(val: index));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
