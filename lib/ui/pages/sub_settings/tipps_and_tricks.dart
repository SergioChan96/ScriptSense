import 'package:flutter/material.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';

class TippsAndTricks extends StatelessWidget {
  const TippsAndTricks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Tipps und Tricks"),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Bevor Sie anfangen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Verstehen Sie den Text, den Sie übersetzen möchten. Lesen Sie ihn komplett durch und machen Sie eine Pause, bevor Sie beginnen.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Die Recherche",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Investieren Sie Zeit in die Recherche des Themas. Notieren Sie sich wichtige Ausdrücke und klären Sie alle Probleme.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Formulieren Sie natürlich",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Ihr Text muss natürlich klingen. Verstehen Sie die Botschaft des Ausgangstextes und formulieren Sie sie in Ihren eigenen Worten.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Formulieren Sie klangvoll",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Ein ausdrucksvoller Text ist überzeugender. Nutzen Sie ein Wörterbuch und schmücken Sie Ihre Sätze aus.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Verpassen Sie nicht den Anschluss",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Bleiben Sie in Übung mit Ihrer Muttersprache durch Lesen und Hören von Inhalten in dieser Sprache.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Zeigen Sie Mut, aber überschätzen Sie sich nicht",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Eine sichere Übersetzung kann mutig sein, aber überschätzen Sie Ihre Fähigkeiten nicht und bleiben Sie bei Ihren Stärken.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "Am Ende noch einmal durchlesen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Lesen Sie Ihre fertige Übersetzung am nächsten Tag erneut durch und nehmen Sie sich Zeit für den letzten Schliff.",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        context: context,
      ),
    );
  }
}
