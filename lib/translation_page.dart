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
      appBar: const Header(title: 'Übersetzung'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
              mainAxisAlignment: MainAxisAlignment.center, // Center the children
              children: [
                Card(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: DropdownButton<String>(
                          value: 'ZHO',
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
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Icon(Icons.sync_alt, color: Colors.redAccent)),
                Card(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: DropdownButton<String>(
                          value: 'ZHO',
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
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        context: context,
      ),
    );
  }
}