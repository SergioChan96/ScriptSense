import 'package:flutter/material.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';

class TippsAndTricks extends StatelessWidget {
  const TippsAndTricks({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Tipps und Tricks"),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.08, left: screenHeight * 0.02, right: screenHeight * 0.02),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(screenHeight * 0.025),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bevor Sie anfangen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Verstehen Sie den Text, den Sie übersetzen möchten. Lesen Sie ihn komplett durch und machen Sie eine Pause, bevor Sie beginnen.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Die Recherche",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Investieren Sie Zeit in die Recherche des Themas. Notieren Sie sich wichtige Ausdrücke und klären Sie alle Probleme.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Formulieren Sie natürlich",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Ihr Text muss natürlich klingen. Verstehen Sie die Botschaft des Ausgangstextes und formulieren Sie sie in Ihren eigenen Worten.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Formulieren Sie klangvoll",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Ein ausdrucksvoller Text ist überzeugender. Nutzen Sie ein Wörterbuch und schmücken Sie Ihre Sätze aus.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Verpassen Sie nicht den Anschluss",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Bleiben Sie in Übung mit Ihrer Muttersprache durch Lesen und Hören von Inhalten in dieser Sprache.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Zeigen Sie Mut, aber überschätzen Sie sich nicht",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Eine sichere Übersetzung kann mutig sein, aber überschätzen Sie Ihre Fähigkeiten nicht und bleiben Sie bei Ihren Stärken.",
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Am Ende noch einmal durchlesen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenHeight * 0.01),
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
