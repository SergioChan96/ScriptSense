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