import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime currentDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime?> onDateSelected;

  CustomDatePicker({
    required this.currentDate,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1970),
                  lastDate: DateTime(currentDate.year + 50),
                );
                onDateSelected(selectDate);
              },
            )
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('dd-MM-yyyy').format(selectedDate),
          ),
        ),
      ],
    );
  }
}
