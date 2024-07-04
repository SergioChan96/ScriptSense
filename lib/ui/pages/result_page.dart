import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:opencv_dart/opencv_dart.dart';

import 'package:scriptsense/controller/result_controller.dart';
import 'package:scriptsense/model/save_model.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage(this.image, {super.key});
  final String image;

  void save(Map<Mat, String> imageList, List<bool> boolList) {
    List<SaveModel> saveList = [];
    Iterable<Mat> mats = imageList.keys;
    for (int i = 0; i < boolList.length; i++) {
      if (boolList[i]) {
        saveList.add(
            SaveModel(
                Image.memory(imencode(ImageFormat.jpg.ext, mats.elementAt(i))),
                imageList[mats.elementAt(i)]!
            )
        );
      }
    }
    for (SaveModel save in saveList) {
      print(save.toString());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultmodel = ref.watch(resultControllerProvider);
    final resultController = ref.read(resultControllerProvider.notifier);
    if(resultController.AnalysnotStarted) {
      resultController.startAnalysisofImage(image);
      resultController.AnalysnotStarted = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        actions: [
          IconButton(
            onPressed: () {
              save(resultmodel.identifiedImages, resultController.saved);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: switch(resultmodel.lines.isEmpty) {
      false => ListView.builder(
        itemCount: resultmodel.lines.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Checkbox.adaptive(
                        value: resultController.saved[index],
                        onChanged: (value) {
                          resultController.toggle(index);
                        }
                    ),
                  ),
                  Image.memory(imencode(ImageFormat.jpg.ext, resultmodel.lines[index])),
                  const Divider(),
                  switch (resultmodel.identifiedImages.length <= index) {
                    true => Text("Processing..."),
                    _ => Text(resultmodel.identifiedImages[resultmodel.lines[index]]!),
                  }
                ],
              )
          );
        },
      ),
      _ => Center(child: CircularProgressIndicator())
      }
    );
  }
}