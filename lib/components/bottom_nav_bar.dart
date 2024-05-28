import 'package:flutter/material.dart';

import 'package:chinese_ocr/history_page.dart';
import 'package:chinese_ocr/translation_page.dart';
import 'package:chinese_ocr/main.dart';
import '../settings_page.dart';
import '../translation_page.dart';

class BottomNavBar extends NavigationBar{
  static const Color color = Colors.redAccent;
  BottomNavBar({required super.selectedIndex, required BuildContext context}):
        super(
    destinations: [
      const NavigationDestination(
          icon: Icon(Icons.camera_alt, color: color,),
          label: "Home"
      ),
      const NavigationDestination(
          icon: Icon(Icons.history, color: color,),
          label: "Historie"
      ),
      const NavigationDestination(
          icon: Icon(Icons.translate, color: color,),
          label: "Übersetzung"
      ),
      const NavigationDestination(
          icon: Icon(Icons.settings, color: color,),
          label: "Einstellungen"
      ),
    ],
    onDestinationSelected: (int index) {
      if (index == selectedIndex) {
        return;
      }
      switch(index) {
        case 0:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ScriptSensePage(title: 'Home')));
          break;
        case 1:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const History()));
          break;
        case 2:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Translation()));
          break;
        case 3:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Settings()));
          break;
      }
    },
  );
}