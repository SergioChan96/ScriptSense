import 'package:chinese_ocr/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}
class _Settings extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Einstellungen")
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Center (
            child: Column(
              children: [
                const Padding (
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Generelle Einstellungen",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text('Weiter Einstellungen', style: TextStyle(color: Colors.black)),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                  ],
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: const Divider(),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Weiter Einstellungen', style: TextStyle(color: Colors.black)),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                ],
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: const Divider(),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Weiter Einstellungen', style: TextStyle(color: Colors.black)),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                ],
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: const Divider(),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text('Weiter Einstellungen', style: TextStyle(color: Colors.black)),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                  ],
                                )
                            ),
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
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, context: context,
      ),
    );
  }
}