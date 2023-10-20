import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/page/HalamanProyek.dart';

void main() {
  testWidgets('UI Test for HalamanProyek Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HalamanProyek(),
    ));

    expect(find.text('Contact us'), findsOneWidget);
    expect(find.text('Hubungi kami dengan mengisi form ini!'), findsOneWidget);

    await tester.tap(find.text('Submit'), warnIfMissed: false);
    await tester.pumpAndSettle();
  });
}
