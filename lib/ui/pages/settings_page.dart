import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/services/theme_provider.dart';
import 'package:scriptsense/router/typed_routes.dart';
import '../../model/hive_text_model.dart';


class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  _Settings createState() => _Settings();
}

class _Settings extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = provider.Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Einstellungen")
          ];
        },
        body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.02, right: screenWidth * 0.02),
          child: Center (
            child: Column(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Informationen",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                    child: Card(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () { ImpressumRoute().go(context);},
                              child: Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0.01),
                                  child: Row(
                                    children: [
                                      Icon(Icons.info_outline, color: Colors.grey, size: screenHeight * 0.025),
                                      Padding(
                                        padding: EdgeInsets.only(left: screenWidth * 0.015),
                                        child: Text(
                                          'Impressum',
                                          style: TextStyle(
                                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: screenHeight * 0.02)
                                     ],
                                  )
                              ),
                          ),
                         Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                          TextButton(
                              onPressed: () { TermsAndConditionsRoute().go(context);},
                              child: Row(
                                children: [
                                  Icon(Icons.privacy_tip_outlined, color: Colors.grey, size: screenHeight * 0.025,),
                                  Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                                    child: Text(
                                      'Nutzungsbedingungen',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    )
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: screenHeight * 0.02,)
                                ],
                              )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                          TextButton(
                              onPressed: () {TippsAndTricksRoute().go(context);},
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                  child:Row(
                                      children: [
                                        Icon(Icons.tips_and_updates_outlined, color: Colors.grey, size: screenHeight * 0.025,),
                                        Padding(
                                          padding: EdgeInsets.only(left: screenWidth * 0.015),
                                          child: Text(
                                            'Tipps und Tricks',
                                            style: TextStyle(
                                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                            ),
                                          )
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: screenHeight * 0.02,)
                                      ],
                                  )
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Generelle Einstellungen",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.005),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.dark_mode_outlined, color: Colors.grey, size: screenHeight * 0.025,),
                                    Padding(
                                      padding: EdgeInsets.only(left: screenWidth * 0.015),
                                      child: Text(
                                        'Darkmode',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                        ),
                                      )
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
                                            themeProvider.toggleTheme(isDarkMode);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                           Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                          TextButton(
                              onPressed: () { MoreSettingsRoute().go(context);},
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                  child: Row(
                                children: [
                                  Icon(Icons.question_mark_outlined, color: Colors.grey, size: screenHeight * 0.025,),
                                  Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                                    child: Text(
                                      'Weitere Einstellung',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    )
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: screenHeight * 0.02,)
                                ],
                              )
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
                    padding: EdgeInsets.only(top: screenHeight * 0.035, bottom: screenHeight * 0.01),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.005),
                            child: TextButton(
                                onPressed: () {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Sind Sie sicher?'),
                                        content: Text('Das löschen Ihrer gesammten Historie ist nicht rückgängig zu machen.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Abbruch'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Historie löschen', style: TextStyle(color: Colors.redAccent)),
                                            onPressed: () async {
                                              final box = await Hive.openBox<HiveTextModel>('scannedTexts');
                                              await box.clear();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.cleaning_services_outlined, color: Colors.redAccent, size: screenHeight * 0.025,),
                                    Padding(
                                      padding: EdgeInsets.only(left: screenWidth * 0.015),
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
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        context: context,
      ),
    );
  }
}