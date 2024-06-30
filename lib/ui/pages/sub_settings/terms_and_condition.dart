import 'package:flutter/material.dart';
import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Nutzungsbedingungen"),
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
                    child:  Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "1. Einleitung",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Willkommen bei unserer Übersetzungs-App. Durch den Zugriff auf unsere Dienste erklären Sie sich mit diesen Nutzungsbedingungen einverstanden. Bitte lesen Sie diese sorgfältig durch.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "2. Nutzung der App",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Sie dürfen unsere App nur in Übereinstimmung mit diesen Bedingungen und den geltenden Gesetzen nutzen. Sie stimmen zu, die App nicht für illegale Zwecke zu verwenden.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "4. Inhalte",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Unsere App ermöglicht es Benutzern, Inhalte zu übersetzen. Sie sind für die Rechtmäßigkeit und Genauigkeit der von Ihnen eingereichten Inhalte verantwortlich.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "5. Geistiges Eigentum",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Die Inhalte und Materialien in unserer App sind durch Urheberrechte und andere geistige Eigentumsrechte geschützt. Sie dürfen diese nur in Übereinstimmung mit diesen Bedingungen nutzen.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "6. Haftungsbeschränkung",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Wir übernehmen keine Haftung für Schäden, die durch die Nutzung unserer App entstehen, soweit dies gesetzlich zulässig ist.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "7. Änderungen der Bedingungen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Wir behalten uns das Recht vor, diese Nutzungsbedingungen jederzeit zu ändern. Änderungen werden durch die Veröffentlichung der neuen Bedingungen in der App wirksam.",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "8. Kontakt",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Wenn Sie Fragen zu diesen Nutzungsbedingungen haben, kontaktieren Sie uns bitte unter: info@fakemail.de",
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "25.06.2024",
                                style: TextStyle(color: Colors.grey),
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
