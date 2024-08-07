import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart' as provider;

import 'package:scriptsense/router/router.dart';
import 'package:scriptsense/services/theme_provider.dart';
import 'model/hive_text_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveTextModelAdapter());
  await Hive.openBox<HiveTextModel>('scannedTexts');
  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: ProviderScope(
        child: ScriptSense(),
      )
    ),
  );
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = provider.Provider.of<ThemeProvider>(context);

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

