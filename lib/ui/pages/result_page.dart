import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:opencv_dart/opencv_dart.dart';

import 'package:scriptsense/controller/result_controller.dart';
import '../../router/typed_routes.dart';
import '../buttons/custom_checkbox.dart';
import '../buttons/info_button.dart';
import '../components/header.dart';



class ResultPage extends ConsumerWidget {
  const ResultPage(this.image, {super.key});
  final String image;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultmodel = ref.watch(resultControllerProvider);
    final resultController = ref.read(resultControllerProvider.notifier);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if(resultController.AnalysnotStarted) {
      resultController.debugLines();
      //resultController.startAnalysisofImage(image);
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
            Align(
              alignment: Alignment.bottomRight,
              child: InfoButton(
                infoText: "Auf dieser Seite werden die Ergebnisse angezeigt, die du zuvor mit der Kamera gescannt hast. Wähle die gewünschten Ergebnisse aus, indem du die entsprechenden Checkboxen anklickst. Übersetze und speichere die ausgewählten Ergebnisse anschließend mit dem Speichern-Button.",
              ),
            ),
          Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.055),
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.045,
                    child: ElevatedButton(
                      onPressed: () {
                        resultController.save();
                        // stop the matcher
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
                        padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              right: screenWidth * 0.04,
                              bottom: screenHeight * 0.02,
                              top: screenHeight * 0.01
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: screenHeight * 0.005),
                                        child: Text(
                                          resultController.currentDate,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(top: screenHeight * 0.005),
                                      child: CustomCheckbox(
                                        value: resultController.saved[index],
                                        onChanged: (value) {
                                          resultController.toggle(index);
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
                                          height: screenHeight * 0.03,
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
                                  padding: EdgeInsets.only(top: screenHeight * 0.007, bottom: screenHeight * 0.007),
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
                                      padding: EdgeInsets.only(left: screenHeight * 0.01, top: screenHeight * 0.007),
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
    );
  }
}

abstract class IResultController {
  Future<void> startAnalysisofImage(String image);
  Mat convertStringtoImage(String image);
  Future<void> debugLines();
  void toggle(int index);
  void save();
}
