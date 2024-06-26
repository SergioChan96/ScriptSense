import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/bottom_nav_bar.dart';
import 'components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = "ScriptSense";


  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Header(title: "ScriptSense"),
          SliverFillRemaining(
            child: Column (
              children: [
                InfoButton(infoText: "Mit unserer App wird das Übersetzen chinesischen Textes in Ihre gewünschte Sprache zum Kinderspiel! "
                    "Alles, was Sie tun müssen, ist auf „Scan starten” zu drücken, "
                    "Ihre Kamera auf den Text zu richten und unserer App den Rest zu überlassen"),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Translate Now.",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Anytime, Anywhere",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 55),
                        ElevatedButton(
                          onPressed: () => context.go('/evaluate'),
                          child: const Text("Start Scan", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        context: context,
      ),
    );
  }
}