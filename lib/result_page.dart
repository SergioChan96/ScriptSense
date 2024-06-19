import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scriptsense/result_model.dart';
import 'package:scriptsense/segmenter.dart';
import 'package:flutter/material.dart';
import 'package:opencv_dart/opencv_dart.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final resultModel = ref.watch(resultModelProvider);
        final resultController = ref.read(resultControllerProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Results"),
          ),
          body: switch(resultModel.lines.isEmpty) {
          false => ListView.builder(
            itemCount: resultModel.lines.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(
                    children: [
                      Image.memory(imencode(ImageFormat.jpg.ext, resultModel.lines[index])),
                      const Divider(),
                      switch (resultModel.identifiedImages.isEmpty) {
                        true => CircularProgressIndicator(),
                        _ => Text(resultModel.identifiedImages[resultModel.lines[index]]),
                      }
                    ],
                  )
              );
            },
          ),
          AsyncError() => Text("error try again"),
          _ => CircularProgressIndicator()
          }
        );
      },
    );
  }
}