 import 'package:opencv_dart/opencv_dart.dart';

abstract class ISegmenter {
   Future<List<Mat>> segmentImage(Mat image);
   Future<String> detectChar(Mat line);
 }