import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mocktail/mocktail.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/pages/home_page.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
        navigatorObservers: [MockNavigatorObserver()],
      ),
    );

    expect(find.byType(Header), findsOneWidget);
    expect(find.byType(BottomNavBar), findsOneWidget);
    expect(find.text('ScriptSense'), findsOneWidget);

    expect(find.byType(InfoButton), findsOneWidget);

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is SvgPicture && widget.height == 0.2 * MediaQuery.of(tester.element(find.byType(SvgPicture))).size.height), findsOneWidget);

    expect(find.text('Translate Now.'), findsOneWidget);

    expect(find.text('Anytime, Anywhere'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Start Scan'), findsOneWidget);

    final navigatorObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
        navigatorObservers: [navigatorObserver],
      ),
    );
  });
}
