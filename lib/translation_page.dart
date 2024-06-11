import 'package:chinese_ocr/components/bottom_nav_bar.dart';
import 'package:chinese_ocr/components/header.dart';
import 'package:flutter/material.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

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
        child: Center(
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
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 1),
                          child: DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                              value: 'ZHO',
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
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 1),
                          child:
                          DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                              value: 'DEU',
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
      ),
      ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, context: context,
      ),
    );
  }
}