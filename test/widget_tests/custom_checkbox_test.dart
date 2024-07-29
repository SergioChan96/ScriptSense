import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/buttons/custom_checkbox.dart';


void main() {
  testWidgets('CustomCheckbox displays correctly and responds to taps', (WidgetTester tester) async {
    bool isChecked = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CustomCheckbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                isChecked = newValue!;
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.check), findsNothing);
    expect(find.byType(CustomCheckbox), findsOneWidget);

    await tester.tap(find.byType(CustomCheckbox));
    await tester.pump();

    expect(isChecked, isTrue);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CustomCheckbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                isChecked = newValue!;
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(find.byType(CustomCheckbox));
    await tester.pump();

    expect(isChecked, isFalse);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CustomCheckbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                isChecked = newValue!;
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.check), findsNothing);
  });
}
