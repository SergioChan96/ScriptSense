import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:scriptsense/ui/components/header.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/services/theme_provider.dart';
import 'package:scriptsense/router/typed_routes.dart';
import '../../controller/result_controller.dart';
import '../../model/hive_text_model.dart';


class Settings extends ConsumerStatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
   // final String setting;
    final resultController = ref.watch(resultControllerProvider.notifier);
    final themeProvider = provider.Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

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
                              onPressed: () { ImpressumRoute().go(context);},
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Impressum',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    ),
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
                              onPressed: () { TermsAndConditionsRoute().go(context);},
                              child: Row(
                                children: [
                                  Icon(Icons.privacy_tip_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Nutzungsbedingungen',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    )
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
                              onPressed: () {TippsAndTricksRoute().go(context);},
                              child: Row(
                                children: [
                                  Icon(Icons.tips_and_updates_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Tipps und Tricks',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    )
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
                              onPressed: () { MoreSettingsRoute().go(context);},
                              child: Row(
                                children: [
                                  Icon(Icons.question_mark_outlined, color: Colors.grey, size: 20,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Weitere Einstellung',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                      ),
                                    )
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
                                onPressed: () {
                                  showDialog(
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
                                              //final box = Hive.box<HiveTextModel>('scannedTexts');
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