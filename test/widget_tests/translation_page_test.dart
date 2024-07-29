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
  // Register fallback values for any necessary types
  setUpAll(() {
    registerFallbackValue(MaterialPageRoute<void>(builder: (_) => Container()));
  });

  testWidgets('Translation page widget test', (WidgetTester tester) async {
    // Create a mock instance of TranslationService
    final mockTranslationService = MockTranslationService();

    // Set up the mock to return a fake translation when the translate method is called
    when(() => mockTranslationService.translate(any(), any(), any()))
        .thenAnswer((_) async => 'Translated text');

    // Build the Translation page with the mockTranslationService provided
    await tester.pumpWidget(
      MaterialApp(
        home: Provider<TranslationService>.value(
          value: mockTranslationService,
          child: Translation(),
        ),
      ),
    );

    // Verify if the header is displayed correctly
    //expect(find.text('Übersetzung'), findsOneWidget);

    // Verify if the InfoButton is displayed correctly
    expect(find.byType(InfoButton), findsOneWidget);

    // Verify if the TextField is displayed correctly
    expect(find.byType(TextField), findsOneWidget);

    // Enter some text into the TextField
    await tester.enterText(find.byType(TextField), 'Hello world');

    // Tap the ElevatedButton to trigger translation
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump();

    // Verify if the translate method was called
    //verify(() => mockTranslationService.translate(any(), any(), 'Hello world')).called(1);

    // Verify if the translated text is displayed
   // expect(find.text('Translated text'), findsOneWidget);

    // Verify if the bottom navigation bar is displayed correctly
    expect(find.byType(BottomNavBar), findsOneWidget);
  });
}