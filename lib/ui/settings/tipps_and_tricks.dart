import 'package:flutter/material.dart';

import '../components/header.dart';


class TippsAndTricks extends StatelessWidget {
  const TippsAndTricks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Tipps und Tricks")
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Center (
            child: Column(
              children: [
                Text("Tipps und Tricks")
              ],
            ),
          ),
        ),
      ),
    );
  }
}