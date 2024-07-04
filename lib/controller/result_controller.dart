import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

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
  Future<void> startAnalysisofImage(Uint8List image) async {
    Segmenter seg = Segmenter();
    state = state.copyWith(lines: await seg.segmentImage());
    saved = List.filled(state.lines.length, false);
    Map<Mat, String> map = Map();
    for (Mat mat in state.lines) {
      map[mat] = await seg.detectChar(mat);
      state = state.copyWith(identifiedImages: map);
    }
  }
  Future<void> debugLines() async {
    Segmenter seg = Segmenter();
    List<Mat> lines = await seg.segmentImage();
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
