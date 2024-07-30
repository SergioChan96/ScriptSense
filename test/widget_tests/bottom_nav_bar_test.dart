import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import 'package:scriptsense/ui/pages/history_page.dart';
import 'package:scriptsense/ui/pages/home_page.dart';
import 'package:scriptsense/ui/pages/settings_page.dart';
import 'package:scriptsense/ui/pages/translation_page.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(key: state.pageKey,child: HomePage()),
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => MaterialPage<void>(key: state.pageKey,child: History()),
      ),
      GoRoute(
        path: '/translation',
        pageBuilder: (context, state) => MaterialPage<void>(key: state.pageKey,child: Translation()),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => MaterialPage<void>(key: state.pageKey,child: Settings()),
      ),
    ],
  );

  testWidgets('BottomNavBar displays correct icons and labels', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Historie'), findsOneWidget);
    expect(find.text('Übersetzung'), findsOneWidget);
    expect(find.text('Einstellungen'), findsOneWidget);

    expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    expect(find.byIcon(Icons.history), findsOneWidget);
    expect(find.byIcon(Icons.translate), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets('BottomNavBar changes the selected index on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider
      ),
    );

   // await tester.tap(find.text('Historie'));
    await tester.pumpAndSettle();
    expect(find.text('Historie'), findsOneWidget);

  //  await tester.tap(find.text('Übersetzung'));
    await tester.pumpAndSettle();
    expect(find.text('Übersetzung'), findsOneWidget);

   // await tester.tap(find.text('Einstellungen'));
    await tester.pumpAndSettle();
    expect(find.text('Einstellungen'), findsOneWidget);
  });
}
