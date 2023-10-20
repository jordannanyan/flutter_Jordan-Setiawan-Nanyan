import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/model/contact_model.dart';
import 'package:ui_testing/widget/contactList.dart';

void main() {
  testWidgets('UI Test for ContactList Widget', (WidgetTester tester) async {
    final List<Contact> sampleContacts = [
      Contact("Alice", "123-456-7890", "01/01/2023", Colors.red, "file1"),
      Contact("Bob", "987-654-3210", "02/01/2023", Colors.blue, "file2"),
      Contact("Charlie", "555-555-5555", "03/01/2023", Colors.green, "file3"),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ContactList(
            list: sampleContacts,
            onEdit: (index) {},
            onDelete: (index) {},
          ),
        ),
      ),
    );

    expect(find.byType(ContactList), findsOneWidget);

    for (int index = 0; index < sampleContacts.length; index++) {
      expect(find.text(sampleContacts[index].name), findsOneWidget);
      expect(find.text(sampleContacts[index].phoneNumber), findsOneWidget);
      expect(find.text(sampleContacts[index].dateNow), findsOneWidget);
      expect(
          find.text(sampleContacts[index].colorNow.toString()), findsOneWidget);
      expect(find.text(sampleContacts[index].fileNow), findsOneWidget);

      expect(find.byIcon(Icons.edit), findsNWidgets(sampleContacts.length));
      expect(find.byIcon(Icons.delete), findsNWidgets(sampleContacts.length));
    }
  });
}
