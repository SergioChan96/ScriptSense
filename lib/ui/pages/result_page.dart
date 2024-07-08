import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:opencv_dart/opencv_dart.dart';
import 'package:intl/intl.dart'; // needed ??

import 'package:scriptsense/controller/result_controller.dart';
import '../../model/hive_text_model.dart';
import '../../router/typed_routes.dart';
import '../../services/translation_service.dart';
import '../buttons/custom_checkbox.dart';
import '../buttons/info_button.dart';
import '../components/header.dart';

final TranslationService _translationService = TranslationService();

class ResultPage extends ConsumerWidget {
  const ResultPage(this.image, {super.key});
  final String image;

  Future<String> _translate(String result) async {
    try {
      final translatedText = await _translationService.translate('zh-CN', 'de', result);
      return translatedText;
    } catch (e, s) {
      print('Failed to translate text: $e');
      print('Error Type: ${e.runtimeType}');
      print('Stack trace: $s');
      return result;
    }
  }

  void save(Map<Mat, String> imageList, List<bool> boolList, String currentDate) async {
    final box = Hive.box<HiveTextModel>('scannedTexts');
    //List<SaveModel> saveList = [];
    Iterable<Mat> mats = imageList.keys;
    for (int i = 0; i < boolList.length; i++) {
      if (boolList[i]) {
       /* saveList.add(
            SaveModel(
                Image.memory(imencode(ImageFormat.jpg.ext, mats.elementAt(i))),
                imageList[mats.elementAt(i)]!,
                currentDate
            )
        );*/
        String originalText = imageList[mats.elementAt(i)]!;
        String translatedText = await _translate(originalText);
        final hiveTextModel = HiveTextModel(originalText, translatedText, currentDate);
        // final exampleHiveTextModel = HiveTextModel("lol", "xD", "31/12/2023"); for testing the date sorting filter
        box.add(hiveTextModel);
        // box.add(exampleHiveTextModel);
      }
    }

    /*for (SaveModel save in saveList) {
      print(save.toString());
    }*/
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultmodel = ref.watch(resultControllerProvider);
    final resultController = ref.read(resultControllerProvider.notifier);
    var currentDate = DateFormat('d/M/y').format(DateTime.now());

    if (resultController.AnalysnotStarted) {
      resultController.startAnalysisofImage(image);
      resultController.AnalysnotStarted = false;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const Header(title: 'Resultate'),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InfoButton(
                  infoText: "Auf dieser Seite werden die Ergebnisse angezeigt, die du zuvor mit der Kamera gescannt hast. Wähle die gewünschten Ergebnisse aus, indem du die entsprechenden Checkboxen anklickst. Übersetze und speichere die ausgewählten Ergebnisse anschließend mit dem Speichern-Button.",
                ),
              ),
            ),
           Container(
             height: 30,
           child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Container(
                    width: 120,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        //print(resultController.saved);
                        save(resultmodel.identifiedImages, resultController.saved, currentDate);
                        HistoryRoute().go(context);
                      },
                      child: Text('Speichern', style: TextStyle(color: Colors.redAccent)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        side: BorderSide(color: Colors.redAccent, width: 2),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: resultController.toggleSelectAll,
                  child: Text('Alle auswählen', style: TextStyle(color: Colors.redAccent)),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ],
            )
           ),
            Expanded(
              child: resultmodel.lines.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: resultmodel.lines.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              bottom: 20.0,
                              top: 10.0
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        currentDate,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(top: 5, right: 0),
                                      child: CustomCheckbox(
                                        value: resultController.saved[index],
                                        onChanged: (value) {
                                          resultController.toggle(index, currentDate);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child:  Container(
                                        alignment: Alignment.topLeft,
                                          height: 20.0,
                                          child: FractionallySizedBox(
                                            widthFactor: 1,
                                            heightFactor: 1,
                                            child: Image.memory(
                                                imencode(ImageFormat.jpg.ext, resultmodel.lines[index]),
                                                fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                    ),
                                    Spacer()
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
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
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: resultmodel.identifiedImages.length <= index
                                            ? Text("Processing...")
                                            : Text(resultmodel.identifiedImages[resultmodel.lines[index]]!),
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
              ),
            ),
          ],
        ),
      ),
      _ => Center(child: CircularProgressIndicator()) // needed here ?
      }
    );
  }
}