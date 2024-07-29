import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opencv_dart/opencv_dart.dart';


class MatchChar {
  List<String> validationChar = [];
  /*
  static Future<MatchChar> init() async{
    print("loading json");
    String data = await rootBundle.loadString("assets/dictionary.txt");
    print("loading successful");
    final jsonResult = jsonDecode(data); //latest Dart
    print(jsonResult);
    for(var entry in jsonResult) {
      print("object in dict ${entry.runtimeType}");
    }
    return MatchChar._();
  }
   */
  Future<void> loadDict() async {
    String data = await rootBundle.loadString("assets/dictionary.txt");
    List<String> entrys = data.trim().split("\n");
    for(String entry in entrys) {
      final jsonResult = jsonDecode(entry.trim());
      validationChar.add(jsonResult["character"] as String);
    }
  }

  Future<String> match(Mat char) async {
    final stopwatch = Stopwatch()..start();
    Mat flippedImage = bitwiseNOT(char);
    (double, Mat) thresh = threshold(flippedImage, 127, 255, 0);
    if(thresh.$2.isEmpty) {
      return "";
    }
    String filename = await identify(thresh.$2);
    if (filename.isEmpty) {
      return "";
    }
    print('identification executed in ${stopwatch.elapsed.inSeconds}s');
    return filename;
  }
  Future<String> identify(Mat char) async {
    String bestChar = "";
    int counter = 0;
    double bestxCorr = 0;
    for (String digitalChar in validationChar) {
      counter++;
      if (counter == 10000) {
        break;
      }
      Mat template = await getCharacterImage(digitalChar, Size(char.size[1],char.size[0]));
      Mat cross_correlation = matchTemplate(char, template, TM_CCORR_NORMED);
      (double, double, Point, Point) result = minMaxLoc(cross_correlation);
      if (result.$2 > bestxCorr) {
        bestChar = digitalChar;
        bestxCorr = result.$2;
      }
    }
    return bestChar;
  }

  Future<Mat> getCharacterImage(String char, Size size) async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder, ui.Rect.fromPoints(ui.Offset(0, 0), ui.Offset(size.width.toDouble(), size.height.toDouble())));
    final textPainter = TextPainter(
      text: TextSpan(
        text: char,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width.toDouble(),
          fontFamily: 'CustomFont',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2));
    ui.Picture picture = recorder.endRecording();
    ui.Image img = await picture.toImage(size.width, size.height);
    ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    Mat mat = imdecode(pngBytes, IMREAD_GRAYSCALE);
    return mat;
  }
  Future<(Mat, Mat)> debugDetection() async {
    ByteData byteImage = await rootBundle.load('assets/Make_Complete.png');
    Mat image = imdecode(byteImage.buffer.asUint8List(), IMREAD_GRAYSCALE);
    Mat template = await getCharacterImage("全", Size(image.size[1], image.size[0]));
    print("shape 1:${image.shape}, 2:${template.shape}");
    Mat cross_correlation = matchTemplate(image, template, TM_CCORR_NORMED);
    (double, double, Point, Point) result = minMaxLoc(cross_correlation);
    print("crosscorrelation: ${result.$2}");
    return (template, image);
  }
}