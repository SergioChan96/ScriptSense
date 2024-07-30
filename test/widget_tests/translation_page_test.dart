import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:scriptsense/services/translation_service.dart';
import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/pages/translation_page.dart';


class MockTranslationService extends Mock implements TranslationService {}

void main() {
  setUpAll(() {
    registerFallbackValue(MaterialPageRoute<void>(builder: (_) => Container()));
  });

  testWidgets('Translation page widget test', (WidgetTester tester) async {
    final mockTranslationService = MockTranslationService();

    when(() => mockTranslationService.translate(any(), any(), any()))
        .thenAnswer((_) async => 'Translated text');

    await tester.pumpWidget(
      MaterialApp(
        home: Provider<TranslationService>.value(
          value: mockTranslationService,
          child: Translation(),
        ),
      ),
    );

    //expect(find.text('Übersetzung'), findsOneWidget);

    expect(find.byType(InfoButton), findsOneWidget);

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Hello world');

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump();

    //verify(() => mockTranslationService.translate(any(), any(), 'Hello world')).called(1);

   // expect(find.text('Translated text'), findsOneWidget);

    expect(find.byType(BottomNavBar), findsOneWidget);
  });
}