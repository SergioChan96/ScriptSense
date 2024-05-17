import 'package:chinese_ocr/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _Settings();
}
class _Settings extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate'),
      ),
      body: ListView(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, context: context,
      ),
    );
  }
}