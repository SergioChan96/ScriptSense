import 'package:flutter/material.dart';

import 'package:scriptsense/ui/components/header.dart';


class Impressum extends StatelessWidget {
  const Impressum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Impressum")
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Center (
            child: Column(
              children: [
                Text("Impressum")
              ],
            ),
          ),
        ),
      ),
    );
  }
}