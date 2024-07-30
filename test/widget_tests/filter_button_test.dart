import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/buttons/filter_button.dart';


void main() {
  testWidgets('FilterButton shows PopupMenu and handles selections correctly', (WidgetTester tester) async {
    bool isFavoriteFilterChanged = false;
    bool isDateAscendingFilterChanged = false;
    bool isDateDescendingFilterChanged = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: FilterButton(
              onFavoriteFilterChanged: (bool value) {
                isFavoriteFilterChanged = value;
              },
              onDateAscendingFilterChanged: (bool value) {
                isDateAscendingFilterChanged = value;
              },
              onDateDescendingFilterChanged: (bool value) {
                isDateDescendingFilterChanged = value;
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(isFavoriteFilterChanged, isFalse);
    expect(isDateAscendingFilterChanged, isFalse);
    expect(isDateDescendingFilterChanged, isFalse);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Meine Favoriten'), findsOneWidget);
    expect(find.text('Datum aufsteigend'), findsOneWidget);
    expect(find.text('Datum absteigend'), findsOneWidget);

   await tester.tap(find.text('Meine Favoriten'));
    await tester.pumpAndSettle();

    expect(isFavoriteFilterChanged, isTrue);
    expect(isDateAscendingFilterChanged, isFalse);
    expect(isDateDescendingFilterChanged, isFalse);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Datum aufsteigend'));
    await tester.pumpAndSettle();

    expect(isFavoriteFilterChanged, isTrue);
    expect(isDateAscendingFilterChanged, isTrue);
    expect(isDateDescendingFilterChanged, isFalse);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Datum absteigend'));
    await tester.pumpAndSettle();

    expect(isFavoriteFilterChanged, isTrue);
    expect(isDateAscendingFilterChanged, isFalse);
    expect(isDateDescendingFilterChanged, isTrue);
  });
}
