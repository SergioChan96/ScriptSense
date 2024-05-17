import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _History();
}
class _History extends State<History> {


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
                title: Text('Nested Scroll View Example'),
              )
            )
          ];
        },
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('input Text'),
                      Spacer(),
                      Icon(Icons.favorite)
                    ],
                  ),
                  Row(
                    children: [
                      Text('ueberstzung des Textes'),
                      Spacer(),
                      Text('20.05.24')
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        context: context
      ),
    );
  }

}