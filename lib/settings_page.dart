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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Settings'),
                )
            )
          ];
        },
        body: ListView()
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, context: context,
      ),
    );
  }
}