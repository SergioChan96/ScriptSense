import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/history');
              break;
            case 2:
              context.go('/translation');
              break;
            case 3:
              context.go('/settings');
              break;
          }
    },
  );
}


/*import 'package:flutter/material.dart';

import 'package:chinese_ocr/ui/history_page.dart';
import 'package:chinese_ocr/ui/translation_page.dart';
import 'package:chinese_ocr/main.dart';
import 'package:chinese_ocr/ui/settings_page.dart';

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
}*/