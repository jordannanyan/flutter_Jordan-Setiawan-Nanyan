import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/page/HalamanSample.dart';

void main() {
  testWidgets('UI Test for Sample Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SamplePage(),
    ));

    expect(find.text('Halaman Sample'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);

    // Tap the button
    await tester.tap(find.text('Submit'));
    await tester.pump();
  });
}
