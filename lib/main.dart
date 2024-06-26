import 'package:flutter/material.dart';

import 'package:scriptsense/router/router.dart';

void main() {
  runApp(const ScriptSense());
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      /*
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScriptSensePage(title: 'ScriptSense Home'),
      */
    );
  }
}

