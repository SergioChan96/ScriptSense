import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';
import 'components/header.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}
class _History extends State<History> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Historie'),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 0.0,
              floating: false,
              pinned: true,
              //flexibleSpace: FlexibleSpaceBar(
              //  title: Text(''),
              //)
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text('示例文本', style: TextStyle(fontWeight: FontWeight.bold)), // "Beispieltext" (auf chinesisch)
                                Spacer(),
                                Icon(Icons.favorite_border, color: Colors.redAccent)
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
          currentIndex: 1,
          context: context
        )
    );
  }
}