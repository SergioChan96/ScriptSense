import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "camera_page_model.freezed.dart";

@freezed
class CameraPageModel with _$CameraPageModel {
  factory CameraPageModel({
    required XFile? picture,
    required Uint8List? convertedPic,
  }) = _CameraPageModel;

  factory CameraPageModel.initial() => CameraPageModel(
    picture: null,
    convertedPic: null
  );
}