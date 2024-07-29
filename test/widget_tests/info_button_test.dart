import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';


void main() {
  testWidgets('InfoButton shows AlertDialog with correct info text', (WidgetTester tester) async {
    const String testInfoText = 'This is a test info text';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InfoButton(infoText: testInfoText),
        ),
      ),
    );

    expect(find.byIcon(Icons.info_outline), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Information'), findsOneWidget);
    expect(find.text(testInfoText), findsOneWidget);

    expect(find.text('Close'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });
}
