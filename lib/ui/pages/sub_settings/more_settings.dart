import 'package:flutter/material.dart';

import 'package:scriptsense/ui/components/header.dart';


class MoreSettings extends StatefulWidget {
  const MoreSettings({super.key});

  @override
  State<MoreSettings> createState() => _MoreSettings();
}
class _MoreSettings extends State<MoreSettings> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: "Weitere Einstellungen")
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.09, left: screenHeight * 0.02, right: screenHeight * 0.02),
          child: Center (
            child: Column(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Beispiel Einstellungen",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.01),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: screenWidth * 0.015),
                                      child: Text('Beispiel Einstellung 1', style: TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                )
                            ),
                          ),
                         Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                                    child: Text('Beispiel Einstellung 2', style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Divider(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: screenWidth * 0.015),
                                      child: Text('Beispiel Einstellung 3', style: TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                )
                            ),
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
      ),
    );
  }
}