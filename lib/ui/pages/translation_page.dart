import 'package:flutter/material.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/components/header.dart';

import '../../services/translation_service.dart';


class Translation extends StatefulWidget {
  final String translation;
  const Translation({super.key, this.translation = 'default'});

  @override
  State<Translation> createState() => _Translation();
}

class _Translation extends State<Translation> {

  final Map<String, String> languageCodes = {
    'ZHO': 'zh-CN',
    'ENG': 'en',
    'DEU': 'de',
  };

  final TranslationService _translationService = TranslationService();
  String _translatedText = '';
  final TextEditingController _textController = TextEditingController();
  String _sourceLanguage = 'ZHO';
  String _targetLanguage = 'DEU';

  void _translate() async {
    try {
      final sourceLanguageCode = languageCodes[_sourceLanguage];
      final targetLanguageCode = languageCodes[_targetLanguage];
      final translatedText = await _translationService.translate(sourceLanguageCode!, targetLanguageCode!, _textController.text);
      setState(() {
        _translatedText = translatedText;
      });
    } catch (e, s) {
      print('Failed to translate text: $e');
      print('Error Type: ${e.runtimeType}');
      print('Stack trace: $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: <Widget>[
        const Header(title: "Übersetzung"),
        SliverFillRemaining(
        child: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(minHeight: 150),
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, bottom: 20.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 121,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: _translate,
                        child: Text('Übersetzen', style: TextStyle(color: Colors.redAccent)),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                              value: _sourceLanguage,
                              style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.grey.shade900,
                              ),
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
                                onChanged: (value) {
                                  setState(() {
                                    _sourceLanguage = value!;
                                  });
                                },
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
                             Icons.sync_alt, // TO DO: maybe different icon damit für user klar wird von welcher sprache in welche übersetzte wird (idee pfeil von links nach rechts)
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
                              value: _targetLanguage,
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.grey.shade900,
                              ),
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
                                onChanged: (value) {
                                  setState(() {
                                    _targetLanguage = value!;
                                  });
                                },
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
                        child: Text(
                          _translatedText,
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
    ),
        ),
      ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        context: context,
      ),
    );
  }
}