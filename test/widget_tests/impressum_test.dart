import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/pages/sub_settings/impressum.dart';


void main() {
  testWidgets('Impressum displays correctly with all components', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Impressum(),
      ),
    );

    expect(find.byType(Header), findsOneWidget);
    expect(find.text('Impressum'), findsOneWidget);

    expect(find.byType(BottomNavBar), findsOneWidget);

    expect(find.text('Angaben gemäß § 5 TMG:'), findsOneWidget);
    expect(find.text('Sergio Chan'), findsNWidgets(2));
    expect(find.text('Sarah Misaras'), findsNWidgets(2));
    expect(find.text('HTWG Konstanz'), findsOneWidget);
    expect(find.text('Alfred-Wachtel-Str. 8'), findsOneWidget);
    expect(find.text('Konstanz, 78462'), findsOneWidget);

    expect(find.text('Vertreten durch:'), findsOneWidget);
    expect(find.text('Kontakt:'), findsOneWidget);
    expect(find.text('Telefon: ...'), findsOneWidget);
    expect(find.text('E-Mail: ...'), findsOneWidget);

    expect(find.text('Registereintrag:'), findsOneWidget);
    expect(find.text('Eintragung im Handelsregister.'), findsOneWidget);
    expect(find.text('Registergericht: Amtsgericht Musterstadt'), findsOneWidget);
    expect(find.text('Registernummer: HRB 12345'), findsOneWidget);

    expect(find.text('Umsatzsteuer-ID:'), findsOneWidget);
    expect(find.text('Umsatzsteuer-Identifikationsnummer gemäß §27 a Umsatzsteuergesetz: DE123456789'), findsOneWidget);

    expect(find.text('Berufsbezeichnung und berufsrechtliche Regelungen:'), findsOneWidget);
    expect(find.text('Berufsbezeichnung: Übersetzer'), findsOneWidget);
    expect(find.text('Zuständige Kammer: Industrie- und Handelskammer Musterstadt'), findsOneWidget);
    expect(find.text('Verliehen durch: Bundesrepublik Deutschland'), findsOneWidget);
    expect(find.text('Es gelten folgende berufsrechtliche Regelungen: [Berufsrechtliche Regelung]'), findsOneWidget);
    expect(find.text('Regelungen einsehbar unter: [Link zur Regelung]'), findsOneWidget);

    expect(find.text('Haftungsausschluss (Disclaimer):'), findsOneWidget);
    expect(find.text('Haftung für Inhalte'), findsOneWidget);
    expect(find.text('Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.'), findsOneWidget);

    expect(find.text('Online-Streitbeilegung'), findsOneWidget);
    expect(find.text('Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: https://ec.europa.eu/consumers/odr Unsere E-Mail-Adresse finden Sie oben im Impressum.'), findsOneWidget);

    expect(find.text('Quelle: Impressum-Generator von e-recht24.de'), findsOneWidget);
  });
}
