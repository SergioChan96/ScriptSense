
import 'package:opencv_dart/opencv_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scriptsense/ui/result_model.dart';
import 'package:scriptsense/services/segmenter.dart';

part 'result_controller.g.dart';

@riverpod
class ResultController extends _$ResultController {
  bool AnalysnotStarted = true;
  @override
  ResultModel build() {
    return ResultModel.initial();
  }

  Future<void> startAnalysisofImage() async {
    Segmenter seg = Segmenter();
    state = state.copyWith(lines: await seg.segmentImage());
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
}
