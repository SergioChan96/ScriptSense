import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opencv_dart/opencv_dart.dart';

part 'result_model.freezed.dart';

@freezed
class ResultModel with _$ResultModel {
  factory ResultModel({
    required List<Mat> lines,
    required Map<Mat, String> identifiedImages,
  }) = _ResutModel;

  factory ResultModel.initial() => ResultModel(
    lines: [],
    identifiedImages: <Mat, String>{},
  );
}