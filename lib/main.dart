import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scriptsense/result_page.dart';
import 'package:flutter/material.dart';
import 'package:scriptsense/components/bottom_nav_bar.dart';
import 'package:scriptsense/components/header.dart';

void main() {
  runApp(ProviderScope(
    child: ScriptSense(),
  ));
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScriptSense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScriptSensePage(title: 'ScriptSense Home'),
    );
  }
}

class ScriptSensePage extends StatefulWidget {
  const ScriptSensePage({super.key, required this.title});
  final String title;

  @override
  State<ScriptSensePage> createState() => _ScriptSensePage();
}

class _ScriptSensePage extends State<ScriptSensePage> {
  //final int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResultPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: widget.title),
      body: Center(
        child: ElevatedButton(
          onPressed:_incrementCounter,
          child: const Text("Scan Page"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        context: context,
      ),
    );
  }
}
