import 'package:chinese_ocr/evaluate.dart';
import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';
import 'components/header.dart';

void main() {
  runApp(const ScriptSense());
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      MaterialPageRoute(builder: (context) => const Evaluate()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Header(title: widget.title), // use the new widget here
          SliverFillRemaining(
            child: Center(
              child: ElevatedButton(
                onPressed:_incrementCounter,
                child: const Text("Scan Page"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        context: context,
      ),
    );
  }
}
