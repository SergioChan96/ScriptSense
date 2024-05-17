import 'dart:typed_data';

import 'package:chinese_ocr/Segmenter.dart';
import 'package:flutter/material.dart';
import 'package:opencv_dart/opencv_dart.dart';

class Evaluate extends StatefulWidget {
  @override
  State<Evaluate> createState() => _Evaluate();
}
class _Evaluate extends State<Evaluate> {

  List<Uint8List> lineSegments = [];
  Segmenter seg = Segmenter();

  Widget getText(Mat zhoText) {
    return FutureBuilder<String>(
        future: seg.detectChar(zhoText),
        builder:(context, projectSnap2) {
          if (projectSnap2.connectionState ==
              ConnectionState.waiting ||
              !projectSnap2.hasData) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Card(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("update");
                  });
                },
                child: Text("Refresh"),
              ),
            );
          }
          return Text(projectSnap2.data!);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: FutureBuilder<List<Mat>>(
        future: seg.segmentImage(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.waiting ||
              !projectSnap.hasData) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Card(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("update");
                  });
                },
                child: Text("Refresh"),
              ),
            );
          }
          return ListView.builder(
            itemCount: projectSnap.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: [
                    Image.memory(imencode(ImageFormat.jpg.ext, projectSnap.data![index])),
                    Divider(),
                    getText(projectSnap.data![index])
                  ],
                )
              );
            },
          );
        },

      )
    );
  }

}