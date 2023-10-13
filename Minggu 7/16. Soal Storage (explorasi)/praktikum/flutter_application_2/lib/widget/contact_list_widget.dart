import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/db_manager.dart';
import 'package:flutter_application_2/theme/theme_color.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  final Function(int) onEdit;
  const ContactList({
    super.key,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DbManager>(builder: (context, taskModel, child) {
      final taskData = taskModel.TaskModels;
      return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: taskData.length,
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
            title: Text(taskData[index].taskName),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskData[index].taskNumber),
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
                  onPressed: () async {
                    Navigator.of(context).pushNamed(
                      '/edit_contact',
                      arguments:
                          await taskModel.getTaskById(taskData[index].id!),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: lightblackColor,
                  ),
                  onPressed: () {
                    taskModel.deleteTask(taskData[index].id!.toInt());
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
