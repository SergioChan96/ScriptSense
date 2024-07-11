import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scriptsense/controller/hive_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    final hiveList = ref.watch(hiveControllerProvider);
    final hiveController = ref.read(hiveControllerProvider.notifier);
    hiveController.init();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
          onRefresh: hiveController.updateList,
          child: switch(hiveController.box) {
            null => const Center(child: CircularProgressIndicator()),
            _ => NestedScrollView(
              headerSliverBuilder: (BuildContext context,
                  bool innerBoxIsScrolled) {
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
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.065,
                              top: screenHeight * 0.02),
                          child: FilterButton(
                            onFavoriteFilterChanged: (bool value) {
                              setState(() {
                                showOnlyFavorites = value;
                              });
                            },
                            onDateAscendingFilterChanged: (bool value) {
                              hiveController.sortAscending();
                            },
                            onDateDescendingFilterChanged: (bool value) {
                              hiveController.sortDescending();
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
                  hiveController.box!.isEmpty
                      ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.05),
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history,
                              size: screenHeight * 0.065,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.01),
                              child: Text(
                                'Noch keine gescannten Übersetzungen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenHeight * 0.025,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Expanded(
                      child: ListView.builder(
                        itemCount: hiveList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (showOnlyFavorites &&
                              !hiveList[index].isFavorite) {
                            return Container();
                          }
                          return Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.015),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: screenWidth * 0.04,
                                      right: screenWidth * 0.04,
                                      bottom: screenHeight * 0.02,
                                      top: screenHeight * 0.01,
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            hiveList[index].scanDate,
                                            style: TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenHeight *
                                                      0.01,
                                                  top: screenHeight *
                                                      0.007),
                                              child: Text(
                                                hiveList[index].originalText,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.zero,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    var item = hiveList[index];
                                                    var updatedItem = HiveTextModel(
                                                      item.originalText,
                                                      item.translatedText,
                                                      item.scanDate,
                                                      isFavorite: !item
                                                          .isFavorite,
                                                    );
                                                    hiveController.box!.putAt(index, updatedItem);
                                                  });
                                                },
                                                child: Icon(
                                                  hiveList[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                                                  color: hiveList[index].isFavorite ? Colors.redAccent : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.007,
                                              bottom: screenHeight *
                                                  0.007),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: const Divider(),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(hiveList[index].translatedText),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenHeight *
                                                      0.005),
                                              child: GestureDetector(
                                                onTap: () {
                                                  hiveController.box!.deleteAt(index);
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
                        },
                      )
                  ),
                ],
              )
          ),
        }
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        context: context,
      ),
    );
  }
}
