import 'package:flutter/material.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/components/header.dart';


class Translation extends StatefulWidget {
  final String translation;
  const Translation({super.key, this.translation = 'default'});


  @override
  State<Translation> createState() => _Translation();
}
class _Translation extends State<Translation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
        const Header(title: "Übersetzung"),
        SliverFillRemaining(
        child: Column(
          children: [
            InfoButton(infoText: "Erleben Sie maximale Flexibilität beim Übersetzen! Auf der manuellen Übersetzungsseite unserer App können Sie beliebige chinesische Texte eingeben und sofort in Ihre gewünschte Sprache übersetzen lassen. Geben Sie den Text einfach in das dafür vorgesehene Feld ein und drücken Sie auf 'Übersetzen'. Unsere App liefert Ihnen prompt eine präzise Übersetzung."),
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 150),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
                          child: DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                              value: 'ZHO',
                              style: TextStyle(color: Colors.grey.shade900),
                              elevation: 3,
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'ZHO',
                                  child: Text("ZHO"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'ENG',
                                  child: Text("ENG"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'DEU',
                                  child: Text("DEU"),
                                )
                              ],
                              onChanged: (value) {  },
                            )
                          )
                      )
                  ),

                  Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
                      child: ElevatedButton(
                        onPressed: () {

                        },
                         child: const Icon(
                             Icons.sync_alt,
                             color: Colors.redAccent
                         )
                      ),
                  ),

                  Card(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
                          child:
                          DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                              value: 'DEU',
                              style: TextStyle(color: Colors.grey.shade900),
                              elevation: 3,
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'ZHO',
                                  child: Text("ZHO"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'ENG',
                                  child: Text("ENG"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'DEU',
                                  child: Text("DEU"),
                                )
                              ],
                              onChanged: (value) {  },
                              )
                          )
                      )
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 150),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]
      ),
    )
      ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        context: context,
      ),
    );
  }
}