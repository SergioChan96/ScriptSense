import 'package:flutter/material.dart';

import 'package:chinese_ocr/router/router.dart';
import 'package:chinese_ocr/ui/evaluate_page.dart';
import 'ui/components/bottom_nav_bar.dart';
import 'ui/components/header.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const ScriptSense());
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      /*title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScriptSensePage(title: 'ScriptSense Home'),*/
    );
  }
}

