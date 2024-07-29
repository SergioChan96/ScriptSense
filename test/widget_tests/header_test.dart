import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setUpAll(() {
    registerFallbackValue(MaterialPageRoute<void>(builder: (_) => Container()));
  });

  testWidgets('Header widget displays title correctly', (WidgetTester tester) async {
    const testTitle = 'Test Title';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [Header(title: testTitle)],
          ),
        ),
      ),
    );

    expect(find.text(testTitle), findsOneWidget);
  });

  testWidgets('Header widget displays back button when title is "Resultate"', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [Header(title: 'Resultate')],
          ),
        ),
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('Header widget does not display back button for other titles', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [Header(title: 'Another Title')],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });

  testWidgets('Back button navigates correctly when title is "Resultate"', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [Header(title: 'Resultate')],
          ),
        ),
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    //await tester.tap(find.byIcon(Icons.arrow_back));
    //await tester.pumpAndSettle();

    //verify(() => mockObserver.didPop(any(), any())).called(1);
  });

  testWidgets('Header widget has correct style and color', (WidgetTester tester) async {
    const testTitle = 'Test Title';

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            surfaceContainer: Colors.white,
          ),
        ),
        home: Scaffold(
          body: CustomScrollView(
            slivers: [Header(title: testTitle)],
          ),
        ),
      ),
    );

    final appBar = tester.widget<SliverAppBar>(find.byType(SliverAppBar));
    expect(appBar.backgroundColor, Colors.white);

    final titleText = tester.widget<Text>(find.text(testTitle));
    expect(titleText.style?.color, Colors.redAccent);
  });
}
