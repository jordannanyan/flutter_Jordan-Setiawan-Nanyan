import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/page/PrioritasSatu.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('UI Test for PrioritasSatu', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: PrioritasSatu()));

    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Select'), findsOneWidget);

    await tester.tap(find.text('Select'), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.byType(CalendarDatePicker), findsOneWidget);
    await tester.pumpAndSettle();

    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
    expect(find.text(formattedDate), findsOneWidget);
    await tester.tap(find.text(formattedDate), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text('Pick Color'), findsOneWidget);

    await tester.tap(find.text('Pick Color'), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.byType(ColorPicker), findsOneWidget);

    await tester.tap(find.text('Saver'), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text('Pick and Open File'), findsOneWidget);
  });
}
