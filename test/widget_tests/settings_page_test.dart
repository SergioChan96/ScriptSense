import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart' as provider;

import 'package:scriptsense/services/theme_provider.dart';
import 'package:scriptsense/ui/pages/settings_page.dart';


class MockThemeProvider extends Mock implements ThemeProvider {}

void main() {
  setUpAll(() {
    registerFallbackValue(MaterialPageRoute<void>(builder: (_) => Container()));
  });

  testWidgets('Settings page widget test', (WidgetTester tester) async {
    final mockThemeProvider = MockThemeProvider();

    when(() => mockThemeProvider.themeMode).thenReturn(ThemeMode.light);
    when(() => mockThemeProvider.toggleTheme(any())).thenAnswer((_) async {});

    await tester.pumpWidget(
      ProviderScope(
        child: provider.ChangeNotifierProvider<ThemeProvider>.value(
          value: mockThemeProvider,
          child: MaterialApp(
            home: const Settings(),
          ),
        ),
      ),
    );

    expect(find.text('Informationen'), findsOneWidget);

    expect(find.text('Generelle Einstellungen'), findsOneWidget);

    expect(find.text('Impressum'), findsOneWidget);

    expect(find.text('Darkmode'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    Switch darkModeSwitch = tester.widget(find.byType(Switch));
    expect(darkModeSwitch.value, isFalse);

    await tester.tap(find.byType(Switch));
    await tester.pump();

    expect(find.text('Historie löschen'), findsOneWidget);
  });
}
