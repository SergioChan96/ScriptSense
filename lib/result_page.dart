import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:opencv_dart/opencv_dart.dart';
import 'package:scriptsense/result_controller.dart';

class ResultPage extends ConsumerWidget {
  bool AnalysnotStarted = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultmodel = ref.watch(resultControllerProvider);
    final resultController = ref.read(resultControllerProvider.notifier);
    if(AnalysnotStarted) {
      resultController.startAnalysisofImage();
      AnalysnotStarted = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: switch(resultmodel.lines.isEmpty) {
      false => ListView.builder(
        itemCount: resultmodel.lines.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Column(
                children: [
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