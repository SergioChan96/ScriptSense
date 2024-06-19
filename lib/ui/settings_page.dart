import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/header.dart';
import 'package:chinese_ocr/ui/components/bottom_nav_bar.dart';


class Settings extends StatefulWidget {
  final String setting;
  const Settings({super.key, this.setting = 'default'});

  @override
  State<Settings> createState() => _Settings();
}
class _Settings extends State<Settings> {
  bool isDarkMode = false;

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
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Center (
            child: Column(
              children: [
                const Padding (
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Informationen",
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
                          TextButton(
                              onPressed: () => context.go('/impressum'),
                              child: const Row(
                                children: [
                                  Icon(Icons.info_outline, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Impressum', style: TextStyle(color: Colors.black)),
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
                              onPressed: () => context.go('/terms_and_conditions'),
                              child: const Row(
                                children: [
                                  Icon(Icons.privacy_tip_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Nutzungsbedingungen', style: TextStyle(color: Colors.black)),
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
                              onPressed: () => context.go('/tipps_and_tricks.dart'),
                              child: const Row(
                                children: [
                                  Icon(Icons.tips_and_updates_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Tipps und Tricks', style: TextStyle(color: Colors.black)),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Padding (
                  padding: EdgeInsets.only(left: 10.0, top: 30.0),
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
                                child: Row(
                                  children: [
                                    Icon(Icons.dark_mode_outlined, color: Colors.grey, size: 20,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text('Darkmode', style: TextStyle(color: Colors.black)),
                                    ),
                                    Spacer(),
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Switch(
                                        value: isDarkMode,
                                        activeTrackColor: Colors.redAccent,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            isDarkMode = value;
                                            // TO DO: dark mode logic
                                          });
                                        },
                                      ),
                                    ),
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
                              onPressed: () => context.go('more_settings'),
                              child: const Row(
                                children: [
                                  Icon(Icons.question_mark_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('Weitere Einstellung', style: TextStyle(color: Colors.black)),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 20,)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.cleaning_services_outlined, color: Colors.redAccent, size: 20,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text('Historie löschen', style: TextStyle(color: Colors.redAccent)),
                                    ),
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
        selectedIndex: 3,
        context: context,
      ),
    );
  }
}