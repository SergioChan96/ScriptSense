import 'package:chinese_ocr/ui/buttons/filter_button.dart';
import 'package:flutter/material.dart';

import 'buttons/info_button.dart';
import 'components/bottom_nav_bar.dart';
import 'components/header.dart';

class History extends StatefulWidget {
  final String history;
  const History({super.key, this.history = 'default'});

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  List<bool> isHeartFilled = List.filled(5, false);
  bool showOnlyFavorites = false;
  bool sortDateAscending = false;
  bool sortDateDescending = false;
  String? dropdownValue = 'Meine Favoriten';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: 'Historie'),
          ];
        },
        body: Column(
            children: [
              Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: FilterButton(
                          onFilterChanged: (bool value) {
                            setState(() {
                              showOnlyFavorites = value;
                              sortDateAscending = value;
                              sortDateDescending = value;
                            });
                          },
                        ),
                      )
                  ),
                  Spacer(),
                  InfoButton(infoText: "Behalten Sie den Überblick über Ihre bisherigen Übersetzungen! In der Verlauf-Seite unserer App können Sie jederzeit auf Ihre früher gescannten und übersetzten Texte zugreifen. Einfach und übersichtlich - hier finden Sie all Ihre Übersetzungen an einem Ort gespeichert, damit Sie diese bei Bedarf schnell wiederfinden und nachschlagen können.",),
                ]
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    if (showOnlyFavorites && !isHeartFilled[index]) {
                      return Container();
                    }
                        return Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '2023-12-31',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                                            child: Text('示例文本', style: TextStyle(fontWeight: FontWeight.bold)), // "Beispieltext" (auf chinesisch)
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: EdgeInsets.zero,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isHeartFilled[index] = !isHeartFilled[index];
                                                });
                                              },
                                              child: Icon(
                                                isHeartFilled[index] ? Icons.favorite : Icons.favorite_border,
                                                color: isHeartFilled[index] ? Colors.redAccent : Colors.grey,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 1,
                                            child: const Divider(),
                                          ),
                                        ),
                                      ),
                                      const Row(
                                        children: [
                                          Text('Beispieltext'),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Icon(Icons.delete, color: Colors.grey,)
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },

                ),
              ),
            ]
          )
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        context: context,
      ),
    );
  }
}