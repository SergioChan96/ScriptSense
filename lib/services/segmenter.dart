
import 'package:flutter/services.dart';
import 'package:opencv_dart/opencv_dart.dart';
import 'package:scriptsense/services/interfaces/isegmenter.dart';

import 'package:scriptsense/services/match_char.dart';


class Segmenter implements ISegmenter {

  Future<Mat> loadImage() async {
    ByteData image = await rootBundle.load('assets/newspaper.jpg');
    return imdecode(image.buffer.asUint8List(), IMREAD_GRAYSCALE);
  }

  @override
  Future<List<Mat>> segmentImage(Mat image) async {
    //Mat image = imdecode(await loadImage(), IMREAD_GRAYSCALE);
    List<Rect> rects = [];
    Mat resized = interpolateDown(image);
    Mat kernel = Mat.ones(1, 6, MatType.CV_8SC1);
    Mat imageDilation = erode(resized, kernel, iterations: 2);
    Mat flippedImg = bitwiseNOT(imageDilation);
    (double, Mat) result = threshold(flippedImg, 127, 255, 0);
    (VecVecPoint, Mat) contoursR = findContours(result.$2, RETR_TREE, CHAIN_APPROX_SIMPLE);
    VecVecPoint contours = contoursR.$1;
    if(contours.isEmpty) {
      print("no contours found");
      return [];
    }
    for (VecPoint contour in contours) {
      Rect r = boundingRect(contour);
      int x = r.x*2; int y = r.y*2; int w = r.width*2; int h = r.height*2;
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
    (int, int) shape = (image.width~/2, image.height~/2);
    return resize(image, shape, interpolation: INTER_AREA);
  }

  @override
  Future<String> detectChar(Mat line) {
    List<Rect> rects = [];
    Mat resized = interpolateDown(line);
    Mat kernel = Mat.ones(2,2, MatType.CV_8SC1);
    Mat imageDilation = erode(resized, kernel, iterations: 2);
    Mat flippedImg = bitwiseNOT(imageDilation);
    (double, Mat) result = threshold(flippedImg, 127, 255, 0);
    (VecVecPoint, Mat) contoursR = findContours(result.$2, RETR_TREE, CHAIN_APPROX_SIMPLE);
    VecVecPoint contours = contoursR.$1;
    if(contours.isEmpty) {
      //return Future<String>();
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
        print("rect: ${rect.width}, ${rect.width}");
        print("Character is too big new method needed");
        continue;
      }
      if (rect.height < 10 || rect.width < 10) {
        print("Character is too small new method needed");
        continue;
      }
      chars.add(line.region(
          Rect(
            rect.width,
            rect.height,
            rect.x,
            rect.y,
          )
      ));
    }
    Future<String> resultString = getString(chars);
    return resultString;
  }

  Future<String> getString(List<Mat> chars) async {
    MatchChar matcher = MatchChar();
    print("Detected Chars: ${chars.length}");
    String sentence = "";
    await matcher.loadDict();
    for (Mat char in chars) {
      sentence += await matcher.match(char);
    }
    print(sentence);
    return sentence;
    /*
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
     */
  }
  Future<Mat> generatedImage() {
    MatchChar matcher = MatchChar();
    return matcher.getCharacterImage("例", Size(100,100));
  }

  Future<(Mat, Mat)> showDetection() async {
    MatchChar matchChar = MatchChar();
    return matchChar.debugDetection();
  }
  Mat debugDetect(Mat line) {
    List<Rect> rects = [];
    Mat resized = interpolateDown(line);
    Mat kernel = Mat.ones(2,2, MatType.CV_8SC1);
    Mat imageDilation = erode(resized, kernel, iterations: 2);
    Mat flippedImg = bitwiseNOT(imageDilation);
    (double, Mat) result = threshold(flippedImg, 127, 255, 0);
    (VecVecPoint, Mat) contoursR = findContours(result.$2, RETR_TREE, CHAIN_APPROX_SIMPLE);
    VecVecPoint contours = contoursR.$1;
    print(contours.length);
    if(contours.isEmpty) {
      //return Future<String>();
    }
    for (VecPoint contour in contours) {
      Rect r = boundingRect(contour);
      int x = r.x*2; int y = r.y*2; int w = r.width*2; int h = r.height*2;

      line = rectangle(line, Rect(x,y,w,h), Scalar.black);
      if (w > 10 && h > 10) {
        rects.add(Rect(x,y,w,h));
      }
    }
    return line;
    List<Mat> chars = [];
    for (Rect rect in rects) {
      if (rect.width == line.width && rect.height == line.height) {
        continue;
      }

      line = rectangle(line, rect, Scalar.red, thickness: 2);
      if (rect.height > rect.width * 2 || rect.width > rect.height * 2) {
        print("rect: ${rect.width}, ${rect.width}");
        print("Character is too big new method needed");
        continue;
      }
      if (rect.height < 10 || rect.width < 10) {
        print("Character is too small new method needed");
        continue;
      }
    }
    return line;
  }
}