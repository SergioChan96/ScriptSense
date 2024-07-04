import 'package:flutter/material.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';

class Impressum extends StatelessWidget {
  const Impressum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Impressum")
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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Angaben gemäß § 5 TMG:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text("Sergio Chan"),
                            Text("Sarah Misaras"),
                            Text("HTWG Konstanz"),
                            Text("Alfred-Wachtel-Str. 8"),
                            Text("Konstanz, 78462"),
                            SizedBox(height: 20.0),
                            Text(
                              "Vertreten durch:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text("Sergio Chan"),
                            Text("Sarah Misaras"),
                            SizedBox(height: 20.0),
                            Text(
                              "Kontakt:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text("Telefon: ..."),
                            Text("E-Mail: ..."),
                            SizedBox(height: 20.0),
                            Text(
                              "Registereintrag:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text("Eintragung im Handelsregister."),
                            Text("Registergericht: Amtsgericht Musterstadt"),
                            Text("Registernummer: HRB 12345"),
                            SizedBox(height: 20.0),
                            Text(
                              "Umsatzsteuer-ID:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                                "Umsatzsteuer-Identifikationsnummer gemäß §27 a Umsatzsteuergesetz: DE123456789"),
                            SizedBox(height: 20.0),
                            Text(
                              "Berufsbezeichnung und berufsrechtliche Regelungen:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text("Berufsbezeichnung: Übersetzer"),
                            Text("Zuständige Kammer: Industrie- und Handelskammer Musterstadt"),
                            Text("Verliehen durch: Bundesrepublik Deutschland"),
                            Text("Es gelten folgende berufsrechtliche Regelungen: [Berufsrechtliche Regelung]"),
                            Text("Regelungen einsehbar unter: [Link zur Regelung]"),
                            SizedBox(height: 20.0),
                            Text(
                              "Haftungsausschluss (Disclaimer):",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Haftung für Inhalte",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.",
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "Online-Streitbeilegung",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: https://ec.europa.eu/consumers/odr Unsere E-Mail-Adresse finden Sie oben im Impressum.",
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "Quelle: Impressum-Generator von e-recht24.de",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
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
