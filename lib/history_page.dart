import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';
import 'components/header.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}
class _History extends State<History> {
  List<bool> isHeartFilled = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: 'Historie'),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                             Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text('示例文本', style: TextStyle(fontWeight: FontWeight.bold)), // "Beispieltext" (auf chinesisch)
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isHeartFilled[index] = !isHeartFilled[index];
                                      });
                                    },
                                    child: Icon(
                                      isHeartFilled[index] ? Icons.favorite : Icons.favorite_border,
                                      color: isHeartFilled[index] ? Colors.redAccent : Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: const Divider(),
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text('Beispieltext'),
                                Spacer(),
                                Text('20.05.24')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        context: context
      ),
    );
  }
}