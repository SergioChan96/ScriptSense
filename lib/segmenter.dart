import 'dart:ffi' as ffi;
import 'package:flutter/services.dart';
import 'package:opencv_dart/opencv_dart.dart';

class Segmenter {

  Future<Uint8List> loadImage() async {
    ByteData image = await rootBundle.load('assets/newspaper.jpg');
    return image.buffer.asUint8List();
  }

  Future<List<Mat>> segmentImage() async {
    Mat image = imdecode(await loadImage(), IMREAD_GRAYSCALE);
    print(image.shape);
    List<Rect> rects = [];
    Mat resized = interpolateDown(image);
    print(resized.shape);
    Mat kernel = Mat.ones(1, 6, MatType.CV_8SC1);
    Mat imageDilation = erode(resized, kernel, iterations: 2);
    Mat flippedImg = bitwiseNOT(imageDilation);
    (double, Mat) result = threshold(flippedImg, 127, 255, 0);
    (VecVecPoint, Mat) contoursR = findContours(result.$2, RETR_TREE, CHAIN_APPROX_SIMPLE);
    VecVecPoint contours = contoursR.$1;
    print("contour found: ${contours.length}");
    if(contours.isEmpty) {
      print("no contours found");
      return [];
    }
    for (VecPoint contour in contours) {
      Rect r = boundingRect(contour);
      int x = r.x*2; int y = r.y*2; int w = r.width*2; int h = r.height*2;
      print("x: $x, y: $y, w: $w, h: $h");
      if (2*h < w && w > 10 && h > 10) {
        rects.add(Rect(x,y,w,h));
      }
    }
    List<Mat> crops = [];
    for (Rect rect in rects) {
      crops.add(image.region(rect));
    }
    return crops;
  }
  Mat interpolateDown(Mat image) {
    Size shape = (image.width~/2, image.height~/2);
    return resize(image, shape, interpolation: INTER_AREA);
  }
  Future<String> detectChar(Mat line) {
    List<Rect> rects = [];
    Mat resized = interpolateDown(line);
    Mat kernel = Mat.ones(2,2, ffi.Uint8 as MatType);
    Mat imageDilation = erode(resized, kernel, iterations: 2);
    Mat flippedImg = bitwiseNOT(imageDilation);
    (double, Mat) result = threshold(flippedImg, 127, 255, 0);
    (VecVecPoint, Mat) contoursR = findContours(result.$2, RETR_TREE, CHAIN_APPROX_SIMPLE);
    VecVecPoint contours = contoursR.$1;
    if(contours.isEmpty) {
      //return Future<String>().;
    }
    for (VecPoint contour in contours) {
      Rect r = boundingRect(contour);
      int x = r.x*2; int y = r.y*2; int w = r.width*2; int h = r.height*2;
      if (w > 10 && h > 10) {
        rects.add(Rect(x,y,w,h));
      }
    }
    List<Mat> chars = [];
    for (Rect rect in rects) {
      if ([rect.width, rect.height] == line.shape) {
        continue;
      }
      if (rect.height > rect.width * 2 || rect.width > rect.height * 2) {
        print("Character is too big new method needed");
        continue;
      }
      if (rect.height < 10 || rect.width < 10) {
        print("Character is too small new method needed");
        continue;
      }
      chars.add(line.region(
          Rect(
            rect.width + 2,
            rect.height + 2,
            rect.x - 1,
            rect.y - 1,
          )
      ));
    }
    //Future<String> resultString = getString(chars);
    //return resultString;
    return Future(() => "");
  }
  /*
  Future<String> getString(List<Mat> chars) async {
    MatchChar matcher = MatchChar();
    SendPort sendPort = SendPort();
    List<ReceivePort> futures = [];
    for (int i = 0; i < chars.length; i++) {
      futures.add(ReceivePort());
      Isolate.spawn(matcher.match(chars[i]), futures[i].sendPort)
    }
    String result = "";
    for (ReceivePort future in futures) {
      result += future.take(0) as String;
    }
    return result;
  }
  
   */
}