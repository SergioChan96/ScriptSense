import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/router/typed_routes.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/components/header.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = "ScriptSense";

  @override
  State<HomePage> createState() => _HomePage();
}


class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Header(title: "ScriptSense"),
          SliverFillRemaining(
            child: Column (
              children: [
                InfoButton(infoText: "Mit unserer App wird das Übersetzen "
                    "chinesischen Textes in Ihre gewünschte Sprache zum Kinderspiel! "
                    "Alles, was Sie tun müssen, ist auf „Scan starten” zu drücken, "
                    "Ihre Kamera auf den Text zu richten und unserer App den Rest zu überlassen"),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: screenWidth * 0.05, top: screenWidth * 0.02),
                           child: SvgPicture.asset('assets/Logo.svg', height: screenHeight * 0.2, width: screenHeight * 0.2),
                        ),
                        Text(
                          "Translate Now.",
                          style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Anytime, Anywhere",
                          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        ElevatedButton(
                          onPressed: () { CameraRoute().go(context);},
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