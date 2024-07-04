import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:opencv_dart/opencv_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scriptsense/model/result_model.dart';
import 'package:scriptsense/services/segmenter.dart';

part 'result_controller.g.dart';

@riverpod
class ResultController extends _$ResultController {
  bool AnalysnotStarted = true;

  List<bool> saved = [];
  @override
  ResultModel build() {
    return ResultModel.initial();
  }
  Future<void> startAnalysisofImage(String image) async {
    Mat matImage = convertStringtoImage(image);
    Segmenter seg = Segmenter();
    state = state.copyWith(lines: await seg.segmentImage(matImage));
    saved = List.filled(state.lines.length, false);
    Map<Mat, String> map = Map();
    for (Mat mat in state.lines) {
      map[mat] = await seg.detectChar(mat);
      state = state.copyWith(identifiedImages: map);
    }
  }

  Mat convertStringtoImage(String image) {
    Uint8List imageData = base64Decode(image);
    return imdecode(imageData, IMREAD_GRAYSCALE);
  }
  Future<void> debugLines() async {
    Segmenter seg = Segmenter();
    List<Mat> lines = await seg.segmentImage(await seg.loadImage());
    List<Mat> debug = [];
    for (Mat line in lines) {
      debug.add(seg.debugDetect(line));
    }
    state = state.copyWith(lines: debug);
  }
  void toggle(int index) {
     saved[index] = !saved[index];
     state = state.copyWith(lines: state.lines, identifiedImages: state.identifiedImages);
  }
}
