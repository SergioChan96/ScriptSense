import 'package:chinese_ocr/evaluate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/bottom_nav_bar.dart';

void main() {
  runApp(const ScriptSense());
}

class ScriptSense extends StatelessWidget {
  const ScriptSense({super.key});

  // This widget is the root of your application.
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
  int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Evaluate()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:_incrementCounter,
          child: Text("Scan Page"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        context: context,
      ),
    );
  }
}
