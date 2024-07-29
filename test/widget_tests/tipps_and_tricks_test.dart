import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/pages/sub_settings/tipps_and_tricks.dart';


void main() {
  testWidgets('TippsAndTricks widget displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: TippsAndTricks(),
      ),
    );

    expect(find.byType(Header), findsOneWidget);
    expect(find.text('Tipps und Tricks'), findsOneWidget);

    expect(find.text('Bevor Sie anfangen'), findsOneWidget);
    expect(find.text('Verstehen Sie den Text, den Sie übersetzen möchten. Lesen Sie ihn komplett durch und machen Sie eine Pause, bevor Sie beginnen.'), findsOneWidget);

    expect(find.text('Die Recherche'), findsOneWidget);
    expect(find.text('Investieren Sie Zeit in die Recherche des Themas. Notieren Sie sich wichtige Ausdrücke und klären Sie alle Probleme.'), findsOneWidget);

    expect(find.text('Formulieren Sie natürlich'), findsOneWidget);
    expect(find.text('Ihr Text muss natürlich klingen. Verstehen Sie die Botschaft des Ausgangstextes und formulieren Sie sie in Ihren eigenen Worten.'), findsOneWidget);

    expect(find.text('Formulieren Sie klangvoll'), findsOneWidget);
    expect(find.text('Ein ausdrucksvoller Text ist überzeugender. Nutzen Sie ein Wörterbuch und schmücken Sie Ihre Sätze aus.'), findsOneWidget);

    expect(find.text('Verpassen Sie nicht den Anschluss'), findsOneWidget);
    expect(find.text('Bleiben Sie in Übung mit Ihrer Muttersprache durch Lesen und Hören von Inhalten in dieser Sprache.'), findsOneWidget);

    expect(find.text('Zeigen Sie Mut, aber überschätzen Sie sich nicht'), findsOneWidget);
    expect(find.text('Eine sichere Übersetzung kann mutig sein, aber überschätzen Sie Ihre Fähigkeiten nicht und bleiben Sie bei Ihren Stärken.'), findsOneWidget);

    expect(find.text('Am Ende noch einmal durchlesen'), findsOneWidget);
    expect(find.text('Lesen Sie Ihre fertige Übersetzung am nächsten Tag erneut durch und nehmen Sie sich Zeit für den letzten Schliff.'), findsOneWidget);

    expect(find.byType(BottomNavBar), findsOneWidget);

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(13)); // Adjust according to actual implementation
    expect(find.byType(SizedBox), findsNWidgets(19)); // Adjust according to actual implementation
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
