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
      body: Column(
        children: [
          TextField(),
          Row(
            children: [
              Card(
                child: Padding(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem<Text>(
                            child: Text("ZHO")
                        ),
                        DropdownMenuItem(
                            child: Text("ENG")
                        ),
                        DropdownMenuItem(
                            child: Text("DEU")
                        )
                      ],
                      onChanged: (value) {  },
                    )
                )
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.sync_alt)),
              Card(
                  child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem<Text>(
                              child: Text("ZHO")
                          ),
                          DropdownMenuItem(
                              child: Text("ENG")
                          ),
                          DropdownMenuItem(
                              child: Text("DEU")
                          )
                        ],
                        onChanged: (value) {  },
                      )
                  )
              ),
            ],
          ),
          TextField()
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, context: context,
      ),
    );
  }
}