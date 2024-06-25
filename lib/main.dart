import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chinese_ocr/services/theme_provider.dart';
import 'package:chinese_ocr/router/router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const ScriptSense(),
    ),
  );
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Script Sense',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
    );
  }
}
