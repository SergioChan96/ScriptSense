import 'package:opencv_dart/opencv_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scriptsense/result_model.dart';
import 'package:scriptsense/segmenter.dart';

part 'result_controller.g.dart';

@riverpod
Future<void> startAnalysisofImage({required final ResultModel model}) async{
  Segmenter seg = Segmenter();
  model.copyWith(lines: await seg.segmentImage());
  Map<Mat, String> map = Map();
  for (Mat mat in model.lines) {
    map[mat] = await seg.detectChar(mat);
    model.copyWith(identifiedImages: map);
  }
}
