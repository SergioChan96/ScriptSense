import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/pages/sub_settings/more_settings.dart';


void main() {
  testWidgets('MoreSettings displays correctly with all components', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MoreSettings(),
      ),
    );

    expect(find.byType(Header), findsOneWidget);
    expect(find.text('Weitere Einstellungen'), findsOneWidget);

    expect(find.text('Beispiel Einstellungen'), findsOneWidget);

    expect(find.text('Beispiel Einstellung 1'), findsOneWidget);
    expect(find.text('Beispiel Einstellung 2'), findsOneWidget);
    expect(find.text('Beispiel Einstellung 3'), findsOneWidget);

    expect(find.byType(Divider), findsNWidgets(2));

    expect(find.byType(Padding), findsNWidgets(17));
    expect(find.byType(Container), findsNWidgets(5));

    final textButton1 = find.widgetWithText(TextButton, 'Beispiel Einstellung 1');
    final textButton2 = find.widgetWithText(TextButton, 'Beispiel Einstellung 2');
    final textButton3 = find.widgetWithText(TextButton, 'Beispiel Einstellung 3');

    expect(textButton1, findsOneWidget);
    expect(textButton2, findsOneWidget);
    expect(textButton3, findsOneWidget);
  });
}
