import 'package:flutter/material.dart';

import '../../router/typed_routes.dart';


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
              HomeRoute().go(context);
              break;
            case 1:
              HistoryRoute().go(context);
              break;
            case 2:
              TranslationRoute().go(context);
              break;
            case 3:
              SettingsRoute().go(context);
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
              icon: Icon(Icons.sub_settings, color: color,),
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