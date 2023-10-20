import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/page/PrioritasDua.dart';

void main() {
  testWidgets('UI Test for PrioritasDua', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PrioritasDua(),
    ));

    expect(find.text('Tugas Prioritas Dua Untuk Minggu 5 Flutter'),
        findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Number'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Select'), findsOneWidget);
    expect(find.text('Color'), findsOneWidget);
    expect(find.text('Pick Color'), findsOneWidget);
    expect(find.text('Pick File'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('List Contact'), findsOneWidget);

    final nameTextField = find.byWidgetPredicate(
      (widget) => widget is TextField && widget.decoration?.labelText == 'Name',
    );
    await tester.enterText(nameTextField, 'John Doe');

    final numberTextField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Number',
    );
    await tester.enterText(numberTextField, '123456');

    final selectDateButton = find.widgetWithText(TextButton, 'Select');
    await tester.tap(selectDateButton);
    await tester.pumpAndSettle();

    final pickColorButton = find.widgetWithText(ElevatedButton, 'Pick Color');
    await tester.tap(pickColorButton);
    await tester.pumpAndSettle();

    final submitButton = find.widgetWithText(ElevatedButton, 'Submit');
    expect(submitButton, findsOneWidget);
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
  });
}
