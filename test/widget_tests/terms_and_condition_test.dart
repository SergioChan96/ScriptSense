import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/pages/sub_settings/terms_and_condition.dart';


void main() {
  testWidgets('TermsAndConditions displays correctly with all components', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: TermsAndConditions(),
      ),
    );

    expect(find.byType(Header), findsOneWidget);
    expect(find.text('Nutzungsbedingungen'), findsOneWidget);

    expect(find.text('1. Einleitung'), findsOneWidget);
    expect(find.text('Willkommen bei unserer Übersetzungs-App. Durch den Zugriff auf unsere Dienste erklären Sie sich mit diesen Nutzungsbedingungen einverstanden. Bitte lesen Sie diese sorgfältig durch.'), findsOneWidget);

    expect(find.text('2. Nutzung der App'), findsOneWidget);
    expect(find.text('Sie dürfen unsere App nur in Übereinstimmung mit diesen Bedingungen und den geltenden Gesetzen nutzen. Sie stimmen zu, die App nicht für illegale Zwecke zu verwenden.'), findsOneWidget);

    expect(find.text('4. Inhalte'), findsOneWidget);
    expect(find.text('Unsere App ermöglicht es Benutzern, Inhalte zu übersetzen. Sie sind für die Rechtmäßigkeit und Genauigkeit der von Ihnen eingereichten Inhalte verantwortlich.'), findsOneWidget);

    expect(find.text('5. Geistiges Eigentum'), findsOneWidget);
    expect(find.text('Die Inhalte und Materialien in unserer App sind durch Urheberrechte und andere geistige Eigentumsrechte geschützt. Sie dürfen diese nur in Übereinstimmung mit diesen Bedingungen nutzen.'), findsOneWidget);

    expect(find.text('6. Haftungsbeschränkung'), findsOneWidget);
    expect(find.text('Wir übernehmen keine Haftung für Schäden, die durch die Nutzung unserer App entstehen, soweit dies gesetzlich zulässig ist.'), findsOneWidget);

    expect(find.text('7. Änderungen der Bedingungen'), findsOneWidget);
    expect(find.text('Wir behalten uns das Recht vor, diese Nutzungsbedingungen jederzeit zu ändern. Änderungen werden durch die Veröffentlichung der neuen Bedingungen in der App wirksam.'), findsOneWidget);

    expect(find.text('8. Kontakt'), findsOneWidget);
    expect(find.text('Wenn Sie Fragen zu diesen Nutzungsbedingungen haben, kontaktieren Sie uns bitte unter: info@fakemail.de'), findsOneWidget);

    expect(find.text('25.06.2024'), findsOneWidget);

    expect(find.byType(BottomNavBar), findsOneWidget);

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(13));
    expect(find.byType(SizedBox), findsNWidgets(20));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
