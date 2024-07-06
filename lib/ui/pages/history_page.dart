import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:scriptsense/ui/buttons/info_button.dart';
import 'package:scriptsense/ui/buttons/filter_button.dart';
import 'package:scriptsense/ui/components/bottom_nav_bar.dart';
import 'package:scriptsense/ui/components/header.dart';
import '../../model/hive_text_model.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  bool showOnlyFavorites = false;
  bool sortDateAscending = false;
  bool sortDateDescending = true;
  String? dropdownValue = 'Meine Favoriten';
  List<bool> isHeartFilled = [];
  //String _translatedText = '';
  //final TranslationService _translationService = TranslationService();
  List<HiveTextModel> savedItems = [];
  late Box<HiveTextModel> box;

  @override
  void initState() {
    super.initState();
    initHive();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initHive();
  }

  Future<void> initHive() async {
     box = await Hive.openBox<HiveTextModel>('scannedTexts');
     isHeartFilled = List<bool>.filled(box.length, false);
   // savedItems = box.values.toList();
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final resultController = ref.watch(resultControllerProvider.notifier);
   // var savedItems = resultController.savedItems;


   /* savedItems.sort((a, b) {
      var dateA = DateFormat('MM/dd/yyyy').parse(a.scanDate);
      var dateB = DateFormat('MM/dd/yyyy').parse(b.scanDate);
      return sortDateAscending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
    });*/

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: 'Historie'),
          ];
        },
        body: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 15),
                    child: FilterButton(
                      onFavoriteFilterChanged: (bool value) {
                        setState(() {
                          showOnlyFavorites = value;
                        });
                      },
                      onDateAscendingFilterChanged: (bool value) {
                        setState(() {
                          sortDateAscending = value;
                        });
                      },
                      onDateDescendingFilterChanged: (bool value) {
                        setState(() {
                          sortDateDescending = value;
                        });
                      },
                    ),
                  ),
                ),
                Spacer(),
                InfoButton(
                  infoText: "Behalten Sie den Überblick über Ihre bisherigen Übersetzungen! In der Verlauf-Seite unserer App können Sie jederzeit auf Ihre früher gescannten und übersetzten Texte zugreifen. Einfach und übersichtlich - hier finden Sie all Ihre Übersetzungen an einem Ort gespeichert, damit Sie diese bei Bedarf schnell wiederfinden und nachschlagen können.",
                ),
              ],
            ),
      FutureBuilder(
                    future: initHive(),
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (box.isEmpty){
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                Padding (
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'Noch keine gescannten Übersetzungen',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        );
                      } else {
                        var items = box.values.toList();
                        items.sort((a, b) {
                          var dateA = DateFormat('d/M/y').parse(a.scanDate);
                          var dateB = DateFormat('d/M/y').parse(b.scanDate);
                          return sortDateAscending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
                        });
                        return Expanded(
                        child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (BuildContext context, int index)
                        {
                          if (showOnlyFavorites && !items[index].isFavorite) {
                            return Container();
                          }
                          return Center(
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 20.0,
                                      top: 10.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            items[index].scanDate,
                                            style: TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 5.0, top: 10.0),
                                              child: Text(
                                                items[index].originalText,
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.zero,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    var item = box.getAt(index);
                                                    var updatedItem = HiveTextModel(
                                                      item!.originalText,
                                                      item.translatedText,
                                                      item.scanDate,
                                                      isFavorite: !item.isFavorite,
                                                    );
                                                    box.putAt(index, updatedItem);
                                                  });
                                                },
                                                child: Icon(
                                                  box.getAt(index)!.isFavorite ? Icons.favorite : Icons.favorite_border,
                                                  color: box.getAt(index)!.isFavorite ? Colors.redAccent : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7.0, bottom: 7.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: const Divider(),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(items[index]
                                                .translatedText),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    box.deleteAt(index);
                                                    //savedItems.removeAt(index);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      )
                        );
                     }
                    },
                  ) //
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        context: context,
      ),
    );
  }
}
