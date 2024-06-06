import 'package:scriptsense/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}
class _Settings extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Einstellungen'),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
                expandedHeight: 0.0,
                floating: false,
                pinned: true,
                title: Text("Settings"),
            )
          ];
        },
        body: Center (
          child: Column(
            children: [
              const Text("Generelle Einstellungen"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Card(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text("Weiter Einstellungen", style: TextStyle(color: Colors.black)),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, color: Colors.redAccent,)
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text("Weiter Einstellungen", style: TextStyle(color: Colors.black)),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, color: Colors.redAccent,)
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text("Weiter Einstellungen", style: TextStyle(color: Colors.black)),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, color: Colors.redAccent,)
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text("Weiter Einstellungen", style: TextStyle(color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, color: Colors.redAccent,)
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, context: context,
      ),
    );
  }
}