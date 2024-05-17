import 'package:chinese_ocr/history_page.dart';
import 'package:chinese_ocr/main.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends NavigationBar{
  static const Color color = Colors.redAccent;
  int currentIndex;
  BottomNavBar({required this.currentIndex, required BuildContext context}):
        super(
    destinations: [
      NavigationDestination(
          icon: Icon(Icons.camera_alt, color: color,),
          label: "Home"
      ),
      NavigationDestination(
          icon: Icon(Icons.history, color: color,),
          label: "Historie"
      ),
      NavigationDestination(
          icon: Icon(Icons.translate, color: color,),
          label: "Uebersetzung"
      ),
      NavigationDestination(
          icon: Icon(Icons.settings, color: color,),
          label: "Settings"
      ),
    ],
    onDestinationSelected: (int index) {
      if (index == currentIndex) {
        return;
      }
      switch(index) {
        case 0:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScriptSensePage(title: 'Home')));
          break;
        case 1:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => History()));
          break;
        case 2:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ScriptSensePage(title: 'Uebersetzer')));
          break;
        case 3:
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Settings()));
          break;
      }
    },
  );
}