import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chinese_ocr/router/router.dart';
import 'package:chinese_ocr/ui/evaluate_page.dart';
import 'components/bottom_nav_bar.dart';
import 'components/header.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = "Home";


  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //final int _counter = 0;

  /*void _incrementCounter() {
    context.go('/evaluate_page');
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Evaluate()),
    );*/
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Header(title: "Home"),
          SliverFillRemaining(
            child: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/evaluate'),
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